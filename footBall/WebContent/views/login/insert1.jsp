<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script
      src="http://code.jquery.com/jquery-3.4.0.slim.min.js"
      integrity="sha256-ZaXnYkHGqIhqTbJ6MB4l9Frs/r7U4jlx7ir8PJYBqbI="
      crossorigin="anonymous">
    </script>
</head>
	<style>
		#maindiv{
            text-align: center;
            position: relative;
             margin: 0 auto;
            width: 80%;
        }
        #div{
            /*position: absolute;
            top: 100px;
            left: 600px;*/
            padding-top : 100px;
            max-width:500px;
            margin:0 auto;
           
        }
        .span{
        	font-size: 25px;
        }
        .text1{
        	color: blue;
        }
        input[type=text]{
        	width: 500px;
        	height: 55px;
        }
        form{
        	text-align: left;
        }
        .button{
        	width: 100px;
        	height: 50px;
        	background-color: #3163C9;
        }
        #button{
        	width:503px;
        	height: 60px;
        	background-color: #3163C9;
        }
	</style>
<body>
		<div style="height:900px;" id="maindiv">
        <div id="div">
            <img src="/img/header_logo.png" style="margin-bottom: 50px;">
           	<form action="/insert" method="post">
           		<span class="span">아이디(이메일)</span><span class="text1">(필수)</span><span class="extext"></span><br><br>
           		<input type="text" name="id" id="id"><br><br>
           		
           		<span class="span">이메일 인증번호 전송</span>
           		<input type="button" value="전송" class="button"><br><br>
           		
           		
           		<span class="span">비밀번호</span><span class="text1">(필수)</span><span class="extext"></span><br><br>
           		<input type="text" name="pwd"><br><br>
           		
           		<span class="span">비밀번호 재확인</span><span class="text1">(필수)</span><span class="extext"></span><br><br>
           		<input type="text" name="pwd1"><br><br>
           		
           		<span class="span">이름</span><span class="text1">(필수)</span><span class="extext"></span><br><br>
           		<input type="text" name="name"><br><br>
           		
           		<span class="span">휴대전화</span><span class="text1">(필수)</span><span class="extext"></span><br><br>
           		<input type="text" name="phone"><br><br>
           		
           		<input type="submit" value="가입하기" id="button">
           		
           	</form>
        </div>
        <br>
    </div>
    <script>
    $(".button").click(function(){
        var email = $("#id").val();
        var url = "/emailCheck";
        var pop = window.open("insert2.jsp","emailCheck","width=300,height=300");
        pop.location.href=url+"?email="+email;
        
     });
    </script>
</body>
</html>