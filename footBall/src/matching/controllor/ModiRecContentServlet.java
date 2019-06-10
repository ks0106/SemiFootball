package matching.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.sevice.RecService;
import matching.model.vo.Recruit;

/**
 * Servlet implementation class ModiRecContentServlet
 */
@WebServlet(name = "ModiRecContent", urlPatterns = { "/modiRecContent" })
public class ModiRecContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModiRecContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recNo = Integer.parseInt(request.getParameter("recNo"));
		String recLevel = request.getParameter("recLevel");
		int recAmount = Integer.parseInt(request.getParameter("recAmount"));
		int recAble = Integer.parseInt(request.getParameter("recAble"));
		String recMemo = request.getParameter(request.getParameter("recMemo")).replaceAll("\r\n", "<br>");
		Recruit r = new Recruit();
		r.setSeqRecNo(recNo);
		r.setRecLevel(recLevel);
		r.setAmount(recAmount);
		r.setRecAble(recAble);
		r.setRecMemo(recMemo);
		try {
			int result = new RecService().modiRecContent(r);
			if(result>0) {
				request.setAttribute("msg", "수정되었습니다");
				request.setAttribute("loc", "/matching");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			request.setAttribute("msg", "spl에러: "+e);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
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
