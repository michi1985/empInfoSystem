<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Windows-31J"%>
<%

%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	if(request.getParameter("lName") == null){
		request.getRequestDispatcher("Menu.jsp").forward(request, response);
	}
	String sex = request.getParameter("sex").equals("1") ? "�j" : "��";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�V�K�o�^����</title>
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
		<jsp:include page="rogo.jsp" /><h2>�V�K�o�^�������܂���</h2>
</div>
<hr>
<div align="center">
<table class="table" style="width:30%">
<tr><th>�����F</th><td><%=request.getParameter("lName") + " " + request.getParameter("fName") %></td></tr>
<tr><th>����(�J�i)�F</th><td><%=request.getParameter("lKanaName") + " " + request.getParameter("fKanaName") %></td></tr>
<tr><th>���ʁF</th><td><%=sex %></td></tr>
<tr><th>�a�����F</th><td><%=request.getParameter("birthDay")  %></td></tr>
<tr><th>���Г��F</th><td><%=request.getParameter("empDay")  %></td></tr>
<tr><th>���������F</th><td><%=request.getParameter("sectionCode")  %></td></tr>
</table>
<a href="OrderInsertServlet"><button style="width:12%;margin-left: 44%;margin-right: 44%;margin-top: 20px;" class="form-control btn btn-info">�V�K�o�^�ɖ߂�</button></a>
<form action="EmployeeServlet" method="POST">
		<input type="submit" value="�]�ƈ��ꗗ�ɖ߂�" name="ACTION"  style="width:12%;margin-left: 44%;margin-right: 44%;margin-top: 20px;" class="form-control btn btn-success">
	</form>
</div>
<footer>
<div align="right">&copy;RequestD<img src="img/S,Matsumoto.png" style="width:30px;height:30px;"></div>
</footer>
</body>
</html>