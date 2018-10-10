<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
</head>
<body>
	<div class="page-group">
		<div class="page">
			<header class="bar bar-nav">
				<h1 class="title">分销总部</h1>
			</header>

			<div class="content">
				<!-- 这里是轮播图展示区 -->
				<div class="swiper-container index-banner" data-space-between='10'>
					<div class="swiper-wrapper">
						<div class="swiper-slide img-wrap">
							<img class="banner-img" src="../resources/img/4.PNG" alt="">
						</div>
						<div class="swiper-slide img-wrap">
							<img class="banner-img" src="../resources/img/3.PNG" alt="">
						</div>
						<div class="swiper-slide img-wrap">
							<img class="banner-img" src="../resources/img/2.PNG" alt="">
						</div>
						<div class="swiper-slide img-wrap">
							<img class="banner-img" src="../resources/img/1.PNG" alt="">
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
				<!-- 一级类别展示区域 -->
				<div class="row">
					<div class="col-50 shop-classify">
						<div class='word'>
							<a href="/DisSale/headadmin/agencylist"><p class='shop-title'
									style="margin-left: 50px">经销商管理</p></a>
						</div>
						<div class='shop-classify-img-warp'>
							<img class='shop-img' src="../resources/img/实人认证.png">
						</div>
					</div>
					<div class="col-50 shop-classify">
						<div class='word'>
							<a href="/DisSale/product/list"><p class='shop-title'
									style="margin-left: 50px">产品管理</p></a>
						</div>
						<div class='shop-classify-img-warp'>
							<img class='shop-img' src="../resources/img/商家.png">
						</div>
					</div>
					<div class="col-50 shop-classify">
						<div class='word'>
							<a href="/DisSale/orderadmin/orderlist"><p class='shop-title'
									style="margin-left: 50px">订单管理</p></a>
						</div>
						<div class='shop-classify-img-warp'>
							<img class='shop-img' src="../resources/img/购物车.png">
						</div>
					</div>
					<div class="col-50 shop-classify">
						<div class='word'>
							<a href="/DisSale/invoice/notinvoicelist"><p class='shop-title'
									style="margin-left: 50px">发货管理</p></a>
						</div>
						<div class='shop-classify-img-warp'>
							<img class='shop-img' src="../resources/img/快递运输.png">
						</div>
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
		<script type='text/javascript' src='../resources/js/index.js'
			charset='utf-8'></script>
		<style type="text/css">
.index-banner {
	width: 90%;
	height: 100%;
	padding-bottom: 0.4rem;
}

.img-wrap {
	overflow: hidden;
}

.banner-img {
	width: 100%;
	height: 100%;
}

.total-shop-button {
	height: 1.5rem;
	line-height: 1.5rem;
	padding-left: 1rem;
	margin-bottom: 0.4rem;
	position: relative;
	cursor: pointer;
}

.total-shop-button:before {
	content: '';
	display: inline-block;
	position: absolute;
	left: 0;
	width: 0.15rem;
	height: 1.5rem;
	background-color: #0894ec;
}

.shop-classify {
	height: 3.3rem;
	padding: 0.2rem;
	cursor: pointer;
}

.shop-classify>.word {
	width: 65%;
	height: 100%;
	overflow: hidden;
	float: left;
}

.shop-classify>.word>p {
	margin: 0;
}

.shop-classify>.word>.shop-title {
	margin: 0;
	font-size: 0.8rem;
}

.shop-classify>.word>.shop-desc {
	margin: 0;
	font-size: 0.4rem;
}

.shop-classify>.shop-classify-img-warp {
	width: 30%;
	height: 100%;
	margin-left: 0.4rem;
	display: inline-block;
}

.shop-classify>.shop-classify-img-warp>.shop-img {
	width: 40%;
	height: 60%;
}
</style>
</body>

</html>