<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
	<%String titleColor = "";
	String backColor = "";
	String charColor = "";

	if(request.getAttribute("titleColor") != null){
		titleColor = (String)request.getAttribute("titleColor");
	}

	if(request.getAttribute("backColor") != null){
		backColor = (String)request.getAttribute("backColor");
	}

	if(request.getAttribute("charColor") != null){
		charColor = (String)request.getAttribute("charColor");
	}
	%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<style>
</style>
<title>�F�I��</title>
</head>
<body text="<%= charColor%>" style="background-color: <%= backColor%>">
	<h1 style="color: <%= titleColor%>">�F��I�����Ă�������</h1>
	<hr>
	<form action="colorSelect" method="get">
		�^�C�g���J���[<input type="color" name="titleColor">
		�w�i�F		  <input type="color" name="backColor">
		�t�H���g�J���[<input type="color" name="charColor">
					  <input type="submit" value="����">
	</form>
	Hello JSP!!

	<table border="">
		<tr><td>�A���p��</td></tr>
		<tr><td>�E�p��</td></tr>
		<tr><td>�J���[�p��</td></tr>
	</table>
</body>
</html>