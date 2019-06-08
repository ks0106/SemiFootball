package reservation.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationPaymentUpdateServlet
 */
@WebServlet(name = "ReservationPaymentUpdate", urlPatterns = { "/reservationPaymentUpdate" })
public class ReservationPaymentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPaymentUpdateServlet() {
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
			String paymentId = request.getParameter("paymentId");
			String paymentNum = request.getParameter("paymentNum");
			String paymentDate = request.getParameter("paymentDate");
			int resNo = Integer.parseInt(request.getParameter("resNo"));
			//스케쥴 예약 불가 처리용 변수들
			String resDate = request.getParameter("resDate");
			int cCode = Integer.parseInt(request.getParameter("cCode"));
			String[] startTime = request.getParameterValues("startTime");
			String[] endTime = request.getParameterValues("endTime");
			try {
				//스케쥴 예약 불가로 변경
				int result = new ReservationService().reservationPaymentUpdate(memberId,paymentId,paymentNum,paymentDate,resNo,resDate,cCode,startTime,endTime);				//주문장 추가 및 결제 체크
				RequestDispatcher rd = request.getRequestDispatcher("/reservationViewList");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
