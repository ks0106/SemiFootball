package notice.controllor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.NoticeVo;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet(name = "NoticeUpdateEnd", urlPatterns = { "/noticeUpdateEnd" })
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		NoticeVo nv = new NoticeVo(noticeNo, noticeTitle, null, null, noticeContent, 0, 0);
		int result = new NoticeService().noticeUpdate(nv);
		if(result>0) {
			request.setAttribute("msg", "수정 완료하였습니다");
			request.setAttribute("loc", "/notice");
		}else {
			request.setAttribute("msg", "수정 실패하였습니다");
			request.setAttribute("loc", "/noticeUpdate?noticeNo="+noticeNo);
		}
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
