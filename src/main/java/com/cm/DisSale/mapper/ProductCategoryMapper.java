package com.cm.DisSale.mapper;

import java.util.List;

import com.cm.DisSale.pojo.ProductCategory;

public interface ProductCategoryMapper {
	/**
	 *  商品种类查询
	 * @return
	 */
	List<ProductCategory> queryProductCategory();

}
