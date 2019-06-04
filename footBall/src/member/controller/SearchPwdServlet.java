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
		System.out.println(num);
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
		final String user = "rudtjr008@naver.com"; // 패스워드 
		final String password = "vkfl1643!@";      // SMTP 서버 정보를 설정한다. 
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
		message.setText("회원님의 비밀번호 인증번호"+num); 
		// send the message 
		Transport.send(message); 
		System.out.println("Success Message Send"); 
		RequestDispatcher rd = request.getRequestDispatcher("/views/login/insert2.jsp");
		request.setAttribute("num", num);
		rd.forward(request, response);
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
