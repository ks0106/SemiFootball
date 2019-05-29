package gallery.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import gallery.model.service.GalleryService;
import gallery.model.vo.Gallery;

/**
 * Servlet implementation class InsertGalleryServlet
 */
@WebServlet(name = "InsertGallery", urlPatterns = { "/insertGallery" })
public class InsertGalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGalleryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "작성오류[enctype]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return;
		}else {
			String root = getServletContext().getRealPath("/");
			String saveDirectory = root+"img/gallery";
			int maxSize = 10*1024*1024;
			MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			String photoWriter = mRequest.getParameter("photoWriter");
			String filename = mRequest.getFilesystemName("filename");
			Gallery g = new Gallery();
			g.setPhotoWriter(photoWriter);
			g.setFilename(filename);
			int result=0;
			try {
				result = new GalleryService().insertPhoto(g);
				if(result > 0) {
					request.setAttribute("msg", "등록 성공");
				}else {
					request.setAttribute("msg", "등록 실패");
				}
				request.setAttribute("loc", "/gallery");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			} catch (SQLException e) {
				RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
				request.setAttribute("msg", "SQL구문 오류");
				rd.forward(request, response);
			}
			
				
//				RequestDispatcher rd = request.getRequestDispatcher("/views/common/sqlErrorPage.jsp");
//				request.setAttribute("msg", "SQL구문 오류");
//				rd.forward(request, response);
			
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
