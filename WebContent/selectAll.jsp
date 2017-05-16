<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="entity.EmployeeBean" import="java.util.ArrayList"%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<style>
td{
	padding: 30px;
}
.head{
	display: flex;
	align-items: center;
}
.odd{
	background-color: rgba(3, 169, 244, 0.06);
}
th{
	padding: 30px;
	text-align: center;
	background-color: rgba(255, 0, 0, 0.22);
}
</style>
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/empSystem.css" rel="stylesheet">
<title>selectAll</title>
</head>
<body>
<div class="head">
<jsp:include page="rogo.jsp"></jsp:include>
	<h2>�]�ƈ��ꗗ</h2>
	</div>
	<hr>

	<div align="center" class="content">
	<div class="container">
		<table class="table">
		<tr>
			<th width="120px">�]�ƈ��R�[�h</th><th>��</th><th>��</th>
			<th>����</th>
			<th>����</th><th  width="120px">�a����</th><th  width="120px">���Г�</th><th>�������i</th>
		</tr>
			<%
				@SuppressWarnings("unchecked")
				ArrayList<EmployeeBean> empList = (ArrayList<EmployeeBean>) request.getAttribute("Employee");
				EmployeeBean emp = new EmployeeBean();
				if (empList != null) {
					for (int i = 0; i < empList.size(); i++) {
						emp = empList.get(i);
						String sex = emp.getSex().equals("1") ? "�j" : "��";
			%>
			<tr>
				<td class="odd"><%=emp.getEmpCode()%></td>
				<td><ruby><%=emp.getlName()%><rt><%=emp.getlKanaName()%></rt></ruby></td>
				<td class="odd"><ruby><%=emp.getfName()%><rt><%=emp.getfKanaName()%></rt></ruby></td>
				<td><%=sex%></td>
				<td class="odd"><%=emp.getSectionName()%></td>
				<td><%=emp.getBirthDay()%></td>
				<td class="odd"><%=emp.getEmpDate()%></td>
				<td><%=emp.getLicenseName()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</div>
	<br>
	<br>
	<div class="container">
	<form action="EmpDecisionServlet" method="post" class="form-inline">
		<select name="employee" class="form-control" style="width:120px;">

			<%
				for (int i = 0; i < empList.size(); i++) {
					emp = empList.get(i);
			%>

			<option value="<%=emp.getEmpCode()%>"><%=emp.getEmpCode() + ". " + emp.getlName()%></option>
			<%
				}
			%>

		</select>
<input type="submit" value="�폜" name="ACTION" class="form-control btn btn-danger">
<input type="submit" value="�ύX" name="ACTION" class="form-control btn btn-success">


		</form>

	<form action="OrderInsertServlet" method="get">
			<h4 align ="center"><input type ="submit" value="�V�K�o�^" class="form-control btn btn-info" style="width:20%"></h4>
		</form>

	</div>


</div>
<jsp:include page="footerH.jsp"></jsp:include>
</body>
</html>