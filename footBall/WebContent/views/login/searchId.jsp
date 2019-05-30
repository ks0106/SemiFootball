<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        	padding-top: 75px;
        
	</style>
<body>
		<center>
        <form >
        	<table>
        		<tr>
        			<td style="float: right;">이름 :</td><td><input type="text" name="name"></td>
        		</tr>
        		<tr>
        			<td>아이디 찾기 힌트 :</td>
        			<td>
        				<select name="pwdHint">
		           			<option>선택하세요</option>
		           			<option value="가장 좋아하는 색상">가장 좋아하는 색상</option>
		           			<option value="가장 좋아하는 연예인">가장 좋아하는 연예인</option>
		           			<option value="내가 나온 초등학교 이름">내가 나온 초등학교 이름</option>
	           			</select>
        			</td>
        		</tr>
        		<tr>
        			<td>아이디 찾기 정답 :</td>
        			<td>
        				<input type="text" name="pwdHintAnswer">
        			</td>
        		</tr>
        	</table>
        	<input type="reset" value="취소">
        	<input type="button" value="확인">
        </form>
		</center>
</body>
</html>