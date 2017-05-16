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
<title>色選択</title>
</head>
<body text="<%= charColor%>" style="background-color: <%= backColor%>">
	<h1 style="color: <%= titleColor%>">色を選択してください</h1>
	<hr>
	<form action="colorSelect" method="get">
		タイトルカラー<input type="color" name="titleColor">
		背景色		  <input type="color" name="backColor">
		フォントカラー<input type="color" name="charColor">
					  <input type="submit" value="決定">
	</form>
	Hello JSP!!

	<table border="">
		<tr><td>アンパン</td></tr>
		<tr><td>職パン</td></tr>
		<tr><td>カレーパン</td></tr>
	</table>
</body>
</html>