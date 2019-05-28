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
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet(name = "NoticeView", urlPatterns = { "/noticeView" })
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
//		NoticeViewData nvd = new NoticeService().listOne(noticeNo);
//		String view = "";
//		if(nvd.getNv()!=null) {
//			request.setAttribute("nvd", nvd);
//			view = "/WEB-INF/views/common/msg.jsp";
//		}else {
//			request.setAttribute("msg", "삭제된 공지사항입니다.");
//			request.setAttribute("loc", "/notice");
//			view = "/WEB-INF/views/common/msg.jsp";
//		}
//		RequestDispatcher rd = request.getRequestDispatcher(view);
//		rd.forward(request, response);
		
		NoticeVo nv = new NoticeService().listOne(noticeNo);
		request.setAttribute("nv", nv);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/notice/noticeView.jsp");
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
