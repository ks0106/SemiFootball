<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 회원가입</title>
	<script
      src="http://code.jquery.com/jquery-3.4.0.slim.min.js"
      integrity="sha256-ZaXnYkHGqIhqTbJ6MB4l9Frs/r7U4jlx7ir8PJYBqbI="
      crossorigin="anonymous">
    </script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 로그인 공통css -->
<link rel="stylesheet" href="/css/login/loginAll.css">
</head>
	<style>	
		#maindiv{
            text-align: center;
            position: relative;
            margin: 0 auto;
            width: 100%;
        }
        #div{
            /*position: absolute;
            top: 100px;
            left: 600px;*/
            margin-top:100px;
            width:500px;
            margin:0 auto;
           
        }
        .span{
        	font-size: 20px;
        }
        input[type=text]{
        	width: 500px;
        	height: 55px;
        }
        input[type=password]{
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
        .button1{
        	width:247px;
        	height: 60px;
        	background-color: gray;
        	border:none;
        	color:white;
        	font-size:16px;
        }
        input::placeholder{
        	font-size: 20px;
        }
        select{
        	width:200px;
        	padding: .8em .5em; /* 여백으로 높이 설정 */ 
        	font-family: inherit; /* 폰트 상속 */ 
        	border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */        	
        	-moz-appearance: none; 
        	appearance: none;
        }
        #eTxt{
         color: red;
        }
        #btn1{
	        background-color: #2c3c57;
        }
        #divarea{
        	width:900px;
        	margin:0 auto;
        }
        .joinInput{
            font-size:15px;
            padding:15px;
            margin-bottom:15px;        
        }
        #emailGo{
        	width:150px;
        	height:40px;
        	font-size:16px;
        	font-weight:bolder;
        	color:white;
        	background-color:#2c3c57;
        	border:none;
        	border-radius:5px;
        }
	</style>
