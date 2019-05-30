<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.util.Locale"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Calendar tDay = Calendar.getInstance();
	int y = tDay.get(Calendar.YEAR);
	int m = tDay.get(Calendar.MONTH);
	int d = tDay.get(Calendar.DATE);
	Calendar dSet = Calendar.getInstance();
	dSet.set(y, m, 1);
	int yo = dSet.get(Calendar.DAY_OF_WEEK);
	int last_day = tDay.getActualMaximum(Calendar.DATE);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function() {
		console.log(<%=d%>);
		var index = <%=d%>;
		for(int i=0;i<index;i++){
			
		}
		$('#prev_month').click(function() {
			alert("이전달");
			<%=m = m - 1%>
			console.log(<%=m%>);
		});
		$('#next_month').click(function() {
			alert("다음달");
			<%=m = m + 1%>
			console.log(<%=m%>);
		});
		$('td').click(function(){
			$(this).addClass('select-cell');
			$(this).parents('tr').siblings().children('td').removeClass('select-cell');
			$(this).siblings('td').removeClass('select-cell');			
		});
	});
</script>
<style>
	.select-cell{
		background-color:#2c3c57;
		color:white;
		font-weight:bold;
	}
</style>
<body>
	<!-- 기존 코드 -->
	<table width="600px;" height="550px"
		style="background-color: rgb(235, 235, 235); padding: 0; border: 1px solid silver;">
		<tr>
			<td align="center" colspan="7">
				<div id="cal_title"
					style="width: 345px; height: 40px; margin: 0 auto; margin-bottom: 15px;">
					<!-- 이전달 -->
					<div id="prev_month"
						style="width: 40px; height: 40px; cursor: pointer; display: inline-block; margin: 0 auto;">
						<img src="/img/prev_gray.png" width="40px" height="40px">
					</div>
					<!-- 이번달 -->
					<div id="this_month"
						style="font-size: 40px; display: inline-block; margin: 0 auto; margin-right: 60px; margin-left: 60px;"><%=y%>.
						<%=(m + 1)%></div>
					<!-- 다음달 -->
					<div id="next_month"
						style="width: 40px; height: 40px; cursor: pointer; display: inline-block; margin: 0 auto;">
						<img src="/img/next_gray.png" width="40px" height="40px">
					</div>
				</div>
			</td>
		</tr>
		<!-- 요일 -->
		<tr style="text-align: center;">
			<%
				String[] a = { "일", "월", "화", "수", "목", "금", "토" };
				for (int i = 0; i < 7; i++) {
			%>
			<td width="35"><%=a[i]%></td>
			<%
				}
			%>
		</tr>
		<!-- 첫번째 주 -->
		<tr style="text-align: center;">
			<%
				for (int k = 1; k < yo; k++) {
			%>
			<td style="border: 1px solid gray;"></td>
			<%
				}
			%>
			<%
				for (int j = 1; j <= last_day; j++) {
			%>
			<td style="border: 1px solid gray;cursor: pointer;"><%=j%> <%
 	if ((yo + j - 1) % 7 == 0) {
 %>
			</td>
		</tr>
		<!-- 두번째~마지막 주 -->
		<tr style="border: 1px solid gray; text-align: center;">
			<%
				}
				}
				for (int e = 1; e < (7 - yo - 1); e++) {
			%>
			<td style="border: 1px solid gray;"></td>
			<%
				}
			%>
		</tr>
	</table>


</body>
</html>