package com.cm.DisSale.web.agency;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cm.DisSale.exception.AgencyOperationException;
import com.cm.DisSale.pojo.Agency;
import com.cm.DisSale.service.AgencyService;
import com.cm.DisSale.util.CodeUtil;
import com.cm.DisSale.util.HttpServletRequestUtil;
import com.fasterxml.jackson.databind.ObjectMapper;




/** 
* @author 作者 DHL: 
* @version 创建时间：2018年10月7日 下午5:48:19 
* 类说明 
*/
@Controller
@RequestMapping("/agency")
public class AgencyManagementController {
	
	@Autowired
	private AgencyService agencyService;
	
	@RequestMapping(value = "/insertstairagency", method = RequestMethod.POST)
	@ResponseBody
	private Map<String, Object> insertStairAgency(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		// 验证码校验
		if (!CodeUtil.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "输入了错误的验证码");
			return modelMap;
		}
		//1.接受并转换相应的参数
				ObjectMapper mapper=new ObjectMapper();
				Agency agency=null;
				try {
					String agencyStr=HttpServletRequestUtil.getString(request, "agencyStr");
					agency=mapper.readValue(agencyStr, Agency.class);
				} catch (Exception e) {
					modelMap.put("success", false);
					modelMap.put("errMsg", e.getMessage());
					return modelMap;
				}
		
		//2.注册店铺
		if(agency!=null) {
			try {
				agencyService.insertStairAgency(agency);
				modelMap.put("success", true);
			}catch (AgencyOperationException e) {
				modelMap.put("success", false);
				modelMap.put("errMsg", e.getMessage());
			} 
			return modelMap;
		}else {
			modelMap.put("success", false);
			modelMap.put("errMsg", "请输入信息");
			return modelMap;
		}
		
	}
}
