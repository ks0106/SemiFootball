package matching.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.sevice.RecService;
import matching.model.vo.RecPageData;

/**
 * Servlet implementation class MercenarySearchServlet
 */
@WebServlet(name = "MercenarySearch", urlPatterns = { "/mercenarySearch" })
public class MercenarySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MercenarySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage =1;
		}
		int branch = Integer.parseInt(request.getParameter("branch"));
		String keyword = request.getParameter("keyword");
		try {
			RecPageData rpd = new RecService().searchList2(reqPage,branch,keyword);
			if(!rpd.getList().isEmpty()) {
				request.setAttribute("rpd", rpd);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/matching/mercenary.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("msg", "검색결과가 없습니다.");
				request.setAttribute("loc","/mercenaryRec");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}
			
		} catch (SQLException e) {
			request.setAttribute("msg", "쿼리문오류"+e);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
