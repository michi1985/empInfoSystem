package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpDeleteDAO;

/**
 * Servlet implementation class EmpInsertServlet
 */
@WebServlet("/EmpDeleteServlet")
public class EmpDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// sessionを生成と削除
		HttpSession s = request.getSession();
		String empcode = (String) s.getAttribute("empcode");
		s.removeAttribute("empcode");

		// DAOのインスタンス生成
				EmpDeleteDAO dao = new EmpDeleteDAO();
				String deleteName = dao.delete(empcode);

				request.setAttribute("DeleteName", deleteName);

				RequestDispatcher rd = request.getRequestDispatcher("deleteComplete.jsp");
				rd.forward(request, response);

	}

}
