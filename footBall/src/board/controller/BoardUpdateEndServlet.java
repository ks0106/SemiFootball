package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class BoardUpdateEndServlet
 */
@WebServlet(name = "BoardUpdateEnd", urlPatterns = { "/boardUpdateEnd" })
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	      if(!ServletFileUpload.isMultipartContent(request)) {
	         request.setAttribute("msg", "자유게시판 수정 오류[enctype!]");
	         request.setAttribute("loc", "/");
	         RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
	         rd.forward(request, response);
	         return;
	      }
	      String root = getServletContext().getRealPath("/");
	      String saveDirectory = root+"upload/board";
	      int maxSize = 1024*1024*10;
	      MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
	      int boardNo = Integer.parseInt(mRequest.getParameter("boardNo"));
	      String boardTitle = mRequest.getParameter("boardTitle");
	      String boardContent = mRequest.getParameter("boardContent").replaceAll("\n", "<br>");
	      String boardFilename = mRequest.getOriginalFileName("boardFilename");
	      String boardFilepath = mRequest.getFilesystemName("boardFilename");
	      String oldFilename = mRequest.getParameter("oldFilename");
	      String oldFilepath = mRequest.getParameter("oldFilepath");
	      String status = mRequest.getParameter("status");
	      File f = mRequest.getFile("boardFilename");
	      if(f!=null && f.length()>0) {//첨부파일이 있는 경우 는 기존에 파일이 있는지만 검사하면 된다
	         if(oldFilename !=null) {
	            File deleteFile = new File(saveDirectory+"/"+oldFilepath);
	            boolean bool = deleteFile.delete();
	            System.out.println(bool?"삭제완료":"삭제실패");
	         }
	      }else { //첨부파일이 없는 경우
	         if(status.equals("stay")) {//삭제하지 않은 경우
	        	 boardFilename = oldFilename;
	        	 boardFilepath = oldFilepath;
	         }else {
	            File deleteFile = new File(saveDirectory+"/"+oldFilepath);
	            boolean bool = deleteFile.delete();
	            System.out.println(bool?"삭제완료":"삭제실패");
	         }
	      }
	      BoardVo bv = new BoardVo(boardNo, boardTitle, null, boardContent, null, boardFilename, boardFilepath, 0, 0);
	      int result = new BoardService().boardUpdate(bv);
	      if(result>0) {
	         request.setAttribute("msg", "게시판 수정이 완료되었습니다.");
	      }else {
	         request.setAttribute("msg", "게시판 수정에 실패하였습니다.");
	      }
	      request.setAttribute("loc", "/boardView?boardNo="+boardNo);
	      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
	      rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
