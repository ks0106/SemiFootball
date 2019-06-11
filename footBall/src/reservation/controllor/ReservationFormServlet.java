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

import branch.model.vo.Branch;
import branch.model.vo.BranchImgs;
import member.model.vo.Member;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationFormServlet
 */
@WebServlet(name = "ReservationForm", urlPatterns = { "/reservationForm" })
public class ReservationFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationFormServlet() {
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
			request.setCharacterEncoding("utf-8");
			int rCode = Integer.parseInt(request.getParameter("reservationSelect"));		
			try {
				Branch b = new ReservationService().reservationBranch(rCode);
				String bi1 = new ReservationService().bringImg(rCode);
				request.setAttribute("b", b);
				request.setAttribute("bi1", bi1);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservationForm.jsp");
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
