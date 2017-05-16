package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// エンコーディングの指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		String action = request.getParameter("ACTION");

		// loginjspからログインで転送されてきた場合
		if("ログイン".equals(action)) {

			String userid = request.getParameter("USERID");
			String userpassword = request.getParameter("PASSWORD");

			UserBean user = new UserBean();
			String url = null;

			// DAOをインスタンス化
			UserDAO dao = new UserDAO();

			// DAOからのreturnをuserに格納
			try {
				user = dao.login(userid, userpassword);
				String userId = user.getUserId();

				// DBから検索が出来たかどうかで分岐して転送
				if(userId != null) {

					// sessionにユーザ名を登録
					HttpSession session = request.getSession();
					session.setAttribute("userId", userId);

					url ="/Menu.jsp";

				} else {
					//
					url = "/LoginFailure.jsp";
				}
			} catch(Exception e) {
				System.out.println("処理結果：登録エラーが発生しました。");
			}

			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);

		// menu.jspからログアウトで転送されて来た場合
		} else if("ログアウト".equals(action)) {

			// sessionに登録されているデータをsetAttribute
			HttpSession session = request.getSession();
			String userName = (String)session.getAttribute("userId");
			request.setAttribute("userId", userName);

			// sessionデータを破棄
			session.invalidate();

			RequestDispatcher rd = request.getRequestDispatcher("Logout.jsp");
			rd.forward(request, response);
		}
	}

}
