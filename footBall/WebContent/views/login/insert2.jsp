<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String num = (String)request.getAttribute("num");
    %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 이메일 인증</title>
	<script
      src="http://code.jquery.com/jquery-3.4.0.slim.min.js"
      integrity="sha256-ZaXnYkHGqIhqTbJ6MB4l9Frs/r7U4jlx7ir8PJYBqbI="
      crossorigin="anonymous">
    </script>
<!-- 로그인 공통css -->
<link rel="stylesheet" href="/css/login/loginAll.css">
</head>
	<style>
		#maindiv{
			height:100%;
			margin: 0 auto;
			text-align: center;
			margin-top:100px;
		}
		.secretNumInput{
			width:150px;
			height:34px;
			vertical-align:middle;
		}
		#secretNumBtn{
			vertical-align:middle;
			width:80px;
			height:40px;
			border:none;
			background-color:#3366cc;
			color:white;
		}
		#secretNumberArea{
			margin:0 auto;
		}
		.countTimeMinute,.countTimeSecond,.countTimeTxt{
			color:gray;
		}
		#closeBtn{
			width:80px;
			height:40px;
			border:none;
			background-color:gray;
			color:white;
		}
		#checkMsg{
			color:red;
		}
	</style>
<body>
	<div id="maindiv">
		<span style="font-size:13px;">* 메일로 전송된 인증번호를 입력 후 인증버튼을 클릭해주세요.</span><br><br>
		<input class="secretNumInput" type="text" id="number" name="number"> 
		<button id="secretNumBtn" type="button" id="button" onclick="return check();">인증</button>
		<span class="countTimeMinute"></span><span class="countTimeTxt">분</span>
       	<span class="countTimeSecond"></span><span class="countTimeTxt">초</span>
		<div id="layerPopup">
	    	<p id="checkMsg">인증 시간이 초과 되었습니다.</p>
			<button id="closeBtn" type="button">닫기</button>
		</div>
	</div>

	<script type="text/javascript">
   $(document).ready(function(){
      $("#layerPopup").hide();
   
      var minute = 1;
      var second = 59;
      
      $(".countTimeMinute").html(minute);
      $(".countTimeSecond").html(second);
   
      var timer = setInterval(function(){
         $(".countTimeMinute").html(minute);
         $(".countTimeSecond").html(second);
         
         if(second == 0 && minute == 0){
            $("#layerPopup p").html("인증 시간이 초과 되었습니다.");
            $("#layerPopup").show();
            clearInterval(timer);
            //self.close();
         }else{
            second--;
            
            if(second < 0){
               minute--;
               second = 59
            }
         }
      },1000);   
      
   });
   function check(){
      var form = $("#number").val();
      var authNum = <%=num%>;
      var count = 0;
      
      if(!form){
         $("#layerPopup p").html("인증번호를 입력해주세요.");
         $("#layerPopup").show();
         return false;
      }
      if(form!=authNum){
         $("#layerPopup p").html("인증번호가 틀립니다.");
         $("#layerPopup").show();
         form.authnum.value="";
         return false;
      }
      if(form==authNum){
         //opener.$("#email").attr("readonly",true);
         opener.$("#eTxt").text("인증완료");
         opener.$("#eTxt").css("color","blue");
         opener.result[0]=true;
         self.close();
      }
   }
   $("#layerPopup button").click(function(){
       $("#layerPopup").hide();
       if($("#checkMsg").html() == "인증 시간이 초과 되었습니다."){
          opener.$("#eTxt").text("인증실패");
          opener.$("#eTxt").css("color","red");
          self.close();
       }
   });
   
</script>

</body>
</html>