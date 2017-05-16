package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import dao.SectionDao;
import entity.EmployeeBean;
import entity.SectionBean;

/**
 * 従業員情報更新か削除かを判別するサーブレット
 */
@WebServlet("/EmpDecisionServlet")
public class EmpDecisionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * 従業員情報の更新か削除かを判断して転送する
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// エンコーディングの指定
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");

		String action = request.getParameter("ACTION");

		// form からの値で処理を分岐
		if("削除".equals(action)) {

			RequestDispatcher rd = request.getRequestDispatcher("deleteConfirm.jsp");
			rd.forward(request, response);

		} else if("変更".equals(action)) {

			EmployeeBean emp = null;// = new EmployeeBean();
			EmployeeDAO dao = new EmployeeDAO();
			SectionDao sDao = new SectionDao();

			List<SectionBean> sectionList = sDao.selectAllSection();
			emp = dao.whereEmpCodeSelect(request.getParameter("employee"));

			request.setAttribute("employeeBean", emp);
			request.setAttribute("sectionList", sectionList);

			RequestDispatcher rd = request.getRequestDispatcher("empUpdate.jsp");
			rd.forward(request, response);

		}
	}

}
