<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	  <style>
		.helpMenu{
			font-size:14px;
			color:rgb(82,82,82);
		}
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
            width:480px;
            padding-top : 100px;
            margin:0 auto;
            text-align:center;
        }
        .loginInput{
            width: 445px;
            height: 30px;
            top: 100px;
            font-size:15px;
            padding:15px;
            margin-bottom:15px;
        }
        #loginActionBtn{
        	width:478px;
        	height:70px;
        	font-size:20px;
        	margin-top:20px;
        	border:none;
        	background-color:#2c3c57;
        	color:white;
        	cursor:pointer;
        }
        #loginActionBtn:hover{
        	background-color:#3366cc;
        }
        a{
            text-decoration: none;
            color: black;
        }
    </style>
<!-- 로그인 공통css -->
<link rel="stylesheet" href="/css/login/loginAll.css">
</head>
<body>
	<div style="height:900px;" id="maindiv">
        <div id="div">
        	<a href="/">
            <img src="/img/header_logo.png" style="margin-bottom: 50px;"></a>
            <form action="/login" method="post">
            <input type="text" name="id" placeholder="이메일" class="loginInput" autocomplete="off"><br>
            <input type="password" name="pwd" placeholder="비밀번호" class="loginInput" autocomplete="off"><br>
            <input type="submit" value="로그인" id="loginActionBtn">
            </form>
            <br>
            <div style="border:none;height:1px;background-color:darkgray;"></div>
            <br>
            <br>
            <a class="helpMenu" href="/views/login/searchId.jsp" onclick="window.open(this.href,'아이디 찾기','width=450,height=400');return false;">아이디 찾기</a>
            <span style="font-size:15px;color:lightgray;">|</span>
            <a class="helpMenu" href="/views/login/searchPwd.jsp" onclick="window.open(this.href,'비밀번호 찾기','width=450,height=400');return false;">비밀번호 찾기</a>
            <span style="font-size:15px;color:lightgray;">|</span>
            <a class="helpMenu" href="/views/login/insert.jsp">회원가입</a>
            <br><br>
            <h1>간편로그인</h1>
            <a id="kakao-login-btn"></a>
			<a href="http://developers.kakao.com/logout"></a>
			
        </div>
        <br>
    </div>

<script type='text/javascript'>
	
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('890623b0f2c26b0306378ab759f886b5');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
  	 Kakao.Auth.createLoginButton({

   container: '#kakao-login-btn',

   success: function(authObj) {

     Kakao.API.request({

       url: '/v1/user/me',

       success: function(res) {

             //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

             //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
            
			location.href="/kakaoLogin?id="+res.id+"&name="+res.properties['nickname'];
         // res.properties.nickname으로도 접근 가능 )

           }

         })

       },

       fail: function(error) {

         alert(JSON.stringify(error));

       }

     });
</script>
</body>
</html>