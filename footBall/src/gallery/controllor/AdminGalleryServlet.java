package gallery.controllor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gallery.model.service.GalleryService;
import gallery.model.vo.Gallery;
import gallery.model.vo.GalleryPageData;

/**
 * Servlet implementation class GalleryServlet
 */
@WebServlet(name = "AdminGallery", urlPatterns = { "/adminGallery" })
public class AdminGalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGalleryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reqPage = 1;
		int totalCount = 0;
		try {
			totalCount = new GalleryService().photoTotalCount();
			ArrayList<Gallery> list = new GalleryService().photoList();
			try {
				reqPage = Integer.parseInt(request.getParameter("reqPage"));
			} catch(NumberFormatException e) {
				reqPage = 1;
			}
			GalleryPageData gpd = new GalleryService().GalleryList(reqPage);
			request.setAttribute("gpd", gpd);
			System.out.println(gpd.getPageNavi());
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/gallery/adminGallery.jsp");
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("list", list);
			rd.forward(request, response);
		} catch (SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
			request.setAttribute("msg", "SQL구문 오류");
			rd.forward(request, response);
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
