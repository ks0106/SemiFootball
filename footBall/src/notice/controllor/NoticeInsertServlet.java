package notice.controllor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import notice.model.service.NoticeService;
import notice.model.vo.NoticeVo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet(name = "NoticeInsert", urlPatterns = { "/noticeInsert" })
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				if(!ServletFileUpload.isMultipartContent(request)) {
					request.setAttribute("msg", "공지사항 작성 오류 [enctype]");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
					return;
				}
			
				String root = getServletContext().getRealPath("/");
				String saveDirectory = root+"upload/notice";
				System.out.println(saveDirectory);
				int maxSize = 10*1024*1024;
				MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
				String noticeTitle = mRequest.getParameter("noticeTitle");
				String noticeContent = mRequest.getParameter("noticeContent");
				String noticeWriter = mRequest.getParameter("noticeWriter");
				String filename = mRequest.getOriginalFileName("filename");
				String filepath = mRequest.getFilesystemName("filename");
				NoticeVo nv = new NoticeVo(0, noticeTitle, noticeWriter,null, filename, maxSize, filepath, noticeContent, maxSize);
				int result = new NoticeService().NoticeInsert(nv);
				if(result>0) {
					request.setAttribute("msg", "공지사항 등록 성공");
				}else {
					request.setAttribute("msg", "공지사항 등록 실패");
				}
				request.setAttribute("loc", "/notice");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
