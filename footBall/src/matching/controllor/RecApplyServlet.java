package matching.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import reservation.model.service.ReservationService;
import reservation.model.vo.Reservation;

/**
 * Servlet implementation class RecApplyServlet
 */
@WebServlet(name = "RecApply", urlPatterns = { "/recApply" })
public class RecApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = ((Member)session.getAttribute("member"));
		if(m!=null) {
			try {
				ArrayList<Reservation> r = new ReservationService().reservationViewList(m.getId());
				if(!r.isEmpty()) {
					request.setAttribute("list", r);
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/matching/addMercenaryRec.jsp");
					rd.forward(request, response);
				}else {
					request.setAttribute("msg", "지점 예약후 사용이 가능합니다");
					request.setAttribute("loc", "/");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
					rd.forward(request, response);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			request.setAttribute("msg", "로그인 후 사용해주세요");
			request.setAttribute("loc", "/views/login/login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
