package com.cm.DisSale.service;

import java.util.List;

import com.cm.DisSale.pojo.Invoice;

public interface InvoiceService {
	// 订单点击发货后生成发货单
	void addInvoice(int orderId);

	// 查询已经到货的发货单
	List<Invoice> queryArriveInvoice();

	// 查询未到货的发货单
	List<Invoice> queryNotArriveInvoice();

}
