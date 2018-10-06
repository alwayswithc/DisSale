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
		System.out.println("=================================");
		Integer id=Integer.valueOf(request.getParameter("id"));
		String code=request.getParameter("code");
		agencyService.updateAuthCode(id, code);
		ModelMap map=new ModelMap();
		map.addAttribute("success", true);
		return map;	
	}

}
