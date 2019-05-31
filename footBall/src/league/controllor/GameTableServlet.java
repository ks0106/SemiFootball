package league.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import league.model.service.LeagueService;
import league.model.vo.League;

/**
 * Servlet implementation class GameTalbeServlet
 */
@WebServlet(name = "GameTable", urlPatterns = { "/gameTable" })
public class GameTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			ArrayList<League> list = new LeagueService().teamList();
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/league/gameTable.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
			request.setAttribute("msg", "SQL구문 오류");
			rd.forward(request, response);
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
