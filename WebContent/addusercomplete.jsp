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
		<style>
			.head{
				display: flex;
				align-items: center;
			}
		</style>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/empSystem.css" rel="stylesheet">
<title>addusercomplete.jsp</title>
</head>
<body>
<div class="head">
	<jsp:include page="rogo.jsp"></jsp:include>
	<h2>1件の管理者情報を登録しました。</h2>
</div>
<hr>
	<%
		String userid = (String)request.getAttribute("Userid");
	 %>
	 <h1 align="center">ユーザID：<%=userid %></h1>
	 <form action="AddUserServlet" method="get">
			<h3 align="center">
				<input type="submit" value="管理者登録にもどる" class="form-control btn btn-success"style="width:20%">
			</h3>
		</form>
		<jsp:include page="footerY.jsp"></jsp:include>
</body>
</html>