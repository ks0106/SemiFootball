package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardCommentUpdateServlet
 */
@WebServlet(name = "BoardCommentUpdate", urlPatterns = { "/boardCommentUpdate" })
public class BoardCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int boardCommentNo = Integer.parseInt(request.getParameter("boardCommentNo"));
		String boardCommentContent = request.getParameter("boardCommentContent");
		int boardRef = Integer.parseInt(request.getParameter("boardRef"));
		int result = new BoardService().updateBoardComment(boardCommentNo,boardCommentContent);
		if(result>0) {
			request.setAttribute("msg", "댓글 수정이 완료되었습니다.");
		}else {
			request.setAttribute("msg", "댓글 수정에 실패하였습니다");
		}
		request.setAttribute("loc", "/boardView?boardNo="+boardRef);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
