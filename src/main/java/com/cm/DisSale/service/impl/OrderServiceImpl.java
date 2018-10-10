package com.cm.DisSale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cm.DisSale.mapper.OrderMapper;
import com.cm.DisSale.pojo.Order;
import com.cm.DisSale.pojo.OrderItem;
import com.cm.DisSale.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<Order> notDeliveredOrder() {

		return orderMapper.notDeliveredOrder();
	}

	@Override
	public List<OrderItem> getOrderDetail(int orderId) {
		return orderMapper.getOrderDetail(orderId);
	}

	@Override
	public Order getOrderById(int orderId) {
		return orderMapper.getOrderById(orderId);
	}
	
	

}
