package com.cm.DisSale.web.headquarters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.cm.DisSale.exception.ProductOperationException;
import com.cm.DisSale.pojo.ImageHolder;
import com.cm.DisSale.pojo.Product;
import com.cm.DisSale.pojo.ProductCategory;
import com.cm.DisSale.service.ProductCategoryService;
import com.cm.DisSale.service.ProductService;
import com.cm.DisSale.util.CodeUtil;
import com.cm.DisSale.util.HttpServletRequestUtil;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/product")
public class ProductManageController {
	private static final int IMAGEMAXCOUNT = 0;
	@Autowired
	ProductService productService;
	@Autowired
	ProductCategoryService productCategoryService;

	@GetMapping("/list")
	public ModelAndView productList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int pageSize = 5;
		int pageIndex = 1;
		Product productCondition = new Product();
		// 获取页码
		String page = request.getParameter("page");
		if (StringUtils.isNotBlank(page)) {
			pageIndex = Integer.valueOf(page);
		}
		String productCategoryId = request.getParameter("categoryid");
		// 判断是否有传入类别id
		if (StringUtils.isNotBlank(productCategoryId)) {
			ProductCategory productCategory = new ProductCategory();
			productCategory.setProductCategoryId(Integer.valueOf(productCategoryId));
			productCondition.setProductCategory(productCategory);
		}
		List<Product> productList = productService.getProductList(productCondition, pageIndex, pageSize);
		mv.addObject("productList", productList);
		mv.setViewName("/head/productlist");
		return mv;
	}

	// 获取商品总数以确定页数
	@PostMapping("/count")
	@ResponseBody
	public ModelMap getproductCount(HttpServletRequest request) {
		ModelMap map = new ModelMap();
		Product productCondition = new Product();
		String productCategoryId = request.getParameter("categoryid");
		// 判断是否有传入类别id
		if (StringUtils.isNotBlank(productCategoryId)) {
			ProductCategory productCategory = new ProductCategory();
			productCategory.setProductCategoryId(Integer.valueOf(productCategoryId));
			productCondition.setProductCategory(productCategory);
		}
		int productCount = productService.getProductCount(productCondition);
		map.addAttribute("count", productCount);
		map.addAttribute("success", true);
		return map;
	}

	// 获取类别表
	@GetMapping("/categoryList")
	@ResponseBody
	public ModelMap getproductCategory() {
		ModelMap map = new ModelMap();
		List<ProductCategory> productCategoryList = productCategoryService.getProductCategoryList();
		map.addAttribute("categoryList", productCategoryList);
		map.addAttribute("success", true);
		return map;
	}

	// 获取模糊查询结果
	@PostMapping("/query")
	public ModelAndView queryList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int pageSize = 100;
		int pageIndex = 1;
		Product productCondition = new Product();
		String queryName = request.getParameter("queryName");
		if (StringUtils.isNotBlank(queryName)) {
			productCondition.setProductName(queryName);
		}
//		// 获取页码
//		String page = request.getParameter("page");
//		if (StringUtils.isNotBlank(page)) {
//			pageIndex = Integer.valueOf(page);
//		}
		List<Product> productList = productService.getProductList(productCondition, pageIndex, pageSize);
