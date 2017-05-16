<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>従業員情報変更完了画面</title>
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
	<jsp:include page="rogo.jsp"></jsp:include>
	<h2>従業員情報変更完了画面</h2>
</div>
<hr>
<div align="center">
		<h1>更新完了しました！</h1>
		<form action="EmployeeServlet" method="POST">
			<input type="submit" value="従業員一覧に戻る" name="ACTION" class="form-control btn btn-success"style="width:20%">
		</form>
	</div>
	<jsp:include page="footerI.jsp"></jsp:include>
	</body>

</html>