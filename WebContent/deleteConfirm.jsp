<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%
	if(session.getAttribute("userId") == null){
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
<%@page
	import=" java.io.IOException,
	java.sql.SQLException,
 java.io.PrintWriter,
 java.sql.Connection,
 java.sql.PreparedStatement,
  java.sql.ResultSet,
  java.sql.PreparedStatement,

 dao.ConnectionManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<style>
th{
	text-align: right;
}
.head{
	display: flex;
	align-items: center;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/empSystem.css" rel="stylesheet">
<title>�폜�m�F���</title>
</head>
<body>
<div align="center">
<div class="head">
	<jsp:include page="rogo.jsp"></jsp:include>
	<h2>�폜�m�F���</h2>
</div>
<hr>
	<%
		// �����R�[�h�ݒ�
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		// JSP�Ńp�����[�^�󂯎��
		String empcode = request.getParameter("employee");

		// �Z�b�V������empcode���ꎞ�ۑ�����
		session.setAttribute("empcode", empcode);

		// ���O�C��
		ConnectionManager cm = ConnectionManager.getInstance();

		// PrintWriter pw = response.getWriter();

		String sql = "SELECT * FROM m_employee WHERE emp_code=?";
		try (Connection con = cm.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			// �H�ɒl������
			pstmt.setString(1, empcode);
			// �X�V�n����
			ResultSet res = pstmt.executeQuery();
			if (res.next()) {
				String lname = res.getString("l_name");
				String fname = res.getString("f_name");
				String lkananame = res.getString("l_kana_name");
				String fkananame = res.getString("f_kana_name");
				String sex = res.getString("sex").equals("1") ? "�j" : "��";
				String birthday = res.getString("birth_day");
				String sectioncode = res.getString("section_code");
				String empdate = res.getString("emp_date");
	%>
	<%-- �폜�m�F�\��  --%>
	<table class="table " style="width: 20%">
		<tr><th>�]�ƈ��R�[�h:</th><td><%=empcode%></td></tr>
		<tr><th>��:</th><td><%=lname%></td></tr>
		<tr><th>��:</th><td><%=fname%></td></tr>
		<tr><th>���i�t���K�i�j:</th><td><%=lkananame%></td></tr>
		<tr><th>���i�t���K�i�j:</th><td><%=fkananame%></td></tr>
		<tr><th>����:</th><td><%=sex%></td></tr>
		<tr><th>���N����:</th><td><%=birthday%></td></tr>
		<tr><th>�����R�[�h:</th><td><%=sectioncode%></td></tr>
		<tr><th>���Г�:</th><td><%=empdate%></td></tr>
	</table>


	<%
		}
			//30���ۑ��ł���Session�������ɃZ�b�g����
			//out.print(session.getId());
			/*session.setAttribute("empcode ", empcode);
			session.setAttribute("lname", lname);
			session.setAttribute("fname", fname);
			session.setAttribute("lkananame", lkananame);
			session.setAttribute("fkananame", fkananame);
			session.setAttribute("sex", sex);
			session.setAttribute("birthday", birthday);
			session.setAttribute("sectioncode", sectioncode);
			session.setAttribute("empdate", empdate);*/
		} catch (SQLException e) {

		}
	%>



	<br>
	<br>
	<form action="EmpDeleteServlet" method="POST">
		<input type="submit" value="�폜" name="DELETE" class="form-control btn btn-danger" style="width:20%">
	</form>
	<br>
	<form action="EmployeeServlet" method="POST">
		<input type="submit" value="�]�ƈ��ꗗ�ɖ߂�" name="ACTION" class="form-control btn btn-success" style="width:20%">
	</form>
		<jsp:include page="footerY.jsp"></jsp:include>
</div>
</body>
</html>