package com.cm.DisSale.service;

import java.util.List;

import com.cm.DisSale.pojo.Order;
import com.cm.DisSale.pojo.OrderItem;

public interface OrderService {
	// 列出所有未发货的订单
	List<Order> notDeliveredOrder();

	// 订单详情查询
	List<OrderItem> getOrderDetail(int orderId);

	// 根据id查询订单
    Order getOrderById(int orderId); 

}
