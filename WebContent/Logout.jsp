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
		<img src="img/LOGO.png" width="120" height="120"><h2>���O�A�E�g���</h2>
	</div>
		<hr>

		<h2 align="center">����ꂳ�܂ł����I<%=request.getAttribute("userId") %>����</h2>

		<h2 align="center">���O�A�E�g���܂����B</h2>

		<form action="Login.jsp" method="get" align="center">
			<input type ="submit" value="���O�C����ʂ�" class="form-control btn btn-primary" style="width:30%">
		</form>
		<jsp:include page="footerI.jsp"></jsp:include>
	</body>
</html>