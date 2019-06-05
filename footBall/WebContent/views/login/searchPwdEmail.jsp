<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String random = request.getParameter("num");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous">
	</script>
</head>
<body>
		<!--  <fieldset>
		<textarea rows="10" cols="50" readonly="true" id="messageWindow"></textarea>
			<br/>
			<input id="inputMessage" type="text"/>
		</fieldset>-->
			<input type="submit" value="변경하기" onclick="send()" />
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
			textarea.value += "연결 성공\n ";
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
	
</body>
</html>