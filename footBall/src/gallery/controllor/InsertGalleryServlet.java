package gallery.controllor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			String saveDirectory = root+"upload/photo";
			int maxSize = 10*1024*1024;
			MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			String photoWriter = mRequest.getParameter("photoWriter");
			String photoContent = mRequest.getParameter("photoContent");
			String filepath = mRequest.getFilesystemName("filepath");
			Gallery g = new Gallery();
			g.setPhotoWriter(photoWriter);
			g.setPhotoContent(photoContent);
			g.setFilepath(filepath);
			int result=0;
			try {
				result = new GalleryService().insertPhoto(g);
				if(result > 0) {
					request.setAttribute("msg", "등록 성공");
				}else {
					request.setAttribute("msg", "등록 실패");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("loc", "/galleryList");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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
