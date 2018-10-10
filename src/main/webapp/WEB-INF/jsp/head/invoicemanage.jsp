<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发货管理</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script type='text/javascript' src='../resources/js/commonutil.js'
	charset='utf-8'></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/DisSale/headadmin/index">返回</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false" 
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="/DisSale/invoice/notinvoicelist">待收货</a></li>
				<li class="nav-item"><a class="nav-link" href="/DisSale/invoice/invoicelist">已收货</a>
				</li>
			</ul>
		</div>
	</nav> 
	<table class="table table-sm table-hover" style="width: 80%; margin: auto">
		<thead>
			<tr>
				<th scope="col">id</th>
				<th scope="col">订单编号</th>
				<th scope="col">发货时间</th>
				<th scope="col">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${invoiceList}" var="ni"> 
			  <tr>
			  <td>${ni.invoiceId}</td>
			  <td>${ni.order.orderId}</td>
			  <td><fmt:formatDate value="${ni.createTime}" type="both" pattern="EEEE, MMMM d, yyyy HH:mm:ss "/></td>
			  <td><a href="/DisSale/order/getorderDetial?orderId=${ni.order.orderId}">查看订单详情</a>
			  <td>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>