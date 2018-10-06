package com.cm.DisSale.web.headquarters;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/headadmin")
public class HeadAdminController {
	@GetMapping("/index")
	public String headIndex() {
		return "/head/index";
	}
	@GetMapping("/agencylist")
	public String agencyList(){
		return "/head/agencyList";
	}
	@GetMapping("/giveauth")
	public String giveAuth(){
		return "/head/giveauth";
		
	} 
}
