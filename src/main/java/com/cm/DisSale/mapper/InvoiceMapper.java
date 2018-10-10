package com.cm.DisSale.mapper;

import java.util.List;

import com.cm.DisSale.pojo.Invoice;

public interface InvoiceMapper {

	//订单点击发货后生成发货单
	int insertInvoice(Invoice invoice);
	
	//查询已经到货的发货单
	List<Invoice> queryArriveInvoice(); 
	
	//查询未到货的发货单
	List<Invoice> queryNotArriveInvoice(); 
}
