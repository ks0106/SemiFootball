package league.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import league.model.service.LeagueService;

/**
 * Servlet implementation class WIn4Servlet
 */
@WebServlet(name = "Win4", urlPatterns = { "/win4" })
public class Win4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Win4Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String win4 = request.getParameter("win4");
		String win2 = request.getParameter("win2");
		int top1 = Integer.parseInt(request.getParameter("top1"));
		StringTokenizer st1 = new StringTokenizer(win4, ",");
		int teamNo4[] = null;
		while(st1.hasMoreTokens()) {
			teamNo4 = new int [4];
			for(int i=0;i<teamNo4.length;i++) {
				teamNo4[i] = Integer.parseInt(st1.nextToken());
			}
		}
		StringTokenizer st2 = new StringTokenizer(win2, ",");
		int teamNo2[] = null;
		while(st2.hasMoreTokens()) {
			teamNo2 = new int [2];
			for(int i=0;i<teamNo2.length;i++) {
				teamNo2[i] = Integer.parseInt(st2.nextToken());
			}
		}
		try {
			int result = new LeagueService().matchUp(teamNo4,teamNo2,top1);
			if(result>0) {
				request.setAttribute("msg", "변경이 완료되었습니다.");
				request.setAttribute("loc", "/gameTable");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("msg", "sql문 오류");
			request.setAttribute("loc", "/gameTable");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
