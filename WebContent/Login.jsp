<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>ログイン画面</title>
		<style>
		th{
			text-align: right;
		}
		table{
			margin-left: auto;
			margin-right: auto;
		}
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
		<img src="img/LOGO.png" width="120" height="120"><h2 align="center">ログイン画面</h2>
	</div>
	<div class="content">
		<hr>

		<h2 align="center">ユーザIDとパスワードを入力してください。</h2>

		<form action="LoginServlet" method="post">
		<table class="table" style="width:25%">

			<tr>
			<th>
			ユーザID：</th><td><input type ="text" name="USERID" class="form-control"></td></tr>
			<tr><th>パスワード：</th><td><input type ="password" name="PASSWORD"  class="form-control"></td></tr>
		</table>
		<h3 align="center"><input type ="submit" value="ログイン" name="ACTION" class="form-control btn btn-success" style="width:20%"></h3>
		</form>
	</div>
	</body>
	<jsp:include page="footerI.jsp"></jsp:include>
</html>