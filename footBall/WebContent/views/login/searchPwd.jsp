<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<style>
		select{
        	width:160px;
        	padding: .8em .5em; /* 여백으로 높이 설정 */ 
        	font-family: inherit; /* 폰트 상속 */ 
        	border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */        	
        	-moz-appearance: none; 
        	appearance: none;
        }
        table{
        	margin: 0 auto;
        	padding-top: 20px;
        
	</style>
<body>
		<center>
        <form >
        	<table>
        		<tr>
        			<td colspan="2" style="text-align: center;"><h2>비밀번호 찾기</h2></td>
        		</tr>
        		<tr>
        			<td style="float: right;">이름 :</td><td colspan="2"><input type="text" name="name" id="name"></td>
        		</tr>
        		<tr>
        			<td style="float: right;">아이디 :</td><td colspan="2"><input type="text" name="id" id="id"></td>
        		</tr>
        	</table>
        	<input type="reset" value="취소">
        	<input type="button" value="확인" id="sub"><br>
        	<input type="button" value="닫기" id="close">
        </form>
        
         <form >
        	<table id="pwd" style="visibility: hidden;" >
        		<tr>
        			<td colspan="2" style="text-align: center;"><h2>비밀번호 변경</h2></td>
        		</tr>
        		<tr>
        			<td style="float: right;">비밀번호:</td><td colspan="2"><input type="text" name="name" id="name"></td>
        		</tr>
        		<tr>
        			<td style="float: right;">비밀번호 재입력 :</td><td colspan="2"><input type="text" name="id" id="id"></td>
        		</tr>
        		<tr>
        			<td><input type="reset" value="취소"></td><td><input type="button" value="확인" id="sub"><br></td>
        			<td><input type="button" value="닫기" id="close"></td>
        		</tr>
        	</table>
        
        </form>
		</center>
	<script type="text/javascript">
		$("#close").hide();
		$("#sub").click(function () {
			var name = $("#name").val();
			var id = $("#id").val();
			$.ajax({
					url : "/searchPwd",
					data : {name:name,id:id},
					method: "POST",
					dataType : "json",
					success : function (data) {
							
							if(data==null){
								
								alert("일치하는 회원이 없습니다.");
								opener.location.href="/views/login/login.jsp";
								self.close();
							}else{
								
								$("#close").show();
								$("#close").click(function () {
									 self.close();
								});
								
							}
					
							
					},
					erorr : function () {
						
					}
			
				});
			});
		
	</script>
</body>
</html>