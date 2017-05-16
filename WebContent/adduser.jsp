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
<title>�V�X�e�����p�ғo�^���</title>
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
		if (window.confirm('�o�^���Ă�낵���ł��傤���H')) {
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
		<h2 align="center">�V�X�e�����p�ғo�^</h2>
	</div>
	<hr>
	<form action="AddUserServlet" method="post">
		<div align="center">
			<table class="table" style="width:30%">
				<tr>
					<td>���[�UID</td>
					<td><input type="text" name="USERID" required="required"
						class="form-control" placeholder="���[�UID"></td>
				</tr>
				<tr>
					<td>�p�X���[�h</td>
					<td><input type="password" name="PASSWORD" id="password"
						class="form-control" required="required" placeholder="�p�X���[�h"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="�o�^" class="form-control btn btn-primary"style="width:10%" onClick='return disp()'>
			<input type="reset"value="���Z�b�g" class="form-control btn btn-warning"style="width:10%">
			<!-- �p�X���[�h�\���̐؂�ւ� -->
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
			<input type="checkbox" id="passcheck"/>�p�X���[�h��\��
		</div>
	</form>



</body>
</html>