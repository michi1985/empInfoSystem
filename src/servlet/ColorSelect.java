package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/colorSelect")
public class ColorSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 文字コードの指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		// パラメータの受け取り
		String titleColor = request.getParameter("titleColor");
		String backColor = request.getParameter("backColor");
		String charColor = request.getParameter("charColor");

		// requestのスコープ内に格納
		request.setAttribute("titleColor", titleColor);
		request.setAttribute("backColor", backColor);
		request.setAttribute("charColor", charColor);

		// 投げ先指定して投げる
		RequestDispatcher rd = request.getRequestDispatcher("color.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
