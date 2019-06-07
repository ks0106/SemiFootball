package matching.controllor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.sevice.MatchService;
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
		String recBname = request.getParameter("Bname");
		String recCname = request.getParameter("Cname");
		String recName = request.getParameter("name");
		String recPhone = request.getParameter("phone1");
		String recDate = request.getParameter("recDate");
		String recTime = request.getParameter("matchTime");
		String recAble = request.getParameter("recAble");
		String matchLevel = request.getParameter("matchLevel");
		String recMemo = request.getParameter("memo");
		Recruit r = new Recruit();
		r.setRecBName(recBname);
		r.setRecCName(recCname);
		r.setRecName(recName);
		r.setRecPhone(recPhone);
		//데이트 만들어주세요
		r.setRecTime(recTime);
		r.setAble(Integer.parseInt(recAble));
		r.setRecMemo(recMemo);
		int result = new MatchService().mercenaryAdd();
		if(result > 0) {
			request.setAttribute("msg", "등록성공");
			request.setAttribute("loc", "/WEB-INF/views/matching/mercenary.jsp");
			request.getRequestDispatcher("/views/common/sqlErrorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "등록 실패");
			request.setAttribute("loc", "/WEB-INF/views/matching/mercenary.jsp");
			request.getRequestDispatcher("/views/common/sqlErrorPage.jsp").forward(request, response);
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
