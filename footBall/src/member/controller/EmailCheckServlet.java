package member.controller;

import java.io.IOException;
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

      final String user = "rudtjr008@naver.com"; // 패스워드 
      final String password = "rksk1643!@";      // SMTP 서버 정보를 설정한다. 

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
         
      
      Random random = new Random();
      String num = new String();
      for(int i =0;i<7;i++) {
         num+=String.valueOf(random.nextInt(10));
         
      }
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
				"        <img src=\"http://localhost/img/header_logo.png\" style=\"width:200px;height:200px;\"><br>\r\n" + 
				"        <div style=\"padding-top:30px;font-weight:bold;\">\r\n" + 
				"    <p style=\"text-align:left;\">\r\n" + 
				"        저희 KS Sports Football를 이용해 주셔서 감사합니다.<br><br>\r\n" + 
				"        \r\n" + 
				"        회원님의 본인인증 키 "+num+" 입니다.<br><br>\r\n" + 
				"        보안을 위해 이 링크는 전송된 후 2분이 지나면 만료됩니다. 암호화 관련된 문제가 계속 발생 하는경우 <a href=\"http://localhost/fAQ\">KS Sports Football 고객센터로</a> 문의하세요.<br><br>\r\n" + 
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