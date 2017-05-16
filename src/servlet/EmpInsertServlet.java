package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpInsertDao;
import dao.SectionDao;
import entity.SectionBean;

/**
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/OrderInsertServlet")
public class EmpInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");
		SectionDao dao = new SectionDao();
		List<SectionBean> list = dao.selectAllSection();
		request.setAttribute("sectionList", list);
		request.getRequestDispatcher("orderInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Windows-31J");
		response.setCharacterEncoding("Windows-31J");
		String url = "menu.jsp";
		SectionDao sdao = new SectionDao();
		List<SectionBean> list = sdao.selectAllSection();
		request.setAttribute("sectionList", list);
		EmpInsertDao odao = new EmpInsertDao();
		int count = odao.empInsert(odao.getNextEmpId(),
						request.getParameter("lName"),
						request.getParameter("fName"),
						request.getParameter("lKanaName"),
						request.getParameter("fKanaName"),
						request.getParameter("sex"),
						request.getParameter("birthDay"),
						request.getParameter("sectionCode"),
						request.getParameter("empDay")
					);
		if(count < 0){
			request.setAttribute("error", "データの登録に失敗しました。");
			url = "error.jsp";
		}else{
			url = "result.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

}
