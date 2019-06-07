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
import league.model.vo.LeagueList;

/**
 * Servlet implementation class DownLeagueServlet
 */
@WebServlet(name = "DownLeague", urlPatterns = { "/downLeague" })
public class DownLeagueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownLeagueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int leagueNo = Integer.parseInt(request.getParameter("leagueNo"));
		String leagueTitle= request.getParameter("leagueTitle");
		String leagueWriter = request.getParameter("leagueWriter");
		String filepath = request.getParameter("filepath");
		LeagueList ll = new LeagueList();
		ll.setLeagueTitle(leagueTitle);
		ll.setLeagueWriter(leagueWriter);
		ll.setFilepath(filepath);
		try {
			int result = new LeagueService().deleteLeague(leagueNo,ll);
			if(result >0) {
				int result2 = new LeagueService().deleteTeam(leagueNo);
				if(result2>0) {
					RequestDispatcher rd = request.getRequestDispatcher("/league");
					rd.forward(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
