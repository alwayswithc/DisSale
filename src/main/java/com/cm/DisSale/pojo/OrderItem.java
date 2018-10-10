package com.cm.DisSale.pojo;

import java.io.Serializable;

public class OrderItem implements Serializable{
	private Integer orderItemId;
	private String productName;
	private Integer orderItemNum;
	private Double orderItemPrice;
	private Integer orderId;
	public Integer getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}
	
	public Integer getOrderItemNum() {
		return orderItemNum;
	}
	public void setOrderItemNum(Integer orderItemNum) {
		this.orderItemNum = orderItemNum;
	}
	public Double getOrderItemPrice() {
		return orderItemPrice;
	}
	public void setOrderItemPrice(Double orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	

}
