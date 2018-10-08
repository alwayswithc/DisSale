package com.cm.DisSale.web.agency;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/** 
* @author 作者 DHL: 
* @version 创建时间：2018年10月7日 下午7:46:07 
* 类说明 
*/
@Controller
@RequestMapping("/agencyadmin")
public class AgencyAdminController {
	@RequestMapping(value="/insertstairagency")
	public String shopOperation() {
		return "agency/insertStairAgency";
	}
}
