package league.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import league.model.service.LeagueService;
import league.model.vo.LeaguePageData;
import league.model.vo.WinList;

/**
 * Servlet implementation class AfterLeagueServlet
 */
@WebServlet(name = "AfterLeague", urlPatterns = { "/afterLeague" })
public class AfterLeagueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfterLeagueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reqPage;
		//첫페이지에는 reqPage가 없으므로 강제 1 입력
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage= 1;
		}
		try {
			LeaguePageData lpd = new LeagueService().afterLeaguePage(reqPage);
			request.setAttribute("lpd", lpd);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/league/afterLeague.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			System.out.println(e);
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
