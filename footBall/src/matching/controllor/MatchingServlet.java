package matching.controllor;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import com.sun.org.apache.xerces.internal.impl.dv.dtd.NMTOKENDatatypeValidator;

import matching.model.sevice.MatchService;
import matching.model.vo.MatchPageData;

/**
 * Servlet implementation class MatchingServlet
 */
@WebServlet(name = "Matching", urlPatterns = { "/matching" })
public class MatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이징 처리를 위한 reqPage변수생성
		int reqPage;
		//첫페이지에는 reqPage가 없으므로 강제 1 입력
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage= 1;
		}
		//페이지로 보내주기 위한 matchPageData 객체 생성
		MatchPageData mpd;
		try {
			mpd = new MatchService().selectList(reqPage);
			request.setAttribute("mpd", mpd);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/matching/matching.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			System.out.println(e);
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
