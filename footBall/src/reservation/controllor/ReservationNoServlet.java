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
 * Servlet implementation class ReservationNoServlet
 */
@WebServlet(name = "ReservationNo", urlPatterns = { "/reservationNo.do" })
public class ReservationNoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationNoServlet() {
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
			int bCode = Integer.parseInt(request.getParameter("bCode"));
			String resDate = request.getParameter("resDate");
			int cCode = Integer.parseInt(request.getParameter("cCode"));
			String[] resStartTime = request.getParameterValues("resStartTime[]");
			String[] resEndTime = request.getParameterValues("resEndTime[]");
			int allCost = Integer.parseInt(request.getParameter("allCost"));
			try {
				int resNo = new ReservationService().reservationOrderNo(memberId,bCode,resDate,cCode,resStartTime,resEndTime,allCost);
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson(resNo,response.getWriter());	
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
