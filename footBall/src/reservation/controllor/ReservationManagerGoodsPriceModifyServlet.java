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
 * Servlet implementation class ReservationManagerGoodsPriceModifyServlet
 */
@WebServlet(name = "ReservationManagerGoodsPriceModify", urlPatterns = { "/reservationManagerGoodsPriceModify" })
public class ReservationManagerGoodsPriceModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationManagerGoodsPriceModifyServlet() {
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
				String goodsName = request.getParameter("goodsName");
				String goodsSize = request.getParameter("goodsSize");
				int goodsPrice = Integer.parseInt(request.getParameter("goodsNewPrice"));
				try {
					int result = new ReservationService().reservationManagerGoodsPriceModify(bCode, goodsName, goodsSize, goodsPrice);
					if(result > 0) {
						request.setAttribute("msg", "해당 물품의 가격을 성공적으로 변경했습니다.");
						request.setAttribute("loc", "/reservationGoodsManager");
						RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
						rd.forward(request, response);
					}else {
						request.setAttribute("msg", "가격 변경을 실패했습니다.");
						request.setAttribute("loc", "/reservationGoodsManager");
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
