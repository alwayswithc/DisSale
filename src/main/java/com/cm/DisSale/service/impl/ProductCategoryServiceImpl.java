package com.cm.DisSale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cm.DisSale.mapper.ProductCategoryMapper;
import com.cm.DisSale.pojo.ProductCategory;
import com.cm.DisSale.service.ProductCategoryService;
@Service
public class ProductCategoryServiceImpl implements ProductCategoryService{

	@Autowired
	ProductCategoryMapper productCategoryMapper;
	@Override
	public List<ProductCategory> getProductCategoryList() {
		List<ProductCategory> productCategoryList=productCategoryMapper.queryProductCategory();
		return productCategoryList;
	}
}
