package reservation.controllor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;

/**
 * Servlet implementation class ReservationPaymentPageServlet
 */
@WebServlet(name = "ReservationPaymentPage", urlPatterns = { "/reservationPaymentPage" })
public class ReservationPaymentPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPaymentPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		if(m != null) {
			String memberId = m.getId();
			String memberName = m.getName();
			String memberPhone = m.getPhone();
			int resNo = Integer.parseInt(request.getParameter("goResNo"));
			int allCost = Integer.parseInt(request.getParameter("goAllCost"));
			String resDate = request.getParameter("goResDate");
			int cCode = Integer.parseInt(request.getParameter("goCCode"));
			String[] startTime = request.getParameterValues("goStartTime");
			String[] endTime = request.getParameterValues("goEndTime");
			System.out.println(startTime.length);
			request.setAttribute("memberId", memberId);
			request.setAttribute("memberName", memberName);
			request.setAttribute("resNo", resNo);
			request.setAttribute("allCost", allCost);
			request.setAttribute("resDate", resDate);
			request.setAttribute("cCode", cCode);
			request.setAttribute("startTime", startTime);
			request.setAttribute("endTime", endTime);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservationPayment.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "로그인을 해주세요.");
			request.setAttribute("loc", "/views/login/login.jsp");
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
