package reservation.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import reservation.model.service.ReservationService;
import reservation.model.vo.Schedule;

/**
 * Servlet implementation class ReservationCourtSelectServlet
 */
@WebServlet(name = "ReservationCourtSelect", urlPatterns = { "/reservationCourtSelect.do" })
public class ReservationCourtSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCourtSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cCode = Integer.parseInt(request.getParameter("cCode"));
		try {
			ArrayList<Schedule> list = new ReservationService().reservationCourtSelect(cCode);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(list,response.getWriter());			
		} catch (SQLException e) {
			e.printStackTrace();
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
