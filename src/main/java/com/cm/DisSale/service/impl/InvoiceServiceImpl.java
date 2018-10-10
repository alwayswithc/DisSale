package com.cm.DisSale.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cm.DisSale.mapper.InvoiceMapper;
import com.cm.DisSale.mapper.OrderMapper;
import com.cm.DisSale.pojo.Invoice;
import com.cm.DisSale.service.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService {

	@Autowired
	InvoiceMapper invoiceMapper;
	@Autowired
	OrderMapper orderMapper;

	@Override
	@Transactional
	public void addInvoice(int orderId) {
		Invoice invoice = new Invoice();
		invoice.setOrder(orderMapper.getOrderById(orderId));
		invoice.setCreateTime(new Date());
		invoice.setStatus(0);
		orderMapper.updateOrderStatus(orderId);
		invoiceMapper.insertInvoice(invoice);
	}

	@Override
	public List<Invoice> queryArriveInvoice() {
		return invoiceMapper.queryArriveInvoice();
	}

	@Override
	public List<Invoice> queryNotArriveInvoice() {
		return invoiceMapper.queryNotArriveInvoice();
	}

}
