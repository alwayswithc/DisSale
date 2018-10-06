package com.cm.DisSale.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cm.DisSale.pojo.Product;

public interface ProductMapper {

	/**
	 * 分页查询商品，可输入的条件有：商品名(模糊) 商品类别
	 * 
	 * @param productCondition
	 * @param rowIndex
	 *            从第几行开始取数据
	 * @param pageSize
	 *            返回的条数
	 * @return
	 */
	List<Product> queryProductList(@Param("productCondition") Product product, @Param("rowIndex") int rowIndex,
			@Param("pageSize") int pageSize);
	/**
	 * queryProductList返回的总数
	 * 
	 * @param shopCondition
	 * @return
	 */
	int queryProductCount(@Param("productCondition") Product product);
	
	/**
	  *  根据id获取商品信息
	 *  @param productId
	 *  @return Product
	 */
	Product queryProductById(int productId);
	/**
	 * 
	   *    修改商品信息
	 *   @param Product
	 */ 
	int updateProduct(Product product);
	
	int insertProduct(Product product);

}
