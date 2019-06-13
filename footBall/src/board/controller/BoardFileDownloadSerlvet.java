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
				System.out.println(boardFilename+'/'+boardFilepath);
				String saveDirectory = getServletContext().getRealPath("/upload/board/");
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(saveDirectory+boardFilepath));
				ServletOutputStream sos = response.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(sos);
				String resFilename = "";//브라우저마다 다르게 설정해야하므로 일단 비워둠
				boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 || 
								request.getHeader("user-agent").indexOf("Trident")!=-1;
				System.out.println("IE여부 : "+bool); //IE : true / 아닌경우(크롬) : false
				if(bool) { //브라우저가 IE인 경우
					resFilename = URLEncoder.encode(boardFilename, "UTF-8");
					resFilename = resFilename.replaceAll("\\\\", "%20"); // \는 폴더를 구분할 때 사용
				}else { //그 외 브라우저인 경우
					resFilename = new String(boardFilename.getBytes("UTF-8"),"ISO-8859-1");
				}//다운로드할 파일 명 설정 끝
				// 파일 다운로드를 위한 HTTP Header설정
				response.setContentType("application/octet-stream");//파일나갈꺼야 라는 신호
				response.setHeader("Content-Disposition", "attachment;filename="+resFilename); //이 이름으로 다운받아진다
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
