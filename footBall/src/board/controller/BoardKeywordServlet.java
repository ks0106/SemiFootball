package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardPageData;

/**
 * Servlet implementation class BoardKeywordServlet
 */
@WebServlet(name = "BoardKeyword", urlPatterns = { "/boardKeyword" })
public class BoardKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardKeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		BoardPageData bpd = new BoardService().searchKeyword(reqPage,type,keyword);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/board/boardList.jsp");
		request.setAttribute("bpd", bpd);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
