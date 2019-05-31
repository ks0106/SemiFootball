package reservation.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.Court;

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
		request.setCharacterEncoding("utf-8");
		String years = request.getParameter("years");
		String month = request.getParameter("month");
		if(years != null || month != null) {
			request.setAttribute("years", years);
			request.setAttribute("month", month);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservationForm.jsp");
			rd.forward(request, response);			
		}else {
			int rCode = Integer.parseInt(request.getParameter("reservationSelect"));
			try {
				ArrayList<Court> list = new ReservationService().reservationCourt(rCode);
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reservation/reservationForm.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
