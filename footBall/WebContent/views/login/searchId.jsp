<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- 로그인 공통css -->
<link rel="stylesheet" href="/css/login/loginAll.css">
<!-- 아이디/패스워드 찾기 공통css -->
<link rel="stylesheet" href="/css/login/loginSearchAll.css">
</head>
	<style>
        #sub{
	        width:60px;
	        height:30px;
	        border:none;
	        background-color:#2c3c57;
	        color:white;
        }
	</style>
<body>	
		<div>
			<div style="text-align:center;">
				<img  src="/img/header_logo.png" style="width:100px;">
			</div>
	        <form>
	        	<table>
	        		<tr>
	        			<td colspan="2" style="text-align: center;"><h2>아이디 찾기</h2></td>
	        		</tr>	        	
	        		<tr>
	        			<td class="searchTdTitle">이름</td>
	        		</tr>
	        		<tr>
		        		<td><input class="searchInput" type="text" name="name" id="name"></td>
	        		</tr>
	        		
	        		<tr>
	        			<td class="searchTdTitle">아이디 찾기 힌트</td>
	        		</tr>
	        		<tr>
		        		<td>
	        				<select name="pwdHint" id="pwdHint">
			           			<option>선택하세요</option>
			           			<option value="가장 좋아하는 색상">가장 좋아하는 색상</option>
			           			<option value="가장 좋아하는 연예인">가장 좋아하는 연예인</option>
			           			<option value="내가 나온 초등학교 이름">내가 나온 초등학교 이름</option>
		           			</select>
	        			</td>
	        		
	        		</tr>
	        		<tr>
	        			<td class="searchTdTitle">아이디 찾기 정답</td>
	        		</tr>
	        		<tr>
	        			<td>
	        				<input class="searchInput" type="text" name="pwdHintAnswer" id="pwdHintAnswer">
	        			</td>
	        		</tr>
	        	</table>
	        	<div style="text-align:center;">
		        	<input type="reset" value="취소" class="resetBtn">
		        	<input type="button" class="btn btn-success" value="확인" id="sub"><br>
		        	<input type="button" value="닫기" id="close" class="closeBtn">
		        </div>
	        </form>
		</div>
	<script type="text/javascript">
		$("#close").hide();
		$("#sub").click(function () {
			var name = $("#name").val();
			var pwdHint = $("#pwdHint").val();
			var pwdHintAnswer = $("#pwdHintAnswer").val();
			$.ajax({
					url : "/searchId",
					data : {name:name,pwdHint:pwdHint,pwdHintAnswer:pwdHintAnswer},
					method: "POST",
					dataType : "json",
					success : function (data) {
							
							if(data==null){
								
								alert("일치하는 회원이 없습니다.");
								opener.location.href="/views/login/login.jsp";
								self.close();
							}else{
								console.log(data);
								$("#close").show();
								$("#close").click(function () {
									 self.close();
								});
								var id = decodeURIComponent(data);
								$("#sub").after('<h4>회원님의 아이디는 '+id+'입니다.');
							}
					
							
					},
					erorr : function () {
						
					}
			
				});
			});
		
	</script>
</body>
</html>