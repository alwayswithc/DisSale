package com.cm.DisSale.pojo;

import java.io.Serializable;
import java.util.Date;

//发货单
public class Invoice implements Serializable{
	private Integer invoiceId;
	private Integer status;  //0表示待收货，1表示已收货
	private Date createTime;
	private Order order;
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Integer getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(Integer invoiceId) {
		this.invoiceId = invoiceId;
	}	

}
