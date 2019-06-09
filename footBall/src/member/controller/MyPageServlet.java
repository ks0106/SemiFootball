package member.controller;

import java.io.IOException;
import java.security.spec.RSAOtherPrimeInfo;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet(name = "MyPage", urlPatterns = { "/myPage" })
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("memberId");
		
		try {
			Member m = new MemberService().printAll(id);
			
			if(m==null) {
				request.setAttribute("msg", "회원정보가 없습니다.");
				request.setAttribute("loc", "/");
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("member", m);
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/member/mypage.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
