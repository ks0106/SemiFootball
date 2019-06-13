package member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet(name = "SearchPwd", urlPatterns = { "/searchPwd" })
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Random random = new Random();
		String num = new String();
		for(int i =0;i<7;i++) {
			num+=String.valueOf(random.nextInt(10));
		}
		
		try {
			String id1 = new MemberService().searchPwd(id,name);
			if(id1==null) {
				
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson(id1,response.getWriter());
			}else {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson(num,response.getWriter());
				String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
				final String user = "keh1159@naver.com"; // 패스워드 
				final String password = "!kim15387900";      // SMTP 서버 정보를 설정한다. 
				Properties props = new Properties(); 
				props.put("mail.smtp.host", host); 
				props.put("mail.smtp.port", 587); 
				props.put("mail.smtp.auth", "true");


				
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
					protected PasswordAuthentication getPasswordAuthentication() { 
						return new PasswordAuthentication(user, password); 
						} 
					});
				
				try {
					MimeMessage message = new MimeMessage(session); 
					message.setFrom(new InternetAddress(user)); 
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(id)); 
					// 메일 제목 
					message.setSubject("KH Sports Football"); 
					
				
				
				// 메일 내용 
				message.setContent("<!DOCTYPE html>\r\n" + 
						"<html>\r\n" + 
						"<head>\r\n" + 
						"<meta charset=\"UTF-8\">\r\n" + 
						"<title>Insert title here</title>\r\n" + 
						"</head>\r\n" + 
						"    <style>\r\n" + 
						"        div{\r\n" + 
						"           \r\n" + 
						"        }\r\n" + 
						"    </style>\r\n" + 
						"<body>\r\n" + 
						"    <div style=\"padding-left: 50px;padding-top:20px; margin: 100px; width:1155px; border: 2px solid darkgray;\" >\r\n" + 
						"        <img src=\"http://192.168.10.58/img/header_logo.png\" style=\"width:200px;height:200px;\"><br>\r\n" + 
						"        <div style=\"padding-top:30px;font-weight:bold;\">\r\n" + 
						"    <p style=\"text-align:left;\">\r\n" + 
						"        저희 KS Sports Football를 이용해 주셔서 감사합니다.<br><br>\r\n" + 
						"        \r\n" + 
						"        암호를 재설정하려면 <a style=\"font-size:20px;\" href='http://192.168.10.58/views/login/searchPwdEmail.jsp?num="+num+"'>이 링크</a>를 클릭하십시오.<br><br>\r\n" + 
						"        보안을 위해 이 링크는 전송된 후 2분이 지나면 만료됩니다. 암호화 관련된 문제가 계속 발생 하는경우 <a href=\"http://192.168.10.58/fAQ\">KS Sports Football 고객센터로</a> 문의하세요.<br><br>\r\n" + 
						"        감사합니다. <br>\r\n" + 
						"        KS Sports Football 팀\r\n" + 
						"    </p>\r\n" + 
						"       </div>\r\n" + 
						"    </div>\r\n" + 
						"</body>\r\n" + 
						"</html>","text/html;charset=euc-kr"); 
				// send the message 
				Transport.send(message); 
				System.out.println("Success Message Send"); 
				
				} catch (MessagingException e) { 
					e.printStackTrace(); 
					} 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
