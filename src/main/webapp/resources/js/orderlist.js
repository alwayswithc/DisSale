$(function() {
	
	var getOrderListUrl = '/DisSale/order/orderlist';
	getOrderListData();
	function getOrderListData() {
		$.getJSON(getOrderListUrl, function(data) {
			if (data.success) { 
				var dataList = data.orderlist;
				var html = '';
				// 遍历列表，拼接出表格
				dataList.map(function(item, index) { 
					html += '<tr>' + '<td>' + item.orderId + '</td>' 
					  + '<td>'+ item.totalPrice + '</td>'
					  + '<td>' + item.agency.agencyId+ '</td>' 
					  + '<td>'+ new Date(item.createTime).Format("yyyy-MM-dd hh:mm:ss") + '</td>' 
					  +'<td>' +'<a href="/DisSale/order/getorderDetial?orderId='+item.orderId+'">查看详情</a>'+'&nbsp;'
					  +'<a href="/DisSale/invoice/addinvoice?orderId='+item.orderId+'" id="add">发货</a>'
					  + '</td>'+'</tr>';
				});
				// 将拼接好的类别标签嵌入前台的html组件里
				$('#tab').html(html);
			}
		});
	}
	
});