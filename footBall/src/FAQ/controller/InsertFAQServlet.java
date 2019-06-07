package FAQ.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FAQ.model.service.FAQService;
import FAQ.model.vo.FAQVo;

/**
 * Servlet implementation class InsertFAQServlet
 */
@WebServlet(name = "InsertFAQ", urlPatterns = { "/insertFAQ" })
public class InsertFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFAQServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String faqTitle = request.getParameter("faqtitle");
		String faqContent = request.getParameter("faqcontent");
		FAQVo fv = new FAQVo(0, faqTitle, faqContent);
		int result = new FAQService().insert(fv);
		if(result>0) {
			request.setAttribute("msg", "FAQ등록에 성공하셨습니다.");
		}else {
			request.setAttribute("msg", "FAQ등록에 실패하셨습니다.");
		}
		request.setAttribute("loc", "/fAQ");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
