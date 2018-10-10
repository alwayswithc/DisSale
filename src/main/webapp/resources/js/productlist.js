/**
 * 控制列表下的页码
 */
$(function() {
	var getProductCountUrl = '/DisSale/product/count';
	var getProductCategorylist = '/DisSale/product/categoryList';
    var deleteUrl='/DisSale/product/delete';
		
	// 获取页码数
	getPageCount();
	// 获取类别搜索的信息
	getCategorySearch();

	function getPageCount() {
		var categoryid = getQueryString('categoryid');
		$.ajax({
			url : getProductCountUrl,
			type : 'POST',
			dataType : "json",
			data : {
				categoryid : categoryid,
			},
			success : function(data) {
				if (data.success) {
					var count = data.count;
					var pagecount = Math.ceil(count / 5);
					var html = '';
					for (i = 1; i <= pagecount; i++) {
						html += '<li>' + '<a href="/DisSale/product/list?page='
								+ i + '">' + i + '</a>' + '</li>';
					}
					$('#page').html(html);
				}
			}
		});
	}

	function getCategorySearch() {
		$.getJSON(getProductCategorylist, function(data) {
			if (data.success) {
				var html = '';
				data.categoryList.map(function(item, index) {
					html += '<button class="btn btn-default btn-sm">'
							+ '<a href="/DisSale/product/list?categoryid='
							+ item.productCategoryId + '">'
							+ item.productCategoryName + '</a>' + '</button>';
				});
				$('#searchDiv').html(html);
			}
		});
	}
	 
	

});