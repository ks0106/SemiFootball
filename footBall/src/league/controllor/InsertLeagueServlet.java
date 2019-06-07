package league.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import league.model.service.LeagueService;
import league.model.vo.League;

/**
 * Servlet implementation class InsertLaegueServlet
 */
@WebServlet(name = "InsertLeague", urlPatterns = { "/insertLeague" })
public class InsertLeagueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLeagueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성오류[enctype]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}else {
			String root = getServletContext().getRealPath("/");
			String saveDirectory = root+"img/league";
			int maxSize = 10*1024*1024;
			MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			String teamName = mRequest.getParameter("teamName");
			String teamEmail = mRequest.getParameter("teamEmail");
			String teamRep = mRequest.getParameter("teamRep");
			String teamPhone = mRequest.getParameter("teamPhone");
			String teamColorHome = mRequest.getParameter("teamColorHome");
			String teamColorAway = mRequest.getParameter("teamColorAway");
			String filepath = mRequest.getFilesystemName("filepath");
			League t = new League(0, teamName, teamRep, teamPhone, teamEmail, teamColorHome, teamColorAway, filepath,0, 0, 0, 0);
			
			int result=0;
			try {
				result = new LeagueService().insertTeam(t);
				if(result > 0) {
					request.setAttribute("msg", "등록 성공");
				}else {
					request.setAttribute("msg", "등록 실패");
				}
				request.setAttribute("loc", "/league");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			} catch (SQLException e) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
				request.setAttribute("msg", e);
				rd.forward(request, response);
			}	
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
