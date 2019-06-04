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
        	text-align: center;
        	
        	}
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
        	
        </form>
        
         <form >
        	<table id="pwd" style="visibility: hidden;" >
        		<tr>
        			<td colspan="2" style="text-align: center;"><h2>비밀번호 변경</h2></td>
        		</tr>
        		<tr>
        			<td style="text-align: right;" colspan="3"><span id="extext1"></span></td>
        		</tr>
        		<tr>
        			<td style="float: right;">비밀번호:</td><td colspan="2"><input type="password" name="repwd" id="repwd"></td>
        		</tr>
        		<tr>
        			<td style="text-align: right;" colspan="3"><span id="extext2"></span></td>
        		</tr>
        		<tr>
        			<td style="float: right;">비밀번호 재입력 :</td><td colspan="2"><input type="password" name="repwd1" id="repwd1"></td>
        		</tr>
        		<tr>
        			<td colspan="3">
        			<input type="reset" value="취소">
        			<input type="button" value="확인" id="pwdsub">
        			<input type="button" value="닫기" id="close">
        			</td>
        		</tr>
        	</table>
        	
        	
        	
        </form>
		</center>
	<script type="text/javascript">
		
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
								$("#pwd").css("visibility","visible ");
							}
					
							
					},
					erorr : function () {
						
					}
			
				});
			});
		
	</script>
	<script type="text/javascript">
		$("#close").hide();
		$("#pwdsub").click(function () {
			var repwd = $("#repwd").val();
			var repwd1 = $("#repwd1").val();
		});
	</script>
	<script type="text/javascript">
		var result = [false,false];
		$(document).ready(function () {
			$("#repwd").blur(function () {
				var pwd = $("#repwd").val();
				var text = /^[a-z][a-z0-9]{5,17}$/i;
				if(pwd==''){
					$('#extext1').html('');
				}else{
					if(!text.test(pwd)){
						$("#extext1").html('영어 대/소문자+숫자 6~18자리');
						$("#extext1").css('color','red');
						$("#extext1").css('font-size','15px');
						
						return false;
					}else{
						$('#extext1').html('');
						result[1]='true';
						return true;
					};
					
				};
			});
			
			$('#repwd1').blur(function () {
				var pwd = $('#repwd').val();
				var pwd1 = $('#repwd1').val();
				if(pwd1==''){
					$('#extext2').html('');
				}else{					
					if(!(pwd==pwd1)){
						$('#extext2').html('비밀번호가 일치하지 않습니다.');
						$('#extext2').css('color','red');
						$('#extext2').css('font-size','15px');
						return false;
					}else{
						$('#extext2').html('');
						result[2]='true';
						return true;
					};				
				}
			});
			$('#pwdsub').click(function(event){
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
</body>
</html>