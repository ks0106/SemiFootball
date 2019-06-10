package branch.controllor;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import branch.model.service.BranchService;
import branch.model.vo.BranchImgs;
import court.model.vo.Court;

/**
 * Servlet implementation class InsertBiAndCSerlvlet
 */
@WebServlet(name = "insertBiAndC", urlPatterns = { "/insertBiAndC" })
public class InsertBiAndCSerlvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBiAndCSerlvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int branchCode = 0;
		StringBuffer courtName1 = new StringBuffer();
		StringBuffer courtName2 = new StringBuffer();
		StringBuffer courtName3 = new StringBuffer();
		StringBuffer courtType1 = new StringBuffer();
		StringBuffer courtType2 = new StringBuffer();
		StringBuffer courtType3 = new StringBuffer();
		StringBuffer courtIndoor1 = new StringBuffer();
		StringBuffer courtIndoor2 = new StringBuffer();
		StringBuffer courtIndoor3 = new StringBuffer();
		ArrayList<String> biList = new ArrayList<>();
		
		DiskFileItemFactory diskFactory = new DiskFileItemFactory();
		diskFactory.setSizeThreshold(4096000);
		diskFactory.setRepository(new File(getServletContext().getRealPath("/")+"img/temp"));
		ServletFileUpload upload = new ServletFileUpload(diskFactory);
		upload.setSizeMax(10*1024*1024);
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			while(iter.hasNext()) {
				FileItem item = iter.next();
				if(item.isFormField()) {
					String fieldName = item.getFieldName();
					switch(fieldName) {
						case "branchCode":
							branchCode = Integer.parseInt(item.getString());
							break;
						case "courtName1": 
							courtName1.append(item.getString("UTF-8"));
							break;
						case "courtName2":
							courtName2.append(item.getString("UTF-8"));
							break;
						case "courtName3":
							courtName3.append(item.getString("UTF-8"));
							break;
						case "courtType1":
							courtType1.append(item.getString("UTF-8"));
							break;
						case "courtType2":
							courtType2.append(item.getString("UTF-8"));
							break;
						case "courtType3":
							courtType3.append(item.getString("UTF-8"));
							break;
						case "courtIndoor1":
							courtIndoor1.append(item.getString("UTF-8"));
							break;
						case "courtIndoor2":
							courtIndoor2.append(item.getString("UTF-8"));
							break;
						case "courtIndoor3":
							courtIndoor3.append(item.getString("UTF-8"));
							break;	
					}
				} else {
					String fileOriginName = item.getName();
					if(!fileOriginName.equals("")) {
//						String fieldName = item.getFieldName();
//						String contentType = item.getContentType();
//						long fileSIze = item.getSize();
						
						//중복파일명에 넘버링
						String filenameFront = fileOriginName.substring(0, fileOriginName.lastIndexOf('.'));
						String filenameExtention = fileOriginName.substring(fileOriginName.lastIndexOf('.'));
						File uploadFile = null;
						StringBuilder fileName = new StringBuilder();
						int num = 0;
						while(true) {
							fileName.setLength(0);
							fileName.append(filenameFront);
							if(num !=0) {
								fileName.append("_"+num);
							}
							fileName.append(filenameExtention);
							uploadFile = new File(getServletContext().getRealPath("/")+"img/branch/"+fileName.toString());
							if(!uploadFile.exists()) {
								biList.add("/img/branch/"+fileName.toString());
								try {
									item.write(uploadFile);
									break;
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}
							num++;
						}//while ends
					}
				}
			}//while ends
			
//			변수들 정리해서 서비스 보내기
			StringBuffer bi1 = new StringBuffer();
			StringBuffer bi2 = new StringBuffer();
			StringBuffer bi3 = new StringBuffer();
			StringBuffer bi4 = new StringBuffer();
			switch(biList.size()) {
			case 1 :
				bi1.append(biList.get(0));
				break;
			case 2 :
				bi1.append(biList.get(0));
				bi2.append(biList.get(1));
				break;
			case 3 :
				bi1.append(biList.get(0));
				bi2.append(biList.get(1));
				bi3.append(biList.get(2));
				break;
			case 4 :
				bi1.append(biList.get(0));
				bi2.append(biList.get(1));
				bi3.append(biList.get(2));
				bi4.append(biList.get(3));
			}
			BranchImgs bi = new BranchImgs(branchCode, bi1.toString(), bi2.toString(), bi3.toString(), bi4.toString());
			
			String cN1 = courtName1.toString();
			String t1 = courtType1.toString();
			String i1 = courtIndoor1.toString();
			Court c1 = new Court(branchCode, 0, cN1, t1, i1, 0);
			
			String cN2 = courtName2.toString();
			String t2 = courtType2.toString();
			String i2 = courtIndoor2.toString();
			Court c2 = new Court(branchCode, 0, cN2, t2, i2, 0);
			
			String cN3 = courtName3.toString();
			String t3 = courtType3.toString();
			String i3 = courtIndoor3.toString();
			Court c3 = new Court(branchCode, 0, cN3, t3, i3, 0);
			
			int biResult = new BranchService().insertBi(bi);
			int c1Result = new BranchService().insertCourt(c1);
			int c2Result = new BranchService().insertCourt(c2);
			int c3Result = new BranchService().insertCourt(c3);
			
			if(biResult>0 && c1Result>0 && c2Result>0 && c3Result>0) {
				request.setAttribute("msg", "세부정보 입력 완료");
			} else {
				request.setAttribute("msg", "입력 실패");
			}
			request.setAttribute("loc", "/branchManage");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);;
		} catch (FileUploadException e) {
				request.setAttribute("msg", "사진 업로드 중 오류 발생");
				request.setAttribute("loc", "/branchManage");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);;
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