<body>
		<div id="maindiv">
	        <div id="divarea">
		        <div id="div">
    	    	<a href="/"><img src="/img/header_logo.png" style="margin-top:100px;margin-bottom:50px;"></a>
    	    	<div style="text-align:left;">* 표시는 필수 입력 사항입니다.</div><br>
	           	<form action="/insert" method="post">
	           		<span class="span">* 아이디(이메일)</span><span id="extext"></span><br>
	           		<input class="joinInput" type="text" name="id" id="id" placeholder="test@naver.com";><br>
	           		
	           		<span class="span">* 이메일 인증</span><br>
	           		<label id="eTxt">인증이 필요합니다.</label><br>
	           		<input type="button" class="button btn btn-primary" id="emailGo" value="인증번호 전송""><br><br>
	           		
	           		<span class="span">* 비밀번호</span><span id="extext1"></span><br>
	           		<input class="joinInput" type="password" name="pwd" id="pwd"><br>
	           		
	           		<span class="span">* 비밀번호 재확인</span><span id="extext2"></span><br>
	           		<input class="joinInput" type="password" name="pwd1" id="pwd1"><br>
	           		
	           		<span class="span">* 아이디 찾기 힌트</span><br>
	           		<select name="pwdHint" style="width:500px;height:55px;">
	           			<option>선택하세요</option>
	           			<option value="가장 좋아하는 색상">가장 좋아하는 색상</option>
	           			<option value="가장 좋아하는 연예인">가장 좋아하는 연예인</option>
	           			<option value="내가 나온 초등학교 이름">내가 나온 초등학교 이름</option>
	           		</select><br><br>
	           		<span class="span">* 아이디 찾기 정답</span><br>
	           		<input class="joinInput" type="text" name="pwdHintAnswer"><br>
	           		
	           		<span class="span">* 이름</span><span id="extext3"></span><br>
	           		<input class="joinInput" type="text" name="name" id="name"><br>
	           		
	           		<span class="span">* 휴대전화</span><span id="extext4"></span><br>
	           		<input class="joinInput" type="text" name="phone" id="phone" placeholder="(-)함께 작성하세요";><br><br>
	           		
	           		<input type="reset" value="취소하기" class="button1" onclick="rset();">
	           		<input type="submit" value="가입하기" class="button1" id="btn1" >
	           	</form>
           	</div>
        </div>
        <br>
    </div>
    <script>
    $(".button").click(function(){
        var email = $("#id").val();
        var url = "/emailCheck";
        var pop = window.open("insert2.jsp","emailCheck","width=400,height=300");
        pop.location.href=url+"?email="+email;
        
     });
    </script>
 	<script>
 		var result =[false,false,false,false,false]
 		$(document).ready(function() {
 			$(".button").prop("disabled",true); //이메일 인증버튼 비활성화
			$("#id").blur(function () {
				var id = $("#id").val();
				var text = /[a-z0-9]@[a-z]+\.[a-z]{2,6}$/;
				 if(id==''){
					 $('#extext').html('');
				 }else{
					 if(!text.test(id)){
	                     $('#extext').html('이메일 형식으로 입력하세요');
	                     $('#extext').css('color','red');
	                     $(".button").prop("disabled",true);
	                     return false;
	                 }else{
	                      $('#extext').html('');
	                     
	                     $(".button").prop("disabled",false); //이메일 인증 버튼 활성화
	                     return true;
/* 	                     if($("#eTxt").text()=="인증완료"){
	                    		console.log($("#eTxt").text()); 
	                    		result[0]='true';
	                    	 return true;
	                     }
 */	                     
	                 };	
				 };
			});
			
			$("#pwd").blur(function () {
				var pwd = $("#pwd").val();
				var text = /^[a-z][a-z0-9]{5,17}$/i;
				if(pwd==''){
					$('#extext1').html('');
				}else{
					if(!text.test(pwd)){
						$("#extext1").html('영어 대/소문자+숫자 6~18자리');
						$("#extext1").css('color','red');
						return false;
					}else{
						$('#extext1').html('');
						result[1]='true';
						return true;
					};
					
				};
			});
			
			$('#pwd1').blur(function () {
				var pwd = $('#pwd').val();
				var pwd1 = $('#pwd1').val();
				if(pwd1==''){
					$('#extext2').html('');
				}else{					
					if(!(pwd==pwd1)){
						$('#extext2').html('비밀번호를 확인하세요');
						$('#extext2').css('color','red');
						return false;
					}else{
						$('#extext2').html('');
						result[2]='true';
						return true;
					};				
				}
			});
			
			$('#name').blur(function () {
				var name = $('#name').val();
				var text = /^[가-힣]{2,4}$/;
				if(name==''){
					$('#extext3').html('');				
				}else{	
					if(!text.test(name)){
						$('#extext3').html('한글로2~4글자를 입력하세요');
						$('#extext3').css('color','red');
						return false;
					}else{
						$('#extext3').html('');
						result[3]='true';
						return true;
					};
				};
			});
			
			$('#phone').blur(function () {
				var phone = $('#phone').val();
				var text = /^[0-9]{3}-[0-9]{3,4}-[0-9]{3,4}$/;
				if(phone==''){
					$('#extent4').html('');
				}else{
					if(!text.test(phone)){
						$('#extext4').html('첫번째는2~3개숫자,두번째는 3~4개숫자');
						$('#extext4').css('color','red');
						return false;
					}else{
						$('#extext4').html('');
						result[4]='true';
						return true;
					};
				};
			});
			
			$('#btn1').click(function(event){
	               for(var i=0;i<result.length;i++){
	                    console.log(result[i]);
	                        if(!result[i]){
	                            alert("입력을 확인하세요");
	                            event.isDefaultPrevented;
	                            return false;
	                        };
	                };
	        });
		});
 	</script>   
 	<script>
 		function rset() {
 			$('#extext').html('');
 			$('#extext1').html('');
 			$('#extext2').html('');
 			$('#extext3').html('');
 			$('#extext4').html('');
		}
 	</script>
</body>
</html>