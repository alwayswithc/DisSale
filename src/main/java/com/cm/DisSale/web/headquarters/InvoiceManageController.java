package com.cm.DisSale.web.headquarters;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cm.DisSale.pojo.Invoice;
import com.cm.DisSale.service.InvoiceService;

@Controller
@RequestMapping("/invoice")
public class InvoiceManageController {
	@Autowired 
	InvoiceService invoiceService;
	@GetMapping("/addinvoice")
	private String addInvoice(HttpServletRequest request) {
		Integer orderId=Integer.valueOf(request.getParameter("orderId"));
		invoiceService.addInvoice(orderId);
		return "forward:/orderadmin/orderlist";
	}
	
	@GetMapping("/notinvoicelist")
	private ModelAndView queryNotArriveInvoice(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		List<Invoice> invoiceList=invoiceService.queryNotArriveInvoice();
		mv.addObject("invoiceList", invoiceList);
		mv.setViewName("/head/invoicemanage");
		return mv;
	}

	@GetMapping("/invoicelist")
	private ModelAndView queryArriveInvoice(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		List<Invoice> invoiceList=invoiceService.queryArriveInvoice();
		mv.addObject("invoiceList", invoiceList);
		mv.setViewName("/head/invoicemanage");
		return mv;
	}
}
