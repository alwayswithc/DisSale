package com.cm.DisSale.web.headquarters;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cm.DisSale.pojo.Agency;
import com.cm.DisSale.service.AgencyService;


@ResponseBody
@Controller
@RequestMapping("/head")
public class HeadManageController {
	@Autowired
	AgencyService agencyService;
	@GetMapping("/authAgency")
	public ModelMap listAuthAgency() {
		List<Agency> authlist=agencyService.listAuthAgency();
		ModelMap map=new ModelMap();
		map.addAttribute("authAgency",authlist);
		map.addAttribute("success", true);
		return map;
	}
	@GetMapping("/noauthAgency")
	public ModelMap listNoAuthAgency() {
		List<Agency> noauthlist=agencyService.listNoauthAgency();
		ModelMap map=new ModelMap();
		map.addAttribute("noauthAgency",noauthlist);
		map.addAttribute("success", true);
		return map;
	}
	@GetMapping("/allAgency")
	public ModelMap listAllAgency() {
		List<Agency> alllist=agencyService.listAllAgency();
		ModelMap map=new ModelMap();
		map.addAttribute("allAgency", alllist);
		map.addAttribute("success", true);
		return map;
	}
	@PostMapping("/givecode")
	public ModelMap giveCode(HttpServletRequest request){
		String code=null;
		Integer id=Integer.valueOf(request.getParameter("id"));
		Agency agency=agencyService.queryAgencyById(id);
		//判断是不是一级经销商，是的话给三位数授权码
		if(agency.getAgencyLevel()==1) {
			int i=(int)(Math.random()*900)+100;
			code=String.valueOf(i);	
		}else {
			//获取上级经销商id
			int higherAgencyid=agency.getHigherAgencyId();
			//根据上级经销商id得到上级经销商对象
			Agency higherAgency=agencyService.queryAgencyById(higherAgencyid);
			//获取上级经销商的授权码
			String higherAgencyCode=higherAgency.getAuthCode();
			int i=(int)(Math.random()*900)+100;
			String tempcode=String.valueOf(i);	
			code=higherAgencyCode+"."+tempcode;
		}
		agencyService.updateAuthCode(id, code);
		ModelMap map=new ModelMap();
		map.addAttribute("code", code);
		map.addAttribute("success", true);
		return map;	
	}
	 
	
}
