$(function() {
	// 获取全部经销商列表
	var getAllAgencyUrl = '/DisSale/head/allAgency';
	// 获取已授权经销商列表
	var getAuthAgencyUrl = '/DisSale/head/authAgency';
	// 获取未授权经销商列表
	var getNoAuthAgencyUrl = '/DisSale/head/noauthAgency';

	// 渲染出全部经销商
	getAllAgencyData();

	function getAllAgencyData() {
		$.getJSON(getAllAgencyUrl, function(data) {
			if (data.success) {
				var dataList = data.allAgency;
				var html = '';
				// 遍历列表，拼接出表格
				dataList.map(function(item, index) {
					html += '<tr>' + '<td>' + item.agencyId + '</td>' + '<td>'
							+ item.agencyName + '</td>' + '<td>' + item.phone
							+ '</td>' + '<td>' + item.agencyLevel + '</td>'
							+ '<td>' + item.authCode + '</td>' + '<td>'
							+ new Date(item.registTime).Format("yyyy-MM-dd hh:mm:ss") + '</td>' + '</tr>';
				});
				// 将拼接好的类别标签嵌入前台的html组件里
				$('#tab').html(html);
			}
		});
	}
	//点击"全部"触发事件
	$('#all').click(function(){
		$('#tab').empty();
		getAllAgencyData();
	});
	// 渲染出已授权经销商
	function getAuthAgencyData() {
		$.getJSON(getAuthAgencyUrl, function(data) {
			if (data.success) {
				var dataList = data.authAgency;
				var html = '';
				// 遍历列表，拼接出表格
				dataList.map(function(item, index) {
					html += '<tr>' + '<td>' + item.agencyId + '</td>' + '<td>'
							+ item.agencyName + '</td>' + '<td>' + item.phone
							+ '</td>' + '<td>' + item.agencyLevel + '</td>'
							+ '<td>' + item.authCode + '</td>' + '<td>'
							+ new Date(item.registTime).Format("yyyy-MM-dd hh:mm:ss") + '</td>' + '</tr>';
				});
				// 将拼接好的类别标签嵌入前台的html组件里
				$('#tab').html(html);
			}
		});
	}
	//点击"已授权"触发事件
	$('#auth').click(function(){
		$('#tab').empty();
		getAuthAgencyData();
	});
	// 渲染出未授权经销商
	function getNoAuthAgencyData() {
		$.getJSON(getNoAuthAgencyUrl, function(data) {
			if (data.success) {
				var dataList = data.noauthAgency;
				var html = '';
				// 遍历列表，拼接出表格
				dataList.map(function(item, index) {
					html += '<tr>' + '<td>' + item.agencyId + '</td>' + '<td>'
							+ item.agencyName + '</td>' + '<td>' + item.phone
							+ '</td>' + '<td>' + item.agencyLevel + '</td>'
							+ '<td>' + item.authCode + '</td>' + '<td>'
							+ new Date(item.registTime).Format("yyyy-MM-dd hh:mm:ss") + '</td>' + 
							'<td>' + '<a href="/DisSale/headadmin/giveauth?id='+item.agencyId+'&phone='+item.phone+'" id="give">授权</a>' + '</td>' +'</tr>';
				}); 
				// 将拼接好的类别标签嵌入前台的html组件里
				$('#tab').html(html);
			}
		});
	}
	//点击"未授权"触发事件
	$('#noauth').click(function(){
		$('#tab').empty();
		getNoAuthAgencyData();
	});
	
});