<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%
	if (session.getAttribute("userId") == null) {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>システム利用者登録画面</title>
<style>
.head {
	display: flex;
	align-items: center;
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
</head>
<body>
	<div class="head">
		<jsp:include page="rogo.jsp"></jsp:include>
		<h2 align="center">システム利用者登録</h2>
	</div>
	<hr>
	<form action="AddUserServlet" method="post">
		<div align="center">
			<table class="table" style="width:30%">
				<tr>
					<td>ユーザID</td>
					<td><input type="text" name="USERID" required="required"
						class="form-control" placeholder="ユーザID"></td>
				</tr>
				<tr>
					<td>パスワード</td>
					<td><input type="password" name="PASSWORD" id="password"
						class="form-control" required="required" placeholder="パスワード"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="登録" class="form-control btn btn-primary"style="width:10%" onClick='return disp()'>
			<input type="reset"value="リセット" class="form-control btn btn-warning"style="width:10%">
			<!-- パスワード表示の切り替え -->
			<script src="jquery-2.1.1.min.js"></script>
			<script>
				$(function() {
					$('#passcheck').change(function() {
						if ($(this).prop('checked')) {
							$('#password').attr('type', 'text');
						} else {
							$('#password').attr('type', 'password');
						}
					});
				});
			</script>
			<input type="checkbox" id="passcheck"/>パスワードを表示
		</div>
	</form>



</body>
</html>