package matching.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.sevice.MatchService;
import matching.model.vo.MatchList;

/**
 * Servlet implementation class ModiMatchContentServlet
 */
@WebServlet(name = "ModiMatchContent", urlPatterns = { "/modiMatchContent" })
public class ModiMatchContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModiMatchContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int matchNo = Integer.parseInt(request.getParameter("matchNo"));
		String matchType= request.getParameter("matchType");
		String matchLevel = request.getParameter("matchLevel");
		int matchAmount = Integer.parseInt(request.getParameter("matchAmount"));
		int matchAble = Integer.parseInt(request.getParameter("matchAble"));
		String matchMemo = request.getParameter("matchMemo").replaceAll("\r\n","<br>");
		MatchList m = new MatchList();
		m.setSeqMatchNo(matchNo);
		m.setMatchType(matchType);
		m.setMatchLevel(matchLevel);
		m.setMatchAmount(matchAmount);
		m.setMatchAble(matchAble);
		m.setMatchMemo(matchMemo);
		try {
			int result = new MatchService().modiMatchContent(m);
			if(result>0) {
				request.setAttribute("msg", "수정되었습니다");
				request.setAttribute("loc", "/matching");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("msg", "spl에러: "+e);
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
