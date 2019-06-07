package league.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import league.model.service.LeagueService;
import league.model.vo.AfterTeam;

/**
 * Servlet implementation class AfterGameTableServlet
 */
@WebServlet(name = "AfterGameTable", urlPatterns = { "/afterGameTable" })
public class AfterGameTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfterGameTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int leagueNo = Integer.parseInt(request.getParameter("leagueNo"));
		try {
			ArrayList<AfterTeam> list = new LeagueService().afterTeamList(leagueNo);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(list,response.getWriter());
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
