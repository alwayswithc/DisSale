package com.cm.DisSale.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable{
	private Integer orderId;
	private Double totalPrice;
	private Date createTime;
	private Integer status;  //0表示未发货，1表示已发货
	private Agency agency;
	private List<OrderItem> orderItemList;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Agency getAgency() {
		return agency;
	}
	public void setAgency(Agency agency) {
		this.agency = agency;
	}

}
