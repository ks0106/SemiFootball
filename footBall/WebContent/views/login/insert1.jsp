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
        	background-color: #3163C9;
        }
        input::placeholder{
        	font-size: 20px;
        }
	</style>
<body>
		<div style="height:900px;" id="maindiv">
        <div id="div">
            <img src="/img/header_logo.png" style="margin-bottom: 50px;">
           	<form action="/insert" method="post">
           		<span class="span">아이디(이메일)</span><span class="text1">(필수)</span><span id="extext"></span><br><br>
           		<input type="text" name="id" id="id" placeholder="test@naver.com";><br><br>
           		
           		<span class="span">이메일 인증번호 전송</span>
           		<input type="button" value="전송" class="button"><label id="eTxt"></label><br><br>
           		
           		
           		<span class="span">비밀번호</span><span class="text1">(필수)</span><span id="extext1"></span><br><br>
           		<input type="password" name="pwd" id="pwd"><br><br>
           		
           		<span class="span">비밀번호 재확인</span><span class="text1">(필수)</span><span id="extext2"></span><br><br>
           		<input type="password" name="pwd1" id="pwd1"><br><br>
           		
           		<span class="span">이름</span><span class="text1">(필수)</span><span id="extext3"></span><br><br>
           		<input type="text" name="name" id="name"><br><br>
           		
           		<span class="span">휴대전화</span><span class="text1">(필수)</span><span id="extext4"></span><br><br>
           		<input type="text" name="phone" id="phone" placeholder="(-)함께 작성하세요";><br><br>
           		
           		<input type="reset" value="취소하기" class="button1" onclick="rset();">
           		<input type="submit" value="가입하기" class="button1" id="btn1">
           	</form>
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
			$("#id").blur(function () {
				var id = $("#id").val();
				var text = /[a-z0-9]@[a-z]+\.[a-z]{2,6}$/;
				 if(id==''){
					 $('#extext').html('');
				 }else{
					 if(!text.test(id)){
	                     $('#extext').html('이메일 형식으로 입력하세요');
	                     $('#extext').css('color','red');
	                     return false;
	                 }else{
	                      $('#extext').html('');
	                     result[0]='true';
	                     return true;
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