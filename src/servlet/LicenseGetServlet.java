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
import dao.LicenseGetDAO;
import entity.EmployeeBean;

/**
 * Servlet implementation class LicenseGetServlet
 */
@WebServlet("/LicenseGetServlet")
public class LicenseGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("licenseGet.jsp").forward(request, response);
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
		// submitボタンの使い分け
		String action = (String) request.getParameter("ACTION");
		String url = null;

		// BeanとDAOの宣言
		ArrayList<EmployeeBean> employee = new ArrayList<EmployeeBean>();
		EmployeeDAO dao = new EmployeeDAO();

		ArrayList<EmployeeBean> employee2 = new ArrayList<EmployeeBean>();
		LicenseGetDAO dao2 = new LicenseGetDAO();

		// 一覧表示メソッドの呼び出し
		try {
			// 値を取得
			employee = dao.SelectAll();
			employee2 = dao2.LicenseGet();

			// requestのスコープ内に挿入
			request.setAttribute("Employee", employee);
			request.setAttribute("Employee2", employee2);
		} catch (Exception e) {
			System.out.println("");
		}
		if ("資格管理".equals(action) || "従業員一覧に戻る".equals(action)) {
			url = "licenseGet.jsp";
		} else if ("取得".equals(action)) {
			try {
				// JSPから値を取得する
				String license = (String) request.getParameter("license");
				String empCode = (String) request.getParameter("employee");
				// 資格のupdate処理
				dao2.License(license, empCode);
			} catch (Exception e) {

			}
			url = "licenseGetComplete.jsp";
		}
		// 指定したページに投げる
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}
}
