<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>Menuๆส</title>
		<style>
			input{
				width: 30%;
				height: 10%;
			}
			form{
				margin-top:3%;
			}
			.content{
				background: url("img/back.png");
			}
		</style>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/empSystem.css" rel="stylesheet">
	</head>
	<body>
	<div class="head">
		<jsp:include page="rogo.jsp" /><h2>j[ๆส</h2>
	</div>

	<div class="content">

		<h2 align="center">ๆคฑปI<%=session.getAttribute("userId")%>ณ๑</h2>

		<form action="EmployeeServlet" method="POST">
			<h3 align ="center"><input type ="submit" value="]ฦ๕ว" class="form-control btn btn-primary" style="width:30%"></h3>
		</form>

		<form action="LicenseGetServlet" method="post">
			<h3 align="center">
				<input type="submit" value="iว" name="ACTION" class="form-control btn btn-primary" style="width:30%">
			</h3>
		</form>

		<form action="AddUserServlet" method="get">
			<h3 align="center">
				<input type="submit" value="วาo^"  class="form-control btn btn-primary" style="width:30%">
			</h3>
		</form>

		<form action="LoginServlet" method="post">
			<h3 align ="center"><input type ="submit" value ="OAEg" name="ACTION" class="form-control btn btn-primary" style="width:30%"></h3>
		</form>

<jsp:include page="footerI.jsp"></jsp:include>
</div>
	</body>
</html>