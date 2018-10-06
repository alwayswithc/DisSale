<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
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
<script type='text/javascript'
	src='../resources/js/jquery-1.11.2.min.js' charset='utf-8'></script>
<script type='text/javascript' src='../resources/js/productlist.js'
	charset='utf-8'></script>
<script type='text/javascript' src='../resources/js/commonutil.js'
	charset='utf-8'></script>
<script type='text/javascript'
	src='../resources/js/jquery-1.11.2.min.js' charset='utf-8'></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand" href="javascript:history.back(-1)"
			style="color: gray">返回</a>

	</nav>
	<img src="../resources/img/8cba839df501e0448f3ecbbc1b060ded.jpg"
		class="img-fluid" alt="Responsive image">
	<br />
	<br />
	<form class="form-inline my-2 my-lg-0" style="margin-left: 10px"
		action="/DisSale/product/query" method="post">
		<input class="form-control mr-sm-2" type="search" placeholder="Search"
			name="queryName">
		<button class="btn btn-outline-success my-2 my-sm-0 btn-success"
			type="submit">Search</button>
	</form>
	<br>
	<div id="searchDiv" style="margin-left: 10px"></div>

	<table class="table table-responsive table-hover">
		<thead>
			<tr>
				<th scope="col">id</th>
				<th scope="col">名字</th>
				<th scope="col">箱数</th>
				<th scope="col">每箱数量</th>
				<th scope="col">价格</th>
				<th scope="col">类别</th>
				<th scope="col">操作</th>
			</tr>
		</thead>
		<tbody id="tab">
			<c:forEach items="${productList}" var="p">
				<tr>
					<td>${p.productId}</td>
					<td>${p.productName}</td>
					<td>${p.productNum}</td>
					<td>${p.productSize}</td>
					<td>${p.productPrice}</td>
					<td>${p.productCategory.productCategoryName}</td>
					<td><a href="/DisSale/productadmin/modify?productId="+${p.productId} >编辑</a> <a href="#">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav>
		<ul class="pagination" style="margin-left: 650px" id="page">

			<!--
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			  -->

		</ul>
	</nav>

</body>
</html>