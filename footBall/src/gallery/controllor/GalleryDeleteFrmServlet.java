package gallery.controllor;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import gallery.model.service.GalleryService;
import gallery.model.vo.Gallery;

/**
 * Servlet implementation class GalleryDeleteFrmServlet
 */
@WebServlet(name = "GalleryDeleteFrm", urlPatterns = { "/galleryDeleteFrm" })
public class GalleryDeleteFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryDeleteFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"img/gallery";
		int number = Integer.parseInt(request.getParameter("photoNo"));
		String filename = request.getParameter("filename");
//		String filename = request.getParameter("filename").substring(request.getParameter("filename").lastIndexOf("/"));
		Gallery g = new Gallery();
		g.setPhotoNo(number);
		g.setFilename(saveDirectory+filename);
		System.out.println(g.getPhotoNo());
		int result=0;
		try {
			result = new GalleryService().deletePhoto(g);
			if(result > 0) {
				File deleteFile = new File(saveDirectory+filename);
				deleteFile.delete();
				request.setAttribute("msg", "삭제 성공");
			}else {
				request.setAttribute("msg", "삭제 실패");
			}
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(result, response.getWriter());
			request.setAttribute("loc", "/gallery");
			request.getRequestDispatcher("WEB-INF/views/common/msg.jsp").forward(request, response);
			
		} catch (SQLException e) {
			System.out.println("catch 테스트");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
			request.setAttribute("msg", "SQL구문 오류");
			rd.forward(request, response);
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
