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
		var id = getQueryString('id');
		$.ajax({
			url : giveCodeUrl,
			type : 'POST',
			dataType : "json",
			data :{
				id:id,
			},
		    success : function(data) {
			    if (data.success) {
			    	$('#code').text("成功授权，授权码为:"+data.code);
			    }
			},
		});
	});
	
		
});