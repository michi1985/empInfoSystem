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
<title>�폜�������</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/empSystem.css" rel="stylesheet">
<style>
.head{
	display: flex;
	align-items: center;
}
</style>
</head>
<body>
<div class="head">
	<jsp:include page="rogo.jsp"></jsp:include>
	<h2>�폜�������</h2>
</div>
<hr>
<div align="center">
<h1>�P���̃��R�[�h�폜���܂����B</h1>
	<br>
	<form action="EmployeeServlet" method="POST">
		<input type="submit" value="�]�ƈ��ꗗ�ɖ߂�" name="ACTION" class="form-control btn btn-success"style="width:20%">
	</form>
</div>
	<jsp:include page="footerY.jsp"></jsp:include>
</body>
</html>