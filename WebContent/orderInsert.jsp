<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J" import="java.util.*,entity.SectionBean"%>
<%
if(session.getAttribute("userId") == null){
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
if(request.getAttribute("sectionList") == null){
	request.getRequestDispatcher("Menu.jsp").forward(request, response);
}

	@SuppressWarnings("unchecked")
	List<SectionBean> list = (ArrayList<SectionBean>)request.getAttribute("sectionList");
	Calendar today = Calendar.getInstance();
	int maxYear = today.get(Calendar.YEAR);
	int maxM = today.get(Calendar.MONTH) + 1;
	String maxMonth = maxM < 10 ? "0" + maxM : String.valueOf(maxM);
	int maxD = today.get(Calendar.DAY_OF_MONTH);
	String maxDay = maxD < 10 ? "0" + maxD : String.valueOf(maxD);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.head{
		display: flex;
		align-items: center;
	}
	table,.button{
		margin-left:auto;
		margin-right: auto;
	}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/empSystem.css" rel="stylesheet">
<script>
	function disp() {
		if (window.confirm('登録してよろしいでしょうか？')) {
		return true;
		}else{
		return false;
		}
	}
</script>
<title>新規登録画面</title>
</head>
<body>
<div class="head">
<jsp:include page="rogo.jsp"></jsp:include>
<h2>情報入力画面</h2>
</div>
<hr>
<div class="container" align="center">
<form action="OrderInsertServlet" method="POST">
	<table class="table" style="width:40%">
	<tr>
		<th><label>氏：</label></th>
		<td><input class="form-control" type="text" name="lName" required="required" maxlength="16"></td>
	</tr>
	<tr>
		<th><label>名：</label></th>
		<td><input class="form-control" type="text" name="fName" required="required" maxlength="16"></td>
	</tr>
	<tr>
		<th><label>氏(カナ)：</label></th>
		<td><input class="form-control" type="text" name="lKanaName" required="required" maxlength="24"></td>
	</tr>
	<tr>
		<th><label>名(カナ)：</label></th>
		<td><input class="form-control" type="text" name="fKanaName" required="required" maxlength="24"></td>
	</tr>
	<tr>
		<th><label>性別：</label></th>
		<td>
			<select class="form-control" name="sex" required="required">
				<option value="1">男</option>
				<option value="2">女</option>
			</select>
		</td>
	</tr>
	<tr>
		<th><label>所属部署：</label></th>
		<td>
			<select class="form-control" name="sectionCode" required="required">
			<%for(SectionBean s : list) { %>
				<option value="<%= s.getSectionCode()%>"><%=s.getSectionName() %></option>
			<%} %>
			</select>
		</td>
	</tr>
	<tr>
		<th><label>生年月日：</label></th>
		<td><input class="form-control" type="date" name="birthDay" required="required" max="<%=maxYear + "-" + maxMonth + "-" + maxDay %>" min="1900-01-01"></td>
	</tr>
	<tr>
		<th><label>入社日：</label></th>
		<td><input class="form-control" type="date" name="empDay" required="required" max="<%=maxYear + "-" + (maxMonth) + "-" + maxDay %>" min="1900-01-01"></td>
	</tr>
	</table>
	<input type="submit" value="登録する" class="form-control btn btn-info" style="width:20%" onClick='return disp()'>
</form>
<form action="EmployeeServlet" method="POST">
		<input type="submit" value="従業員一覧に戻る" name="ACTION" class="form-control btn btn-success" style="width:20%">
	</form>
</div>
<jsp:include page="footerM.jsp"></jsp:include>
</body>
</html>