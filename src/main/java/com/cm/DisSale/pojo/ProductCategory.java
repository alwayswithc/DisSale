package com.cm.DisSale.pojo;

import java.io.Serializable;

public class ProductCategory implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer ProductCategoryId;
	private String ProductCategoryName;
	public Integer getProductCategoryId() {
		return ProductCategoryId;
	}
	public void setProductCategoryId(Integer productCategoryId) {
		ProductCategoryId = productCategoryId;
	}
	public String getProductCategoryName() {
		return ProductCategoryName;
	}
	public void setProductCategoryName(String productCategoryName) {
		ProductCategoryName = productCategoryName;
	}
	

}
