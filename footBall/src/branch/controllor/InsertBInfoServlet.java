package branch.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import branch.model.service.BranchService;
import branch.model.vo.Branch;
import branch.model.vo.BranchData;

/**
 * Servlet implementation class InsertBInfoServlet
 */
@WebServlet(name = "insertBInfo", urlPatterns = { "/insertBInfo" })
public class InsertBInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String branchName = request.getParameter("branchName");
		String branchAddr = request.getParameter("branchAddr");
		String branchPhone = request.getParameter("branchPhone");
		String branchTel = request.getParameter("branchTel");
		Branch b = new Branch(0, branchName, branchAddr, branchPhone, branchTel);
		int result = new BranchService().insertBranch(b);
		if(result>0) {
			BranchData bd = null;
			int branchCode = 0;
			try {
				bd = new BranchService().selectOne(branchName);
				branchCode = bd.getB().getBranchCode();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("msg", "지점 추가 완료, 새 지점의 지점 코드는 : ["+branchCode+"] 입니다");
		}else {
			request.setAttribute("msg", "입력 중 오류 발생");
		}
		request.setAttribute("loc", "/insertBranch");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
