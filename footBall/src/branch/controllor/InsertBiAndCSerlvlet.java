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
		DiskFileItemFactory diskFactory = new DiskFileItemFactory();
		diskFactory.setSizeThreshold(4096000);
		diskFactory.setRepository(new File(getServletContext().getRealPath("/")+"img/temp"));
		ServletFileUpload upload = new ServletFileUpload(diskFactory);
		upload.setSizeMax(10*1024*1024);
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			ArrayList<String> list = new ArrayList<String>();
			while(iter.hasNext()) {
				FileItem item = (FileItem)iter.next();
				if(item.isFormField()) {
					String fieldName = item.getFieldName();
					String param = item.getString("UTF-8");
					list.add(fieldName);					
				} else {
					String fileOriginName = item.getName();
					if(!fileOriginName.equals("")) {
						String fieldName = item.getFieldName();
						String contentType = item.getContentType();
						long fileSIze = item.getSize();
						list.add(fieldName);
						
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
							uploadFile = new File(getServletContext().getRealPath("/")+"img/branch/test/"+fileName.toString());
							if(!uploadFile.exists()) {
								list.add(fileName.toString());
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
			for(String str : list) {
				System.out.println(str);
			}
		} catch (FileUploadException e) {
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
