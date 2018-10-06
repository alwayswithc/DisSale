package com.cm.DisSale.web.headquarters;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/productadmin")
@ResponseBody
public class ProductAdminController {
	@GetMapping("/modify")
	public String productEdit() {
		return "/head/productedit";
	}

}
