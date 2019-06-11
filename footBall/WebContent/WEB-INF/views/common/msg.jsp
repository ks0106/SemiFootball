<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 에러페이지</title>
</head>
<body>
<!-- msg.jsp는 사용하지 않을 수도 있으나 미리 작성함 -->
	<script>
		alert("${msg }");
		location.href="${loc }";
	</script>
</body>
</html>