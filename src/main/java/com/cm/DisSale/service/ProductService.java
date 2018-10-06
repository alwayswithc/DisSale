package com.cm.DisSale.service;

import java.util.List;

import com.cm.DisSale.pojo.ImageHolder;
import com.cm.DisSale.pojo.Product;


public interface ProductService {

	List<Product> getProductList(Product product, int pageIndex, int pageSize);

	int getProductCount(Product product);
	
	Product getProductById(int productId);
	
	/**
	 * 修改商品信息以及图片处理
	 * 
	 */
	void modifyProduct(Product product, List<ImageHolder> productImgHolderList); 
	
	void addProduct(Product product, List<ImageHolder> productImgHolderList);

}
