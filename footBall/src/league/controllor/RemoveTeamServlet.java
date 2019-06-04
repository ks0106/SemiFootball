package league.controllor;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import gallery.model.service.GalleryService;
import gallery.model.vo.Gallery;
import league.model.service.LeagueService;

/**
 * Servlet implementation class RemoveTeamServlet
 */
@WebServlet(name = "RemoveTeam", urlPatterns = { "/removeTeam" })
public class RemoveTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"img/league";
		String teamEmail = request.getParameter("teamEmail");
		String filepath = request.getParameter("filepath");
		System.out.println(filepath);
		int result=0;
		try {
			result = new LeagueService().removeTeam(teamEmail);
			if(result > 0) {
				File deleteFile = new File(saveDirectory+filepath);
				deleteFile.delete();
				request.setAttribute("msg", "삭제 성공");
			}else {
				request.setAttribute("msg", "삭제 실패");
			}
			request.setAttribute("loc", "/league");
			request.getRequestDispatcher("WEB-INF/views/common/msg.jsp").forward(request, response);
			
		} catch (SQLException e) {
			System.out.println("catch 테스트");
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
