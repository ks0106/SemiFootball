package branch.controllor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertBranchServlet
 */
@WebServlet(name = "insertBranch", urlPatterns = { "/insertBranch" })
public class InsertBranchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBranchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("branchCode") != null) {
			int branchCode = Integer.parseInt(request.getParameter("branchCode"));
			String msg = request.getParameter("msg");
			System.out.println("inserBranch : "+branchCode +"/"+ msg);
			request.setAttribute("branchCode", branchCode);
			request.setAttribute("msg", msg);
		}
		request.getRequestDispatcher("/WEB-INF/views/branch/insertBranch.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
