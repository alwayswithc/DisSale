$(function() {
	var insertAgencyUrl = '/DisSale/agency/insertstairagency';
	
	
	$("#account").blur(function(){
		  var account=$('#account').val();
		  if(account==null||account==undefined||account==""){
			  $.toast('不能为空！');
		  }
		});
	
	$("#oldpassword").blur(function(){
		  var oldpassword=$('#oldpassword').val();
		  if(oldpassword==null||oldpassword==undefined||oldpassword==""){
			  $.toast('不能为空！');
		  }
		});
	
	
	$("#password").blur(function(){
		  var oldpassword=$('#oldpassword').val();
		  var password=$('#password').val();
		  if(oldpassword!=password){
			  $.toast('两次密码不一样！');
		  }
		});
	
	$('#submit').click(function() {
				//创建对象
				var agency = {};
				agency.agencyName = $('#account').val();
				agency.agencyPassword = $('#password').val();
				agency.phone = $('#phone').val();
				/*agency.agencyLevel = $('#level').val();*/
				agency.agencyAddress = $('#address').val();
				/*agency.agencyLevel = {
					agencyLevel : $('#level').find('option').not(
							function() {
								return !this.selected;
							}).data('value')
				};*/
				agency.agencyLevel = $('#level').find('option').not(
						function() {
							return !this.selected;
						}).data('value');
				
				// 生成表单对象，用于接收参数并传递给后台
				var formData = new FormData();
				/*formData.append('agency', agency);*/
				
				formData.append('agencyStr', JSON.stringify(agency));
				
				// 获取表单里输入的验证码
				var verifyCodeActual = $('#j_captcha').val();
				if (!verifyCodeActual) {
					$.toast('请输入验证码！');
					return;
				}
				formData.append("verifyCodeActual", verifyCodeActual);
				
				$.ajax({
					url : insertAgencyUrl,
					type : 'POST',
					data : formData,
					contentType : false,
					processData : false,
					cache : false,
					success : function(data) {
						if (data.success) {
							$.toast('提交成功！');
							window.location.href = "/DisSale/agencyadmin/insertstairagency";
						} else {
							$.toast('提交失败！'+ data.errMsg);
							$('#captcha_img').click();
							
						}
					}
				});
			});
});