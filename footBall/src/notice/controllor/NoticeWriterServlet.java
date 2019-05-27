package notice.controllor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

/**
 * Servlet implementation class NoticeWriterServlet
 */
@WebServlet(name = "NoticeWriter", urlPatterns = { "/noticeWriter" })
public class NoticeWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		//if(session!=null) {
		//	String memberId = ((Member)session.getAttribute("member")).getId();
		//	if(memberId.equals("admin")) {
		//		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/noticeWriter.jsp");
		//		rd.forward(request, response);
		//	}
		//}
		//else {
//			request.setAttribute("msg", "글작성 권한이 없습니다.");
//			request.setAttribute("loc", "/notice");
//			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/noticeWriter.jsp");
			rd.forward(request, response);
		//}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
