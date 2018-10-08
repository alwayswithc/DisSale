<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
		<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
		<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
		<!--<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
		<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>    -->
    </head>
    <body>
    	<header class="bar bar-nav">
  			<h1 class='title'>表单</h1>
		</header>
		<div class="content">
		  <div class="list-block">
		    <ul>
		      <!-- Text inputs -->
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-name"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">账户</div>
		            <div class="item-input">
		              <input type="text" id="account" placeholder="Account">
		            </div>
		          </div>
		        </div>
		      </li>
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-password"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">密码</div>
		            <div class="item-input">
		              <input type="password" id="oldpassword" placeholder="Password" class="">
		            </div>
		          </div>
		        </div>
		      </li>
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-password"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">确认密码</div>
		            <div class="item-input">
		              <input type="password" id="password" placeholder="Confirm password" class="">
		            </div>
		          </div>
		        </div>
		      </li>
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-name"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">电话</div>
		            <div class="item-input">
		              <input type="text" placeholder="Phone" id="phone">
		            </div>
		          </div>
		        </div>
		      </li>
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-name"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">地址</div>
		            <div class="item-input">
		              <input type="text" placeholder="Address" id="address">
		            </div>
		          </div>
		        </div>
		      </li>
		      <li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-gender"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">级别</div>
		            <div class="item-input" id="level">
		              <select>
		                <option>1</option>
		                
		              </select>
		            </div>
		          </div>
		        </div>
		      </li>
		      <!-- Date -->
		      <!--<li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-calendar"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">生日</div>
		            <div class="item-input">
		              <input type="date" placeholder="Birth day" value="2014-04-30">
		            </div>
		          </div>
		        </div>
		      </li>-->
		      <!-- Switch (Checkbox) -->
		      <!--<li>
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-toggle"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">开关</div>
		            <div class="item-input">
		              <label class="label-switch">
		                <input type="checkbox">
		                <div class="checkbox"></div>
		              </label>
		            </div>
		          </div>
		        </div>
		      </li>-->
		      <!--<li class="align-top">
		        <div class="item-content">
		          <div class="item-media"><i class="icon icon-form-comment"></i></div>
		          <div class="item-inner">
		            <div class="item-title label">文本域</div>
		            <div class="item-input">
		              <textarea></textarea>
		            </div>
		          </div>
		        </div>
		      </li>-->
		      <!--<li id="verifyPart">
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<label for="j_captcha" class="item-title label">验证码</label> <input
								id="j_captcha" name="j_captcha" type="text"
								class="form-control in" placeholder="验证码" />
							<div class="item-input">
								<img id="captcha_img" alt="点击更换" title="点击更换"
									onclick="changeVerifyCode(this)" src="../Kaptcha" />
							</div>
						</div>
					</div>
				</li>-->
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<label for="j_captcha" class="item-title label">验证码</label> <input
								id="j_captcha" name="j_captcha" type="text"
								class="form-control in"/>
							<div class="item-input">
								<img id="captcha_img" alt="点击更换" title="点击更换"
									onclick="changeVerifyCode(this)" src="../Kaptcha" />
							</div>
						</div>
					</div>
				</li>
		    </ul>
		  </div>
		  <div class="content-block">
		    <div class="row">
		      <div class="col-50"><a href="#" class="button button-big button-fill button-danger" id="back">取消</a></div>
		      <div class="col-50"><a href="#" class="button button-big button-fill button-success" id="submit">提交</a></div>
		    </div>
		  </div>
		</div>
 	</body>
 	<script type='text/javascript'
		src='../resources/js/insertStairAgency.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='../resources/js/commonutil.js' charset='utf-8'></script>
</html>