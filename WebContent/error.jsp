<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<jsp:include page="rogo.jsp" /><h2>エラー</h2>
</div>
<div align="center">
<h1>不当な操作が入力されました。</h1>
<a href="Menu.jsp"><button class="btn">メニューに戻る</button></a>
</div>
<hr>
<jsp:include page="footerI.jsp"></jsp:include>
</body>
</html>