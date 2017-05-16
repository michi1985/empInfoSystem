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
	String sex = request.getParameter("sex").equals("1") ? "男" : "女";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新規登録完了</title>
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
		<jsp:include page="rogo.jsp" /><h2>新規登録完了しました</h2>
</div>
<hr>
<div align="center">
<table class="table" style="width:30%">
<tr><th>氏名：</th><td><%=request.getParameter("lName") + " " + request.getParameter("fName") %></td></tr>
<tr><th>氏名(カナ)：</th><td><%=request.getParameter("lKanaName") + " " + request.getParameter("fKanaName") %></td></tr>
<tr><th>性別：</th><td><%=sex %></td></tr>
<tr><th>誕生日：</th><td><%=request.getParameter("birthDay")  %></td></tr>
<tr><th>入社日：</th><td><%=request.getParameter("empDay")  %></td></tr>
<tr><th>所属部署：</th><td><%=request.getParameter("sectionCode")  %></td></tr>
</table>
<a href="OrderInsertServlet"><button style="width:12%;margin-left: 44%;margin-right: 44%;margin-top: 20px;" class="form-control btn btn-info">新規登録に戻る</button></a>
<form action="EmployeeServlet" method="POST">
		<input type="submit" value="従業員一覧に戻る" name="ACTION"  style="width:12%;margin-left: 44%;margin-right: 44%;margin-top: 20px;" class="form-control btn btn-success">
	</form>
</div>
<footer>
<div align="right">&copy;RequestD<img src="img/S,Matsumoto.png" style="width:30px;height:30px;"></div>
</footer>
</body>
</html>