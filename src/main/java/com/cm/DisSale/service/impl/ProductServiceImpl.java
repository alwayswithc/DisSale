package com.cm.DisSale.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cm.DisSale.exception.ProductOperationException;
import com.cm.DisSale.mapper.ProductImgMapper;
import com.cm.DisSale.mapper.ProductMapper;
import com.cm.DisSale.pojo.ImageHolder;
import com.cm.DisSale.pojo.Product;
import com.cm.DisSale.pojo.ProductImg;
import com.cm.DisSale.service.ProductService;
import com.cm.DisSale.util.ImageUtil;
import com.cm.DisSale.util.PageCalculator;
import com.cm.DisSale.util.PathUtil;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;
	@Autowired
	ProductImgMapper productImgMapper;

	@Override
	public List<Product> getProductList(Product product, int pageIndex, int pageSize) {
		// 将页码转换成行码
		int rowIndex = PageCalculator.calculateRowIndex(pageIndex, pageSize);
		List<Product> productList = productMapper.queryProductList(product, rowIndex, pageSize);
		return productList;
	}

	@Override
	public int getProductCount(Product product) {
		int productCount = productMapper.queryProductCount(product);
		return productCount;
	}

	@Override
	public Product getProductById(int productId) {
		return productMapper.queryProductById(productId);
	}

	@Override
	@Transactional
	public void modifyProduct(Product product, List<ImageHolder> productImgHolderList) {
		// 空值判断
		if (product != null) {
			// 如果有新存入的商品详情图，则将原先的删除，并添加新的图片
			if (productImgHolderList != null && productImgHolderList.size() > 0) {
				deleteProductImgList(product.getProductId());
				addProductImgList(product, productImgHolderList);
			}
			try {
				// 更新商品信息
				int effectedNum = productMapper.updateProduct(product);
				if (effectedNum <= 0) {
					throw new ProductOperationException("更新商品信息失败");
				}

			} catch (Exception e) {
				throw new ProductOperationException("更新商品信息失败:" + e.toString());
			}
		}
	}

	@Transactional
	public void addProduct(Product product, List<ImageHolder> productImgHolderList) {
		try {
			// 创建商品信息
			int effectedNum = productMapper.insertProduct(product);
			if (effectedNum <= 0) {
				throw new ProductOperationException("创建商品失败");
			}
		} catch (Exception e) {
			throw new ProductOperationException("创建商品失败:" + e.toString());
		}
		// 若商品详情图不为空则添加
		if (productImgHolderList != null && productImgHolderList.size() > 0) {
			addProductImgList(product, productImgHolderList);
		}
		
	}

	/**
	 * 批量添加图片
	 * 
	 * @param product
	 * @param productImgHolderList
	 */
	private void addProductImgList(Product product, List<ImageHolder> productImgHolderList) {
		// 获取图片存储路径，这里直接存放到相应商品的文件夹底下
		String dest = PathUtil.getProductImagePath(product.getProductId());
		List<ProductImg> productImgList = new ArrayList<ProductImg>();
		// 遍历图片一次去处理，并添加进productImg实体类里
		for (ImageHolder productImgHolder : productImgHolderList) {
			String imgAddr = ImageUtil.generateNormalImg(productImgHolder, dest);
			ProductImg productImg = new ProductImg();
			productImg.setImgAddr(imgAddr);
			productImg.setProductId(product.getProductId());
			productImgList.add(productImg);
		}
		// 如果确实是有图片需要添加的，就执行批量添加操作
		if (productImgHolderList.size() > 0) {
			try {
				int effectedNum = productImgMapper.batchInsertProductImg(productImgList);
				if (effectedNum <= 0) {
					throw new ProductOperationException("创建商品详情图片失败");
				}
			} catch (Exception e) {
				throw new ProductOperationException("创建商品详情图片失败:" + e.toString());
			}
		}
	}

	/**
	 * 删除某个商品下的所有详情图
	 * 
	 * @param productId
	 */
	private void deleteProductImgList(int productId) {
		// 根据productId获取原来的图片
		List<ProductImg> productImgList = productImgMapper.queryProductImgList(productId);
		// 干掉原来的图片
		for (ProductImg productImg : productImgList) {
			ImageUtil.deleteFileOrPath(productImg.getImgAddr());
		}
		// 删除数据库里原有图片的信息
		productImgMapper.deleteProductImgByProductId(productId);
	}

}
