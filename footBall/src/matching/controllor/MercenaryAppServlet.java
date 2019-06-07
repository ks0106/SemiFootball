package matching.controllor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.vo.Recruit;

/**
 * Servlet implementation class MercenaryAppServlet
 */
@WebServlet(name = "MercenaryApp", urlPatterns = { "/mercenaryApp" })
public class MercenaryAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MercenaryAppServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Bname = request.getParameter("Bname");
		String Cname = request.getParameter("Cname");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String matchDate = request.getParameter("matchDate");
		String matchTime = request.getParameter("matchTime");
		String matchAble = request.getParameter("recAble");
		String matchLevel = request.getParameter("matchLevel");
		String recMemo = request.getParameter("memo");
		Recruit r = new Recruit();
		r.setRecBName(Bname);
		r.setAble(Integer.parseInt(matchAble));
		
		request.getRequestDispatcher("/WEB-INF/views/matching/mercenary.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
