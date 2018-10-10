<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
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
<script type='text/javascript' src='../resources/js/orderlist.js'
	charset='utf-8'></script>
<script type='text/javascript'
	src='../resources/js/jquery-1.11.2.min.js' charset='utf-8'></script>
<script type='text/javascript' src='../resources/js/commonutil.js'
	charset='utf-8'></script>
</head>
<body>
<img src="../resources/img/e95d409c679875cfadd5a2465e839741.jpg"
		class="img-fluid" alt="Responsive image">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/DisSale/headadmin/index">返回</a>
	</nav>
	<table class="table table-sm table-hover" style="width: 80%; margin: auto">
		<thead>
			<tr>
				<th scope="col">id</th>
				<th scope="col">总价</th>
				<th scope="col">经销商编号</th>
				<th scope="col">下单时间</th>
				<th scope="col">操作</th>
			</tr>
		</thead>
		<tbody id="tab">

		</tbody>
	</table>
	
</body>
</html>