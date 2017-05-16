package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpUpdateDAO;
import entity.EmployeeBean;

/**
 * 従業員情報を更新するサーブレット
 */
@WebServlet("/empUpdateServlet")
public class EmpUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * 従業員情報を更新する
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// エンコーディングの指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		HttpSession session = request.getSession();

		EmployeeBean emp = new EmployeeBean();
		emp = (EmployeeBean)session.getAttribute("employeeBean");

		EmpUpdateDAO dao = new EmpUpdateDAO();
		int count = 0;

		// 更新処理が成功したらcountに1が格納される
		count = dao.empUpdate(emp);

		if(count < 0) {

			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);

		} else if(count == 1) {

			RequestDispatcher rd = request.getRequestDispatcher("empUpdateComplete.jsp");
			rd.forward(request, response);

		}
	}

}
