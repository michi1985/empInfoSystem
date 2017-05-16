package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddUserDAO;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("adduser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// エンコーディングの指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");
		// 初期化
		String url = "addusercomplete.jsp";

		// DAOのインスタンス生成
		AddUserDAO dao = new AddUserDAO();

		// JSPから値を取得する
		String userid = (String) request.getParameter("USERID");
		String password = (String) request.getParameter("PASSWORD");

		if (userid.length() != 0 && password.length() != 0) {
			// DAOで登録処理をする
			try {
				dao.addUser(userid, password);
				request.setAttribute("Userid", userid);
			} catch (Exception e) {
				url = "error.jsp";
			}


		} else {
			// エラー画面を表示
			url = "error.jsp";
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
