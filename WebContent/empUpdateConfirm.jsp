<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import="entity.EmployeeBean,
				 java.util.ArrayList,
				 javax.servlet.http.HttpSession"
%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>従業員情報変更確認画面</title>
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
		<jsp:include page="rogo.jsp" /><h2>従業員情報変更確認画面</h2>
</div>
<div align="center">
		<hr>

		<%
		EmployeeBean emp = new EmployeeBean();
		emp = (EmployeeBean)session.getAttribute("employeeBean");
		%>

		<table class="table" style="width:20%">
			<!--  <tr><td>従業員コード</td><td><%=emp.getEmpCode() %></td></tr>-->
			<tr><td>氏</td><td><%=emp.getlName() %></td></tr>
			<tr><td>名</td><td><%=emp.getfName() %></td></tr>
			<tr><td>氏（フリガナ）</td><td><%=emp.getlKanaName() %></td></tr>
			<tr><td>名（フリガナ）</td><td><%=emp.getfKanaName() %></td></tr>
			<tr><td>性別</td><td><%=emp.getSex() %></td></tr>
			<tr><td>生年月日</td><td><%=emp.getBirthDay() %></td></tr>
			<tr><td>所属コード</td><td><%=emp.getSectionCode() %></td></tr>
			<tr><td>入社日</td><td><%=emp.getEmpDate() %></td></tr>
		</table>

		<br>
		<br>
		<form action="empUpdateServlet" method="post">
			<input type="submit" value="更新" class="form-control btn btn-primary"style="width:20%">
		</form>
		<br>
		<form action="EmployeeServlet" method="POST">
			<input type="submit" value="従業員一覧に戻る" name="ACTION" class="form-control btn btn-success"style="width:20%">
		</form>
	</div>
	<jsp:include page="footerI.jsp"></jsp:include>
	</body>
</html>