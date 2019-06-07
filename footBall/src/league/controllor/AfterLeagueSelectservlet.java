package league.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import league.model.service.LeagueService;
import league.model.vo.AfterLeague;

/**
 * Servlet implementation class AfterLeagueSelectservlet
 */
@WebServlet(name = "AfterLeagueSelect", urlPatterns = { "/afterLeagueSelect" })
public class AfterLeagueSelectservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfterLeagueSelectservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int leagueNo = Integer.parseInt(request.getParameter("leagueNo"));
		try {
			AfterLeague al = new LeagueService().afterLeagueSelect(leagueNo);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(al,response.getWriter());
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
