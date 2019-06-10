<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String random = request.getParameter("num");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기 이메일인증</title>
	<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous">
	</script>
</head>
<body>
		 <div style="padding-left: 50px;padding-top:20px; margin: 100px; width:1155px; border: 2px solid darkgray;" >
        <img src="/img/header_logo.png" style="width:200px;height:200px;"><br>
        <div style="padding-top:30px;font-weight:bold;">
    <p style="text-align:left;">
        저희 KS Sports Football를 이용해 주셔서 감사합니다.<br><br>
        
     <h1>회원님의 본인 인증이 완료되었습니다.</h1><br><br>
        보안을 위해 이 링크는 전송된 후 5초가 지나면 만료됩니다. 암호화 관련된 문제가 계속 발생 하는경우 <a href="http://localhost/fAQ">KS Sports Football 고객센터로</a> 문의하세요.<br><br>
        감사합니다. <br>
        KS Sports Football 팀
    </p>
       </div>
    </div>	
		<input type="hidden" id="btn" value="변경하기" >
		<script type="text/javascript">
		
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket('ws://localhost:80/footBall/broadcasting');
		var inputMessage = document.getElementById('inputMessage');
		webSocket.onerror = function (event) {
			onError(event)
		};
		webSocket.onopen = function (event) {
			onOpen(event)
		};
		webSocket.onmessage = function (event) {
			onMessage(event)
		};
		function onMessage(event) {
			event.data; 
		}
		function onOpen(event) {
			//textarea.value += "연결 성공\n ";
			webSocket.send(<%=random%>);
			console.log(<%=random%>);
		}
		function onError(event) {
			alert(event.data);
		}
		function send() {
			//1111111
			//textarea.value += "나 :" + inputMessage.value + "\n";
			webSocket.send(<%=random%>);
			//inputMessage.value="";
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			 var minute = 0;
		      var second = 5;
		      
		      $(".countTimeMinute").html(minute);
		      $(".countTimeSecond").html(second);
		   
		        timer = setInterval(function(){
		         $(".countTimeMinute").html(minute);
		         $(".countTimeSecond").html(second);
		        
		         if(second == 0 && minute == 0){
		            $("#layerPopup p").html("인증 시간이 초과 되었습니다.");
		            $("#layerPopup").show();
		            clearInterval(timer);
		            self.close();
		         }else{
		            second--;
		            
		            if(second < 0){
		               minute--;
		               second = 59
		            }
		         }
		      },1000);   
		});
	</script> 

</body>
</html>