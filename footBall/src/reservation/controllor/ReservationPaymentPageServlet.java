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
		if(m == null) {
			String msg = "잘못된 접근입니다.";
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(msg,response.getWriter());			
		}else {
			String memberId = m.getId();
			String memberName = m.getName();
			String memberPhone = m.getPhone();
			int resNo = Integer.parseInt(request.getParameter("resNo"));
			int allCost = Integer.parseInt(request.getParameter("allCost"));
			request.setAttribute("memberId", memberId);
			request.setAttribute("memberName", memberName);
			request.setAttribute("resNo", resNo);
			request.setAttribute("allCost", allCost);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservationPayment.jsp");
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
