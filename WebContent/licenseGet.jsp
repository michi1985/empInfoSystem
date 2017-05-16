<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="entity.EmployeeBean" import="java.util.ArrayList"
	import="dao.LicenseGetDAO"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<EmployeeBean> licenseList = (ArrayList<EmployeeBean>) request.getAttribute("Employee2");
	int i = 0;

	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<style>
.head {
	display: flex;
	align-items: center;
}

td {
	padding: 30px;

}

.odd {
	background-color: rgba(3, 169, 244, 0.06);
}

th {
	padding: 30px;
	background-color: rgba(255, 0, 0, 0.22);
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/empSystem.css" rel="stylesheet">
<title>licenseGet.jsp</title>
</head>
<body>
	<div class="head">
		<jsp:include page="rogo.jsp"></jsp:include>
		<h2>資格取得画面</h2>
	</div>
	<hr>

	<div align="center" class="container">
		<table class="table" >
			<tr>
				<th width="120px">従業員コード</th>
				<th>姓</th>
				<th>名</th>
				<th>性別</th>
				<th>部署</th>
				<th width="120px">誕生日</th>
				<th width="120px">入社日</th>
				<th>所持資格</th>
			</tr>
			<%
				@SuppressWarnings("unchecked")
				ArrayList<EmployeeBean> empList = (ArrayList<EmployeeBean>) request.getAttribute("Employee");
				EmployeeBean emp = new EmployeeBean();
				EmployeeBean emp2 = null;
				if (empList != null) {
					for (i = 0; i < empList.size(); i++) {
						emp = empList.get(i);
						String sex = emp.getSex().equals("1") ? "男" : "女";
			%>
			<tr>
				<td class="odd"><%=emp.getEmpCode()%></td>
				<td><ruby><%=emp.getlName()%><rt><%=emp.getlKanaName()%></rt>
					</ruby></td>
				<td class="odd"><ruby><%=emp.getfName()%><rt><%=emp.getfKanaName()%></rt>
					</ruby></td>
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
		<form action="LicenseGetServlet" method="post" style="float: left" class="form-inline">
		<select name="license" class="form-control" >
				<%
					emp2 = new EmployeeBean();
					if (licenseList != null) {
						for (i = 0; i < licenseList.size(); i++) {
							emp2 = licenseList.get(i);
				%>
				<option value="<%=emp2.getLicenseCode()%>"><%=emp2.getLicenseCode() + "：　" + emp2.getLicenseName()%></option>
				<%
						}
					}
				%>
			</select> &nbsp;を&nbsp; <select name="employee" class="form-control" >
				<%
					if (empList != null) {
						for (i = 0; i < empList.size(); i++) {
							emp = empList.get(i);
				%>
				<option value="<%=emp.getEmpCode()%>"><%=emp.getEmpCode() + ". " + emp.getlName()%></option>
				<%
					}
					}
				%>
			</select> に追加します。よろしければ、 <input type="submit" value="取得" name="ACTION">
			</form>

	<br>
	<form action="LicenseSetServlet" method="get">
			<input type="submit" value="資格追加画面" class="form-control btn btn-primary"style="width:20%">
	</form>
		</div>
	<br>
		<jsp:include page="footerY.jsp"></jsp:include>
</body>
</html>
