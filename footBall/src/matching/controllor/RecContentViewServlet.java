package matching.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import matching.model.sevice.MatchService;
import matching.model.sevice.RecService;
import matching.model.vo.MatchList;
import matching.model.vo.Recruit;

/**
 * Servlet implementation class RecContentViewServlet
 */
@WebServlet(name = "RecContentView", urlPatterns = { "/recContentView" })
public class RecContentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecContentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		try {
			Recruit r = new RecService().selectOne(pageNum);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(r,response.getWriter());
			
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
