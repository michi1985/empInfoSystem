package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.EmployeeBean;

/**
 * 従業員情報更新内容確認画面へ遷移させるサーブレット
 */
@WebServlet("/empUpdateConfirmServlet")
public class EmpUpdateConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * 更新データをsessionに格納して転送させる
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// エンコーディングの指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		EmployeeBean emp = new EmployeeBean();

		// emp にユーザが更新したデータを格納
		emp.setEmpCode(request.getParameter("empCode"));
		emp.setlName(request.getParameter("lName"));
		emp.setfName(request.getParameter("fName"));
		emp.setlKanaName(request.getParameter("lKanaName"));
		emp.setfKanaName(request.getParameter("fKanaName"));
		emp.setSex(request.getParameter("sex"));
		emp.setBirthDay(request.getParameter("birthDay"));
		emp.setSectionCode(request.getParameter("sectionCode"));
		emp.setEmpDate(request.getParameter("empDate"));

		// session にempを格納
		HttpSession session = request.getSession();
		session.setAttribute("employeeBean", emp);

		RequestDispatcher rd = request.getRequestDispatcher("empUpdateConfirm.jsp");
		rd.forward(request, response);
	}

}
