$(function() {
	// 从地址栏的URL里获取productId
	var productId = getQueryString('productId');
	// 获取商品信息的URL
	var productUrl = '/DisSale/product/getProductDetail?productId='
			+ productId;
	// 访问后台获取该商品的信息并渲染
	$.getJSON(productUrl, function(data) {
		if (data.success) {
			// 获取商品信息
			var product = data.product;
			// 给商品信息相关HTML控件赋值
            alert(product.simg);
			// 商品缩略图
			$('#product-img').attr('src', product.simg); 
			// 商品名称
			$('#product-name').text(product.productName);
			// 商品简介
			$('#product-desc').text(product.productDesc);
			// 商品价格展示逻辑，主要判断原价现价是否为空 ，所有都为空则不显示价格栏目
			$('#product-price').text('￥' + product.productPrice);

			var imgListHtml = '';
			// 遍历商品详情图列表，并生成批量img标签
			product.productImgList.map(function(item, index) {
				imgListHtml += '<div> <img src="' + item.imgAddr
						+ '" width="100%" /></div>';
			});
			
			$('#imgList').html(imgListHtml);
		}
	});
	
	$.init();
});
