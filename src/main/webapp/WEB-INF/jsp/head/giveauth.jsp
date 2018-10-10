 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>授权页面</title>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
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
	src='../resources/js/commonutil.js' charset='utf-8'></script>
<script type='text/javascript'
	src='../resources/js/giveauth.js' charset='utf-8'></script>
	<script type='text/javascript'
	src='../resources/js/jquery-1.11.2.min.js' charset='utf-8'></script>
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="javascript:history.back(-1)" style="color: gray">返回</a>

	</nav>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h2 class="panel-title">授权验证</h2>
		</div>
		<div class="panel-body" style="text-align: center">
			<button type="button" class="btn btn-default btn-lg" id="check">检
				查 手 机 号</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-success btn-lg" id="go"
				disabled="disabled">
				<span class="glyphicon glyphicon-forward"></span>
			</button>
			<br> <br>
				 <span id="code"></span>
			
		</div>
</body>
</html>