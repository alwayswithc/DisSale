package com.cm.DisSale.web.headquarters;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/productadmin")
public class ProductAdminController {
	@GetMapping("/edit")
	public String productEdit() {
		return "/head/productedit";
	}
	@GetMapping("/detail")
	public String productDetail() {
		return "/agency/productdetail";
	}

}
