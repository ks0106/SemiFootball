package member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailCheckServlet
 */
@WebServlet(name = "EmailCheck", urlPatterns = { "/emailCheck" })
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("email");
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
		String user = "rudtjr008@naver.com"; // 패스워드 
		String password = "vkflco1643!@";      // SMTP 서버 정보를 설정한다. 
		Properties props = new Properties(); 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true"); 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			protected PasswordAuthentication getPasswordAuthentication() { 
				return new PasswordAuthentication(user, password); } }); 
		try { MimeMessage message = new MimeMessage(session); 
		message.setFrom(new InternetAddress(user)); 
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(id)); 
		// 메일 제목 
		message.setSubject("KTKO SMTP TEST1111"); 
		// 메일 내용 
		message.setText("KTKO Success!!"); 
		// send the message 
		Transport.send(message); System.out.println("Success Message Send"); 
		} catch (MessagingException e) { 
			e.printStackTrace(); } 
		}


		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
