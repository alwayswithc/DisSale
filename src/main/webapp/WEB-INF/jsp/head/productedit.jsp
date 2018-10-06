<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品编辑</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
<link rel="stylesheet" href="../resources/css/productmanage.css">
</head>
<body>
<header class="bar bar-nav">
		<h1 class="title">商品编辑</h1>
	</header>
	<div class="content">
		<div class="list-block">
			<ul>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-name"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">商品名称</div>
							<div class="item-input">
								<input type="text" id="product-name">
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">目录</div>
							<div class="item-input">
								<select id="category">
								</select>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">箱数</div>
							<div class="item-input">
								<input type="number" id="product-num" >
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">每箱个数</div>
							<div class="item-input">
								<input type="number" id="product-size">
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">价格</div>
							<div class="item-input">
								<input type="number" id="price" >
							</div>
						</div>
					</div>
				</li>
				
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner detail-img-div">
							<div class="item-title label">详情图片</div>
							<div class="item-input" id="detail-img">
								<input type="file" class="detail-img">
								<!-- <input type="file" class="detail-img" id="detail-img-1">
                                <input type="file" class="detail-img" id="detail-img-2"> -->
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="item-content">
						<div class="item-media">
							<i class="icon icon-form-email"></i>
						</div>
						<div class="item-inner">
							<div class="item-title label">商品描述</div>
							<div class="item-input">
								<textarea id="product-desc"></textarea>
							</div>
						</div>
					</div>
				</li>
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
				<div class="col-50">
					<a href="/DisSale/product/list"
						class="button button-big button-fill button-danger" id="back">返回商品管理</a>
				</div>
				<div class="col-50">
					<a href="#" class="button button-big button-fill" id="submit">提交</a>
				</div>
			</div>
		</div>
	</div>



	<script type='text/javascript'
		src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='../resources/js/common/commonutil.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='../resources/js/productedit.js' charset='utf-8'></script>
</body>
</html>