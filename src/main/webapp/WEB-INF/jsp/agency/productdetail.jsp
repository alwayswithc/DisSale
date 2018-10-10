<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
<link rel="stylesheet"
	href="../resources/css/productdetail.css">
</head>
<body>
<div class="page-group">
		<div class="page">
			<header class="bar bar-nav">
				<a class="button button-link button-nav pull-left" external href="#"
					onClick="javascript :history.back(-1);" data-transition='slide-out'>
					<span class="icon icon-left"></span> 返回
				</a>
				<h1 class="title" id="product-name">商品详情</h1>
			</header>
			
			<div class="content infinite-scroll infinite-scroll-bottom"
				data-distance="100">
				<!-- 这里是页面内容区 -->
				<div class="shop-detail-dev">
					<div class="card">
						<div valign="bottom"
							class="card-header color-white no-border no-padding">
							<img class="card-cover" id="product-img" src="" alt="" />
						</div>
						<div class="card-content">
							<div class="card-content-inner">	
					
								 <span><font color="gray" size="4" id="product-price"></font></span>
							
								<p id="product-desc"></p>
							</div>
						</div>
						<div class="card-img" id="imgList">
							<!-- <a href="#" class="link">赞</a> -->
							<!-- <a href="#" class="link">更多</a> -->
						</div>
					</div>
				</div>
			</div>

		<script type='text/javascript'
			src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
		<script type='text/javascript'
			src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
		<script type='text/javascript'
			src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js'
			charset='utf-8'></script>
		<script type='text/javascript' src='../resources/js/commonutil.js'
			charset='utf-8'></script> 
		<script type='text/javascript'
			src='../resources/js/productdetail.js' charset='utf-8'></script>
		
</body>  
</html>