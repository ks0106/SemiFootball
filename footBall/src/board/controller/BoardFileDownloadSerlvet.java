package board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardFileDownloadSerlvet
 */
@WebServlet(name = "BoardFileDownload", urlPatterns = { "/boardFileDownload" })
public class BoardFileDownloadSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownloadSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				String boardFilename = request.getParameter("boardFilename");
				String boardFilepath = request.getParameter("boardFilepath");
				String saveDirectory = getServletContext().getRealPath("/upload/board/");
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(saveDirectory+boardFilepath));
				ServletOutputStream sos = response.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(sos);
				String resboardFilename = "";
				boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 || 
								request.getHeader("user-agent").indexOf("Trident")!=-1;
				if(bool) { //브라우저가 IE인 경우
					resboardFilename = URLEncoder.encode(boardFilename, "UTF-8");
					resboardFilename = resboardFilename.replaceAll("\\\\", "%20"); // \는 폴더를 구분할 때 사용
				}else { //그 외 브라우저인 경우
					resboardFilename = new String(boardFilename.getBytes("UTF-8"),"ISO-8859-1");
				}
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", "attachment;boardFilename="+resboardFilename);
				int read = -1;
				while((read=bis.read())!=-1) {
					bos.write(read);
				}
				bos.close();
				bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
