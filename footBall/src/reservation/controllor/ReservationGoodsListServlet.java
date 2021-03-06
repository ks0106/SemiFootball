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

import goods.model.vo.Goods;
import reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationGoodsListServlet
 */
@WebServlet(name = "ReservationGoodsList", urlPatterns = { "/reservationGoodsList.do" })
public class ReservationGoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationGoodsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String result = request.getParameter("result");
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		try {
			ArrayList<Goods> list = new ReservationService().reservationGoodsList(result, bCode);
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
