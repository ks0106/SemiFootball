package reservation.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationCheckCourtServlet
 */
@WebServlet(name = "ReservationCheckCourt", urlPatterns = { "/reservationCheckCourt.do" })
public class ReservationCheckCourtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCheckCourtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resDate = request.getParameter("resDate");
		int cCode = Integer.parseInt(request.getParameter("cCode"));
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		System.out.println("시작 : "+startTime);
		System.out.println("끝 : "+endTime);
		try {
			int result = new ReservationService().reservationCheckCourt(resDate,cCode,startTime,endTime);
			System.out.println("대관 가능 여부 : "+result);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(result,response.getWriter());	
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
