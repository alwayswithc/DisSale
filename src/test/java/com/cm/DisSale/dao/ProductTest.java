package com.cm.DisSale.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cm.DisSale.BaseTest;
import com.cm.DisSale.mapper.ProductCategoryMapper;
import com.cm.DisSale.pojo.ProductCategory;

public class ProductTest extends BaseTest{
	@Autowired 
	ProductCategoryMapper productCategoryMapper;
	@Test
	public void testqueryProductCategory() {
		List<ProductCategory> list=productCategoryMapper.queryProductCategory();
	}
}
