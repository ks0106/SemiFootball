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
 * Servlet implementation class ReservationManagerScheduleDeleteServlet
 */
@WebServlet(name = "ReservationManagerScheduleDelete", urlPatterns = { "/reservationManagerScheduleDelete" })
public class ReservationManagerScheduleDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationManagerScheduleDeleteServlet() {
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
				String startTime = request.getParameter("startTime").substring(0,5);
				String scheduleDate = request.getParameter("scheduleDate").substring(2, 10);
				try {
					int result = new ReservationService().reservationManagerScheduleDelete(bCode, cCode, startTime, scheduleDate);
					if(result > 0) {
						request.setAttribute("msg", "해당 스케쥴을 성공적으로 삭제했습니다.");
						request.setAttribute("loc", "/reservationScheduleManager");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
						rd.forward(request, response);
					}else {
						request.setAttribute("msg", "스케쥴 수정을 실패했습니다. 현재 이용자가 있는지 확인하거나 스케쥴을 예약불가로 바꾼 뒤 다시 시도해주세요.");
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
