package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LicenseDAO;

/**
 * Servlet implementation class LicenseGetServlet
 */
/**
 *
 */
@WebServlet("/LicenseSetServlet")
public class LicenseSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("licenseSet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 文字コードのセット
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		// 値を格納
		String licenseCode = request.getParameter("licenseCode");
		String licenseName = request.getParameter("licenseName");

		// DAOの宣言
		LicenseDAO dao = new LicenseDAO();

		// 資格セットメソッドの呼び出し
		dao.SetLicense(licenseCode, licenseName);

		// 指定した先に処理を任せる
		RequestDispatcher rd = request.getRequestDispatcher("licenseSetComp.jsp");
		rd.forward(request, response);

	}

}
