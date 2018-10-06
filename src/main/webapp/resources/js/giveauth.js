/**
 * 点击检查手机号，通过正则表达式检查后才可以输入提交授权码
 */
$(function() {
	var giveCodeUrl='/DisSale/head/givecode';
	$('#check').click(
					function() {
						var phone = getQueryString('phone');
						var flag = false;
						var message = "";
						var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
						if (myreg.test(phone)) {
							flag = true;
						}
						if (flag == true) {
							$("#go").removeAttr("disabled");
						} else {
							alert("手机号检查不正确，不能授权");
						}
					});
	$('#go').click(function() {
		$("#inputgroup").css('visibility', 'visible');// 元素显示
	});
	$('#submit').click(function() {
		var id = getQueryString('id');
		var code = $('#code').val();
		$.ajax({
			url : giveCodeUrl,
			type : 'POST',
			dataType : "json",
			data :{
				id:id,
				code:code,
			},
			success : function(data) {
				if (data.success) {
					alert("授权成功！")
				}
			}
		});
	});
		
});