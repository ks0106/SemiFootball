package branch.controllor;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import branch.model.service.BranchService;
import court.model.vo.Court;

/**
 * Servlet implementation class BranchCourtInfoServlet
 */
@WebServlet(name = "branchCourtInfo", urlPatterns = { "/branchCourtInfo" })
public class BranchCourtInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchCourtInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int branchCode = Integer.parseInt(request.getParameter("branchCode"));
		System.out.println("/branchCourtInfo : branchCode = "+branchCode); //test
			ArrayList<Court> list = new BranchService().selectCourt(branchCode);
			JSONArray courtArr = new JSONArray(); // 안에 JSONObject를 담을 수 있는 Array
			JSONObject courtInfo = null;
			for(Court c : list ) {
				courtInfo = new JSONObject();
				courtInfo.put("courtType", c.getCourtType());
				courtInfo.put("courtName",URLEncoder.encode(c.getCourtName(),"UTF-8"));
				courtInfo.put("courtIndoor",URLEncoder.encode(c.getCourtIndoor(),"UTF-8"));
				courtArr.add(courtInfo);
			}
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print(courtArr);
			out.flush();
			out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
