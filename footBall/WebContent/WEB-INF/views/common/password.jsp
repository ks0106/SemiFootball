<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.underline{
		margin:0 auto;
		width:7%;
		text-align:center;
		border-top:2px solid #bfc4cc;
	}
</style>
<body>
	<div id="divpwd" style="width:78%;height:500px; border-left:1px solid silver;display:inline-block;overflow:hidden; ">
		<div class="tab-content">
          	<!-- 탭컨텐츠 제목 -->
             <br><br><br>
			<div style="font-size:40px; color: #403d3f; text-align: center; margin-bottom: 20px;font-weight:bolder;color:#2c3c57;">비밀번호 재확인</div>
			<div class="underline"></div>
			<!-- 글쓰기 버튼 -->
			<div class="btn-wrapper" style="margin: 0 auto; margin-top:50px;margin-bottom:0px; text-align:center;width: 100%;">
				<div style="width: 90%;padding-left: 70px;">								
					<input type="password" id="checkpwd" name="pwd" style="width: 300px;height:40px;left: 300px;border:2px solid #2c3c57;font-size:30px;vertical-align:middle">
					<button type="button" id="pwd" style="border:none;background-color: #2c3c57;width: 150px;height: 45px;color:white;">									
						<span style="color:white;height:80%;width: 100%;display: inline;font-size: 15px; vertical-align:middle;padding:0;margin:0;vertical-align:middle"> 확인 </span> 
					</button>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript"> //비밀번호 확인하는 if문
			$("#pwd").click(function () {
				//var pwd1 = '${sessionScope.member.pwd}';
				var pwd1 = '${member.pwd}';
				var pwd = $("#checkpwd").val();
				console.log(pwd1);
				console.log(pwd);
				if(pwd1==pwd){
					$("#divpwd").css("display","none");
					$("#mypage").css("display","block");
				}else{
					alert("비밀번호가 일치하지 않습니다.");
				}
			});
		</script>
</body>
</html>