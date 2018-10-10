package com.cm.DisSale.mapper;

import java.util.List;

import com.cm.DisSale.pojo.Order;
import com.cm.DisSale.pojo.OrderItem;

public interface OrderMapper {
	
	//列出所有未发货的订单
	List<Order> notDeliveredOrder();
	
	//订单详情查询
	List<OrderItem> getOrderDetail(int orderId);
	
	//根据id查询订单
	Order getOrderById(int orderId);
	
	//改订单状态从0到1表示订单发货
	int updateOrderStatus(int orderId);

}
