package reservation.controllor;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class ReservationPaymentServlet
 */
@WebServlet(name = "ReservationPayment", urlPatterns = { "/reservationPayment.do" })
public class ReservationPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPaymentServlet() {
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
		if(m == null) {
			String msg = "잘못된 접근입니다.";
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson(msg,response.getWriter());			
		}else {
			String memberId = m.getId();
			String memberPhone = m.getPhone();
			int bCode = Integer.parseInt(request.getParameter("bCode"));
			String resDate = request.getParameter("resDate");
			int cCode = Integer.parseInt(request.getParameter("cCode"));
			String[] resGoodsName = request.getParameterValues("resGoodsName[]");
			String[] resGoodsOption = request.getParameterValues("resGoodsOption[]");
			String[] resGoodsAmount = request.getParameterValues("resGoodsAmount[]");
			String[] resGoodsPrice = request.getParameterValues("resGoodsPrice[]");
			String[] resStartTime = request.getParameterValues("resStartTime[]");
			String[] resEndTime = request.getParameterValues("resEndTime[]");
			String[] resCost = request.getParameterValues("resCost[]");
			int allCost = Integer.parseInt(request.getParameter("allCost"));
			try {
				int result = new ReservationService().reservationPayment(memberId,memberPhone,bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost);
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson(result,response.getWriter());			
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