//		// 获取条数用于高级查询后的分页
//		int productCount = productService.getProductCount(productCondition);
//		mv.addObject("count", productCount);
		mv.addObject("productList", productList);
		mv.setViewName("/head/productlist");
		return mv;
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public ModelMap modifyProduct(HttpServletRequest request) {
		ModelMap modelMap = new ModelMap();
		// 验证码判断
		if (!CodeUtil.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "输入了错误的验证码");
			return modelMap;
		}
		// 接收前端参数的变量的初始化，包括商品，缩略图，详情图列表实体类
		ObjectMapper mapper = new ObjectMapper();
		Product product = null;
		List<ImageHolder> productImgList = new ArrayList<ImageHolder>();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 若请求中存在文件流，则取出相关的文件（包括缩略图和详情图）
		try {
			if (multipartResolver.isMultipart(request)) {
				 handleImage(request, productImgList);
			}
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("errMsg", e.toString());
			return modelMap;
		}
		try {
			String productStr = HttpServletRequestUtil.getString(request, "productStr");
			// 尝试获取前端传过来的表单string流并将其转换成Product实体类
			product = mapper.readValue(productStr, Product.class);
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("errMsg", e.toString());
			return modelMap;
		}
		// 非空判断
		if (product != null) {
			try {
				// 开始进行商品信息变更操作
				productService.modifyProduct(product, productImgList);
		        modelMap.put("success", true);
			} catch (RuntimeException e) {
				modelMap.put("success", false);
				modelMap.put("errMsg", e.toString());
				return modelMap;
			}
		} else {
			modelMap.put("success", false);
			modelMap.put("errMsg", "请输入商品信息");
		}
		return modelMap;
		
	}
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	private Map<String, Object> addProduct(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		// 验证码校验
		if (!CodeUtil.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "输入了错误的验证码");
			return modelMap;
		}
		// 接收前端参数的变量的初始化，包括商品，缩略图，详情图列表实体类
		ObjectMapper mapper = new ObjectMapper();
		Product product = null;
		ImageHolder thumbnail = null;
		List<ImageHolder> productImgList = new ArrayList<ImageHolder>();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		try {
			// 若请求中存在文件流，则取出相关的文件（包括缩略图和详情图）
			if (multipartResolver.isMultipart(request)) {
				 handleImage(request, productImgList);
			} else {
				modelMap.put("success", false);
				modelMap.put("errMsg", "上传图片不能为空");
				return modelMap;
			}
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("errMsg", e.toString());
			return modelMap;
		}
		try {
			String productStr = HttpServletRequestUtil.getString(request, "productStr");
			// 尝试获取前端传过来的表单string流并将其转换成Product实体类
			product = mapper.readValue(productStr, Product.class);
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("errMsg", e.toString());
			return modelMap;
		}
		// 若Product信息，缩略图以及详情图列表为非空，则开始进行商品添加操作
		if (product != null && productImgList.size() > 0) {
			try {
				// 执行添加操作
				productService.addProduct(product, productImgList);
				modelMap.put("success", true);
			} catch (ProductOperationException e) {
				modelMap.put("success", false);
				modelMap.put("errMsg", e.toString());
				return modelMap;
			}
		} else {
			modelMap.put("success", false);
			modelMap.put("errMsg", "请输入商品信息");
		}
		return modelMap;
	}
	
	@GetMapping("/getproductbyid")
	@ResponseBody
	public ModelMap getProductById(HttpServletRequest request) {
		ModelMap map=new ModelMap();
		String id=request.getParameter("productId");
		if(StringUtils.isNotBlank(id)) {
			int productid=Integer.valueOf(id);
			Product p=productService.getProductById(productid);
			List<ProductCategory> productCategoryList = productCategoryService.getProductCategoryList();
			map.addAttribute("categoryList", productCategoryList);
			map.addAttribute("product", p);
			map.addAttribute("success", true);
			return map;
		}
		map.addAttribute("success", false);
		return map;	
	}
	
	private void handleImage(HttpServletRequest request, List<ImageHolder> productImgList)
			throws IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 取出详情图列表并构建List<ImageHolder>列表对象，最多支持六张图片上传
		for (int i = 0; i < IMAGEMAXCOUNT; i++) {
			CommonsMultipartFile productImgFile = (CommonsMultipartFile) multipartRequest.getFile("productImg" + i);
			if (productImgFile != null) {
				// 若取出的第i个详情图片文件流不为空，则将其加入详情图列表
				ImageHolder productImg = new ImageHolder(productImgFile.getOriginalFilename(),
						productImgFile.getInputStream());
				productImgList.add(productImg);
			} else {
				// 若取出的第i个详情图片文件流为空，则终止循环
				break;
			}
		}
	}

}
