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
<title>licenseGetComplete.jsp</title>
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
		<jsp:include page="rogo.jsp" /><h2>資格追加画面</h2>
</div>


<hr>
<div align="center">
<h1>資格を追加しました。</h1>
<form action="LicenseGetServlet" method="post">
	<input type="submit" value="従業員一覧に戻る" name="ACTION"  class="form-control btn btn-success"style="width:20%">
</form>
</div>
<jsp:include page="footerY.jsp"></jsp:include>
</body>
</html>