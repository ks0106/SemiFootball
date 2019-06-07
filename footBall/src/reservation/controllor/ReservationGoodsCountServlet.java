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
 * Servlet implementation class ReservationGoodsCountServlet
 */
@WebServlet(name = "ReservationGoodsCount", urlPatterns = { "/reservationGoodsCount.do" })
public class ReservationGoodsCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationGoodsCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String result = request.getParameter("result");
		String option = request.getParameter("option");
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		System.out.println(result);
		System.out.println(option);
		System.out.println(bCode);
		try {
			int count = new ReservationService().reservationGoodsCount(result, option, bCode);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(count,response.getWriter());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
