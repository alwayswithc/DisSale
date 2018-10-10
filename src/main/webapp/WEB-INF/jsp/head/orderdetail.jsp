<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单详情</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
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
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="javascript:history.back(-1)" style="color: gray">返回</a>

	</nav>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h2 class="panel-title">订单详情</h2>
		</div>
		<div class="panel-body" style="text-align: center">
			<b>商品</b>:
			<c:forEach items="${orderItem}" var="oi">
			     ${oi.productName} x ${oi.orderItemNum}=${oi.orderItemPrice}<br>
			</c:forEach>
			<b>总价：</b>${order.totalPrice}<br>
			<b>下单人：</b>${order.agency.agencyName}<br>
			<b>收货地址：</b>${order.agency.agencyAddress}<br>
			<b>联系电话：</b>${order.agency.phone}<br>
			<b>下单时间：</b><fmt:formatDate value="${order.createTime}" type="both" pattern="EEEE, MMMM d, yyyy HH:mm:ss "/>
		</div>	
<body>

</body>
</html>