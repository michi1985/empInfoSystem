package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import entity.EmployeeBean;

/**
 * Servlet implementation class EmployeeServlet
 */
/**
 * 従業員一覧サーブレット
 *
 */
@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Getメソッド
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * Postメソッド
	 * @param url	送り先の指定
	 * @param employee	EmployeeBean型のArrayList
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 送り先の指定用
		String url = null;

		// BeanとDAOの宣言
		ArrayList<EmployeeBean> employee = new ArrayList<EmployeeBean>();
		EmployeeDAO dao = new EmployeeDAO();

		// 一覧表示メソッドの呼び出し
		try {
			// 値を取得
			employee = dao.SelectAll();

		}// 例外処理
		catch(Exception e) {
			System.out.println();
		}

		// requestのスコープ内に挿入
		request.setAttribute("Employee", employee);

		// 一覧表示のページを指定
		url = "selectAll.jsp";

		// 指定したページに投げる
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
