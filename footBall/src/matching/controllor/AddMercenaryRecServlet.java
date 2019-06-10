package matching.controllor;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import matching.model.sevice.RecService;
import matching.model.vo.Recruit;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class AddMercenaryRecServlet
 */
@WebServlet(name = "AddMercenaryRec", urlPatterns = { "/addMercenaryRec" })
public class AddMercenaryRecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMercenaryRecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recBCode = Integer.parseInt(request.getParameter("recBCode"));
		int recCCode = Integer.parseInt(request.getParameter("recCCode"));
		String recName = request.getParameter("name");
		String recPhone = request.getParameter("phone");
		String recDate = request.getParameter("recDate");
		String recTime = request.getParameter("recTime");
		String recLevel = request.getParameter("recLevel");
		int recAble = Integer.parseInt(request.getParameter("recAble"));
		int recAmount = Integer.parseInt(request.getParameter("recAmount"));
		String recMemo= request.getParameter("memo").replaceAll("\r\n", "<br>");
		Date d = Date.valueOf(recDate);
		Recruit r = new Recruit(0, recName, recBCode, recCCode, recPhone, recAmount, d, recTime, recLevel, recAble, recMemo);
		try {
			int result = new RecService().addMerRec(r);
			if(result>0) {
				request.setAttribute("msg", "등록되었습니다");
				request.setAttribute("loc", "/mercenaryRec");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("msg", "spl에러: "+e);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
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
