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
import branch.model.vo.Branch;
import branch.model.vo.BranchImgs;
import court.model.vo.Court;

/**
 * Servlet implementation class ModifyBDataServlet
 */
@WebServlet(name = "modifyBData", urlPatterns = { "/modifyBData" })
public class ModifyBDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int branchCode = 0;
		String branchName = new String();
		String branchAddr = new String();
		String branchPhone = new String();
		String branchTel = new String();
		
		String courtName1 = new String();
		String courtName2 = new String();
		String courtName3 = new String();
		String courtType1 = new String();
		String courtType2 = new String();
		String courtType3 = new String();
		String courtIndoor1 = new String();
		String courtIndoor2 = new String();
		String courtIndoor3 = new String();
		String courtCode1 = new String();
		String courtCode2 = new String();
		String courtCode3 = new String();
		
		String status1 = new String();
		String status2 = new String();
		String status3 = new String();
		String status4 = new String();
		String oldFilename1 = new String();
		String oldFilename2 = new String();
		String oldFilename3 = new String();
		String oldFilename4 = new String();
		String oldFilepath1 = new String();
		String oldFilepath2 = new String();
		String oldFilepath3 = new String();
		String oldFilepath4 = new String();
		
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
						case "branchName":
							branchName = item.getString("UTF-8");
							break;
						case "branchAddr":
							branchAddr = item.getString("UTF-8");
							break;
						case "branchPhone":
							branchPhone = item.getString("UTF-8");
							break;
						case "branchTel":
							branchTel = item.getString("UTF-8");
							break;
						case "courtName1": 
							courtName1 = (item.getString("UTF-8"));
							break;
						case "courtName2":
							courtName2 = (item.getString("UTF-8"));
							break;
						case "courtName3":
							courtName3 = (item.getString("UTF-8"));
							break;
						case "courtType1":
							courtType1 = (item.getString("UTF-8"));
							break;
						case "courtType2":
							courtType2 = (item.getString("UTF-8"));
							break;
						case "courtType3":
							courtType3 = (item.getString("UTF-8"));
							break;
						case "courtIndoor1":
							courtIndoor1 = (item.getString("UTF-8"));
							break;
						case "courtIndoor2":
							courtIndoor2 = (item.getString("UTF-8"));
							break;
						case "courtIndoor3":
							courtIndoor3 = (item.getString("UTF-8"));
							break;	
						case "courtCode1":
							courtCode1 = (item.getString("UTF-8"));
							break;
						case "courtCode2":
							courtCode2 = (item.getString("UTF-8"));
							break;
						case "courtCode3":
							courtCode3 = (item.getString("UTF-8"));
							break;
						
						case "status1":
							status1 = (item.getString("UTF-8"));
							break;
						case "status2":
							status2 = (item.getString("UTF-8"));
							break;
						case "status3":
							status3 = (item.getString("UTF-8"));
							break;
						case "status4":
							status4 = (item.getString("UTF-8"));
						case "oldFilename1":
							oldFilename1 = (item.getString("UTF-8"));
							break;
						case "oldFilename2":
							oldFilename2 = (item.getString("UTF-8"));
							break;
						case "oldFilename3":
							oldFilename3 = (item.getString("UTF-8"));
							break;
						case "oldFilename4":
							oldFilename4 = (item.getString("UTF-8"));
						case "oldFilepath1":
							oldFilepath1 = (item.getString("UTF-8"));
							break;
						case "oldFilepath2":
							oldFilepath2 = (item.getString("UTF-8"));
							break;
						case "oldFilepath3":
							oldFilepath3 = (item.getString("UTF-8"));
							break;
						case "oldFilepath4":
							oldFilepath4 = (item.getString("UTF-8"));	
					}
				} else {
					String fileOriginName = item.getName();
					if(!fileOriginName.equals("")) {
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
							System.out.print(filenameFront); //test
							System.out.println(filenameExtention);
							System.out.println(uploadFile.exists()); //test
							if(!uploadFile.exists()) {
								biList.add("/img/branch/"+fileName.toString());
								for(String str :biList) {
									System.out.println(str);
								}
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
			
			if(status1.equals("delete")) {
				File deleteFile = new File(oldFilename1);
				deleteFile.delete();
			} else if(status1.equals("stay") && !(oldFilename1.equals(""))) {
				biList.add(oldFilename1);
			}
			if(status2.equals("delete")) {
				File deleteFile = new File(oldFilename2);
				deleteFile.delete();
			} else if(status2.equals("stay") && !(oldFilename2.equals(""))) {
				biList.add(oldFilename2);
			}
			if(status3.equals("delete")) {
				File deleteFile = new File(oldFilename3);
				deleteFile.delete();
			} else if(status3.equals("stay") && !(oldFilename3.equals(""))) {
				biList.add(oldFilename3);
			}
			if(status4.equals("delete")) {
				File deleteFile = new File(oldFilename4);
				deleteFile.delete();
			} else if(status4.equals("stay") && !(oldFilename4.equals(""))) {
				biList.add(oldFilename4);
			}
			for(String str :biList) {
				System.out.println(str);
			}
			System.out.println(biList.size());
//			변수들 정리해서 서비스 보내기
			String bi1 = "";
			String bi2 = "";
			String bi3 = "";
			String bi4 = "";
			switch(biList.size()) {
			case 1 :
				bi1 = (biList.get(0));
				break;
			case 2 :
				bi1 = (biList.get(0));
				bi2 = (biList.get(1));
				break;
			case 3 :
				bi1 = (biList.get(0));
				bi2 = (biList.get(1));
				bi3 = (biList.get(2));
				break;
			case 4 :
				bi1 = (biList.get(0));
				bi2 = (biList.get(1));
				bi3 = (biList.get(2));
				bi4 = (biList.get(3));
			}
			for(String str :biList) {
				System.out.println(str);
			}
			Branch b = new Branch(branchCode, branchName, branchAddr, branchPhone, branchTel);
			int bResult = new BranchService().updateBranch(b);
			BranchImgs bi = new BranchImgs(branchCode, bi1, bi2, bi3, bi4);
			System.out.println(bi);
			int biResult = new BranchService().updateBi(bi);
			int c1Result = -1;
			int c2Result = -1;
			int c3Result = -1;
			if(!(courtName1.equals(""))) {
				Court c1 = new Court(branchCode, Integer.parseInt(courtCode1), courtName1, courtType1, courtIndoor1, 0);
				c1Result = new BranchService().updateCourt(c1);
			}
			if(!(courtName2.equals(""))) {
				Court c2 = new Court(branchCode, Integer.parseInt(courtCode2), courtName2, courtType2, courtIndoor2, 0);
				c2Result = new BranchService().updateCourt(c2);
			}
			if(!(courtName3.equals(""))) {
				Court c3 = new Court(branchCode, Integer.parseInt(courtCode3), courtName3, courtType3, courtIndoor3, 0);
				c3Result = new BranchService().updateCourt(c3);
			}
			
			if(bResult>0 && biResult>0 && (c1Result != -1 || c2Result != -1 || c3Result != -1)) {
				request.setAttribute("msg", "지점 수정 완료");
			} else {
				request.setAttribute("msg", "수정 실패");
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
