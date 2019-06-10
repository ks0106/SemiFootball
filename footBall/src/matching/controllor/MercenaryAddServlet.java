package matching.controllor;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "MercenaryAdd", urlPatterns = { "/mercenaryAdd" })
public class MercenaryAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MercenaryAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recBCode = Integer.parseInt(request.getParameter("Bname"));
		int recCCode = Integer.parseInt(request.getParameter("Cname"));
		String recName = request.getParameter("name");
		String recPhone = request.getParameter("phone");
		String recDate = request.getParameter("matchDate");
		String recAmount = request.getParameter("recAmount");
		String recTime = request.getParameter("matchTime");
		int recAble = Integer.parseInt(request.getParameter("matchAble"));
		String recLevel = request.getParameter("recLevel");
		String recMemo = request.getParameter("memo").replaceAll("\r\n", "<br>");;
		Recruit r = new Recruit();
		System.out.println(recBCode);
		System.out.println(recCCode);
		r.setRecBCode(recBCode);
		r.setRecCCode(recCCode);
		r.setRecName(recName);
		r.setRecPhone(recPhone);
		Date d = Date.valueOf(recDate);
		r.setRecDate(d);
		r.setAmount2(Integer.parseInt(recAmount));
		r.setRecTime(recTime);
		r.setAble2(recAble);
		r.setRecLevel(recLevel);
		r.setRecMemo(recMemo);
		int result=0;
		try {
			result = new MatchService().mercenaryAdd(r);
			System.out.println(result);
			if(result > 0) {
				request.setAttribute("msg", "등록성공");
				request.setAttribute("loc", "/mercenary");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "등록 실패");
				request.setAttribute("loc", "/mercenary");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			/*request.setAttribute("msg", "잘못입력함."+e);
			request.setAttribute("loc", "/mercenary");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
			rd.forward(request, response);*/
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
