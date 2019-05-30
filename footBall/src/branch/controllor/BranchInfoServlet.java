package branch.controllor;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import branch.model.service.BranchService;
import branch.model.vo.BranchData;

/**
 * Servlet implementation class BranchInfoServlet
 */
@WebServlet(name = "BranchInfo", urlPatterns = { "/branchInfo" })
public class BranchInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String branchName = request.getParameter("branchName");
		try {
			BranchData bd = new BranchService().selectOne(branchName);
			JSONObject result = new JSONObject();
			result.put("branchName", URLEncoder.encode(bd.getB().getBranchName(),"utf-8"));
			result.put("branchAddr", URLEncoder.encode(bd.getB().getBranchAddr(),"utf-8"));
			result.put("branchTel", bd.getB().getBranchTel());
			result.put("branchPhone", bd.getB().getBranchPhone());
			result.put("bi1", bd.getBi().getBi1());
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
			JSONObject result = new JSONObject();
			result.put("errorMsg", URLEncoder.encode("such brnach dose not exists", "utf-8"));
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
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
