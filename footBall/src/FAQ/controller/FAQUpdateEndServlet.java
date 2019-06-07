package FAQ.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FAQ.model.service.FAQService;
import FAQ.model.vo.FAQVo;

/**
 * Servlet implementation class FAQUpdateEndServlet
 */
@WebServlet(name = "FAQUpdateEnd", urlPatterns = { "/faqUpdateEnd" })
public class FAQUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		String faqTitle = request.getParameter("faqTitle");
		String faqContent = request.getParameter("faqContent");
		FAQVo fv = new FAQVo(faqNo, faqTitle, faqContent);
		int result = new FAQService().faqUpdate(fv);
		if(result>0) {
			request.setAttribute("msg", "수정 완료하였습니다");
			request.setAttribute("loc", "/fAQ");
		}else {
			request.setAttribute("msg", "수정 실패하였습니다");
			request.setAttribute("loc", "/fAQ");
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
