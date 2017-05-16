<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<%@ page import="entity.EmployeeBean,
			java.util.*,
			java.util.ArrayList,
			entity.SectionBean"
%>
<%
Calendar today = Calendar.getInstance();
int maxYear = today.get(Calendar.YEAR);
int maxM = today.get(Calendar.MONTH) + 1;
String maxMonth = maxM < 10 ? "0" + maxM : String.valueOf(maxM);
int maxD = today.get(Calendar.DAY_OF_MONTH);
String maxDay = maxD < 10 ? "0" + maxD : String.valueOf(maxD);
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
		<title>従業員情報変更画面</title>
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
	<h2>従業員情報変更画面</h2>
</div>
<hr>
<div align="center">

		<%
		EmployeeBean emp = new EmployeeBean();
		emp = (EmployeeBean)request.getAttribute("employeeBean");
		String sex = emp.getSex();
		String sectionCode = emp.getSectionCode();
		@SuppressWarnings("unchecked")
		List<SectionBean> list = (ArrayList<SectionBean>)request.getAttribute("sectionList");
		%>

		<form action="empUpdateConfirmServlet" method="post">
		<input type="hidden" name="empCode" value="<%=request.getParameter("employee") %>">
		<table class="table" style="width: 40%">
			<tr><td>従業員コード</td><td><%=request.getParameter("employee") %></td></tr>
			<tr><td>氏</td><td><input type="text" value="<%=emp.getlName() %>" name="lName" required="required" maxlength="16" class="form-control"></td></tr>
			<tr><td>名</td><td><input type="text" value="<%=emp.getfName() %>" name="fName" required="required" maxlength="16" class="form-control"></td></tr>
			<tr><td>氏（フリガナ）</td><td><input type="text" value="<%=emp.getlKanaName() %>" name="lKanaName" required="required" maxlength="24" class="form-control"></td></tr>
			<tr><td>名（フリガナ）</td><td><input type="text" value="<%=emp.getfKanaName() %>" name="fKanaName" required="required" maxlength="24" class="form-control"></td></tr>
			<tr><td>性別</td><td>
				<select name="sex" required class="form-control">
					<option value="1" <%if(sex.equals("1")){%> <%="selected" %> <%} %>>男</option>
					<option value="2" <%if(sex.equals("2")){%> <%="selected" %> <%} %>>女</option>
				</select></td></tr>
			<tr><td>生年月日</td><td><input type="date" value="<%=emp.getBirthDay() %>" name="birthDay" class="form-control" max="<%=maxYear + "-" + maxMonth + "-" + maxDay %>" min="1900-01-01"></td></tr>
			<tr><td>所属コード</td><td>
				<select name="sectionCode" class="form-control">
					<%for(SectionBean s:list ) {%>
					<option value="<%= s.getSectionCode()%>"<%if(s.getSectionCode().equals(emp.getSectionCode())){%> <%="selected" %> <%} %>><%=s.getSectionCode() +"："+ s.getSectionName() %></option>
					<%} %>
				</select></td></tr>
			<tr><td>入社日</td><td><input type="date" value="<%=emp.getEmpDate() %>" name="empDate" class="form-control" max="<%=maxYear + "-" + maxMonth + "-" + maxDay %>" min="1900-01-01"></td></tr>
		</table>

		<br>
		<br>
			<input type="submit" value="更新" class="form-control btn btn-primary"style="width:20%">
		</form>
		<form action="EmployeeServlet" method="POST">
			<input type="submit" value="従業員一覧に戻る" class="form-control btn btn-success"style="width:20%" name="ACTION">
		</form>
	</div>
	<jsp:include page="footerI.jsp"></jsp:include>
	</body>
</html>