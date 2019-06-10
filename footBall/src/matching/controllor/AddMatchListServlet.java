package matching.controllor;

import java.io.IOException;
import java.sql.Date;
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
 * Servlet implementation class AddMatchListServlet
 */
@WebServlet(name = "AddMatchList", urlPatterns = { "/addMatchList" })
public class AddMatchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMatchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matchType=request.getParameter("matchType");
		int matchBCode = Integer.parseInt(request.getParameter("matchBCode"));
		int matchCCode = Integer.parseInt(request.getParameter("matchCCode"));
		String matchWriter = request.getParameter("name");
		String matchPhone = request.getParameter("phone");
		String matchDate = request.getParameter("matchDate");
		String matchTime = request.getParameter("matchTime");
		String matchLevel = request.getParameter("matchLevel");
		int matchAble = Integer.parseInt(request.getParameter("matchAble"));
		int matchAmount = Integer.parseInt(request.getParameter("matchAmount"));
		String matchMemo = request.getParameter("memo").replaceAll("\r\n", "<br>");
		Date d = Date.valueOf(matchDate);
		MatchList m = new MatchList();
		m.setMatchType(matchType);
		m.setMatchBCode(matchBCode);
		m.setMatchCCode(matchCCode);
		m.setMatchWriter(matchWriter);
		m.setMatchPhone(matchPhone);
		m.setMatchDate(d);
		m.setMatchTime(matchTime);
		m.setMatchLevel(matchLevel);
		m.setMatchAble(matchAble);
		m.setMatchAmount(matchAmount);
		m.setMatchMemo(matchMemo);
		try {
			int result = new MatchService().addMatchList(m);
			if(result>0) {
				request.setAttribute("msg", "등록되었습니다");
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
