<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="/css/common/admin.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>
	<section id="insec">
		<div style="margin:0 auto; width:500px;text-align: center;">
			<form action="/searchKey">
				<select name="type" class="form-control" style="display:inline-block; width:100px; height: 30px; font-size:0.8em;">
					<option value="memberId">아이디</option>
					<option value="memberName">이름</option>
				</select>
				<input type="text" class="form-control" style="display:inline-block; width:200px; height: 30px; font-size:0.8em;"name="keyword">
				<button type="submit" class="btn btn-outline-secondary btn-sm">조회</button>
			</form>
		</div>
		<table class="table table-hover" style="border: 1px solid black; text-align: center; width:80%; margin:0 auto;" >
			<tr>
				<th>ID</th><th>이름</th><th>전화번호</th><th>가입일</th>
			</tr>
			<c:forEach items="${pd.list }" var="m"><!-- 서블릿에서 pd로 넘겨주니까 받아올때 pd로 받아옴 -->
				<tr>
					<td>${m.id }</td>
					<td>${m.name }</td>
					<td>${m.phone }</td>
					<td>${m.enrollDate }</td>
					<td><button onclick="location.href='/memberDelete?memberId=${m.id}'">탈퇴</button>
				</tr>
			</c:forEach>
		</table>
		<div id="pageNavi">${pd.pageNavi }</div>
	</section>
</body>
</html>