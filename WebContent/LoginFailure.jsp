<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; Windows-31J">
		<title>Insert title here</title>
		<style>
		.head{
			display: flex;
			align-items: center;
		}
		</style>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/empSystem.css" rel="stylesheet">
	</head>
	<body>
	<div class="head">
		<img src="img/LOGO.png" width="120" height="120"><h2>ログイン失敗画面</h2>
	</div>
		<hr>

		<h2 align="center">ログインに失敗しました。</h2>

		<form action="Login.jsp" method="get">
			<h3 align="center"><input type ="submit" value="ログイン画面へ"></h3>
		</form>
<jsp:include page="footerI.jsp"></jsp:include>
</html>