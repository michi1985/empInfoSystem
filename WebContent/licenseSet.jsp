<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>���i�ǉ����</title>
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
		<jsp:include page="rogo.jsp" /><h2>���i�ǉ����</h2>
</div>
<div align="center">

	<hr>


	<form action="LicenseSetServlet" method="post">
	<table class="table"style="width:25%;">
	<tr><th>���i�R�[�h</th><td><input type="text" name="licenseCode" required="required" placeholder="L0000" maxlength="5"></td></tr>
	<tr><th>���i�̖��O</th><td><input type="text" name="licenseName" maxlength="100" required="required" ></td></tr>
	</table>
	<br>
	<input type="submit" value="�ǉ�"  class="form-control btn btn-primary"style="width:10%">
	</form>
	<form action="LicenseGetServlet" method="post">
	<input type="submit" value="�]�ƈ��ꗗ�ɖ߂�" name="ACTION" class="form-control btn btn-success"style="width:10%">
</form>

</div>
<jsp:include page="footerH.jsp"></jsp:include>
</body>
</html>