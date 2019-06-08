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

import goods.model.vo.Goods;
import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.ReservationViewPageData;

/**
 * Servlet implementation class ReservationViewServlet
 */
@WebServlet(name = "ReservationView", urlPatterns = { "/reservationView" })
public class ReservationViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		if(m != null) {
			int resNo = Integer.parseInt(request.getParameter("resNo"));
			try {
				ReservationViewPageData rvpd = new ReservationService().reservationView(resNo);
				System.out.println(rvpd);
				request.setAttribute("rvpd", rvpd);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservationView.jsp");
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
