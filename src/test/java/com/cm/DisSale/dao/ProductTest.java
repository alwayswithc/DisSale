package com.cm.DisSale.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cm.DisSale.BaseTest;
import com.cm.DisSale.mapper.ProductCategoryMapper;
import com.cm.DisSale.mapper.ProductMapper;
import com.cm.DisSale.pojo.Product;
import com.cm.DisSale.pojo.ProductCategory;

public class ProductTest extends BaseTest{
	@Autowired 
	ProductCategoryMapper productCategoryMapper;
	@Autowired
	ProductMapper productmapper;

	public void testqueryProductCategory() {
		List<ProductCategory> list=productCategoryMapper.queryProductCategory();
	}
	@Test
	public void testqueryById() {
		Product product=productmapper.queryProductById(2);
		System.out.println(product.getProductId());
	}
}
