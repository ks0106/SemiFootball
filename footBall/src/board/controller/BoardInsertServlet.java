package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.BoardVo;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet(name = "BoardInsert", urlPatterns = { "/boardInsert" })
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				
				if(!ServletFileUpload.isMultipartContent(request)) {
					request.setAttribute("msg", "자유게시판 작성 오류 [enctype]");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
					return;
				}
				String root = getServletContext().getRealPath("/");
				String saveDirectory = root+"upload/board";
				int maxSize = 10*1024*1024;
				MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
				String boardTitle = mRequest.getParameter("boardTitle");
				String boardContent = mRequest.getParameter("boardContent").replaceAll("\n", "<br>");
				String boardWriter = mRequest.getParameter("boardWriter");
				String boardFilename = mRequest.getOriginalFileName("boardFilename");
				String boardFilepath = mRequest.getFilesystemName("boardFilename");
				BoardVo bv = new BoardVo(0, boardTitle, boardWriter, boardContent, null, boardFilename, boardFilepath, 0, 0);
				int result = new BoardService().boardInsert(bv);
				if(result>0) {
					request.setAttribute("msg", "글작성 업로드 되었습니다.");
				}else {
					request.setAttribute("msg", "글작성 업로드 실패되었습니다.");
				}
				request.setAttribute("loc", "/boardList");
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
