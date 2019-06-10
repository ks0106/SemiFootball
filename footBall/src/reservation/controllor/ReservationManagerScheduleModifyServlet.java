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

import member.model.vo.Member;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationManagerScheduleModifyServlet
 */
@WebServlet(name = "ReservationManagerScheduleModify", urlPatterns = { "/reservationManagerScheduleModify" })
public class ReservationManagerScheduleModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationManagerScheduleModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		if(m!=null) {
			if(m.getId().equals("admin")) {
				int bCode = Integer.parseInt(request.getParameter("branchName"));
				int cCode = Integer.parseInt(request.getParameter("courtName"));
				String startTime = request.getParameter("startTime");
				int resPrice = Integer.parseInt(request.getParameter("resPrice"));
				String scheduleDate = request.getParameter("scheduleDate").substring(2, 10);
				int scheduleYN = Integer.parseInt(request.getParameter("scheduleYN"));
				try {
					int result = new ReservationService().reservationManagerScheduleModify(bCode, cCode, startTime, resPrice, scheduleDate, scheduleYN);
					if(result > 0) {
						request.setAttribute("msg", "해당 스케쥴을 성공적으로 수정했습니다.");
						request.setAttribute("loc", "/reservationScheduleManager");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
						rd.forward(request, response);
					}else {
						request.setAttribute("msg", "스케쥴 수정을 실패했습니다.");
						request.setAttribute("loc", "/reservationScheduleManager");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
						rd.forward(request, response);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}else {
				request.setAttribute("msg", "비정상적인 동작입니다. 메인페이지로 이동합니다.");
				request.setAttribute("loc", "/");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}
		}else {
			request.setAttribute("msg", "로그인을 해주세요");
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
