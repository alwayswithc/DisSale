package com.cm.DisSale.web.headquarters;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cm.DisSale.pojo.Order;
import com.cm.DisSale.pojo.OrderItem;
import com.cm.DisSale.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderManageController {
	@Autowired 
	OrderService orderService;
	@ResponseBody
	@GetMapping("/orderlist")
	private ModelMap orderList() {
		ModelMap map=new ModelMap();
		List<Order> orderlist=orderService.notDeliveredOrder();
		map.addAttribute("orderlist", orderlist);
		map.addAttribute("success", true);
		return map;
	}
	@GetMapping("/getorderDetial")
	private ModelAndView getOrderDetial(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView(); 
		String id=request.getParameter("orderId");
		int orderId=Integer.valueOf(id);
		Order o=orderService.getOrderById(orderId);
		List<OrderItem> orderItem=orderService.getOrderDetail(orderId);
		mv.addObject("order", o);
		mv.addObject("orderItem",orderItem);
		mv.setViewName("/head/orderdetail");
		return mv;	
	}

}
