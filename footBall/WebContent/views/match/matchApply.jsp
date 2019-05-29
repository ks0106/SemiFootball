<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 동영상CSS  -->
<style>
	
	/* 페이지 메뉴바 css  */
	.tab-container1{
	  margin:0 auto;
      position:absolute;
      text-align:center;
      width:100%;
      height:80px;
   }
   .tab-list{
      margin:0;
      padding0;
      height:100%;
      list-style-type: none;
      border-bottom:1px solid  green;
      padding-left: 0;
   }
   .list-li{
      height: 100%;
      width:33.33%;
      float: left;
      text-align: center;
      line-height: 80px;
      font-size: 40px;
      font-weight: bold;
      border-right: 1px solid  green;
      box-sizing: border-box;
   }
   .list-li:last-child{
      border-right: none;
   }
   .munebar{
      text-decoration: none;
      color : black;
      width:100%;
      height: 100%;
      display: block;
   }
   .selected > .munebar{
      background-color:  green;
    	color:white;
   }
   .list-li>a:hover{
   		background-color:  green;
   		color:white;
   		text-decoration: none;
   }
	.tab-content{
		margin: 0 auto;
		width: 100%;
		text-align: center;
	}
	.content-header{
		color:#403d3f;
		font-size: 60px;
		margin-bottom:20px;
		margin-top: 0px;
	}
	.underline{
		margin:0 auto;
		width:7%;
		text-align:center;
		border-top:2px solid #bfc4cc;
		margin-bottom: 50px;
	}
	#form-cont{
		margin: 0 auto;
		width: 80%;
	}
	#input-table{
		text-align: center;
		width: 80%;
		margin-top: 50px;
		margin: 0 auto;
		border-collapse: collapse;
		border-top: 3px solid green;
		border-bottom: 3px solid green;
	}
	.th{
		width: 25%;
		padding: 20px;
		font-size: 30px;
	}
	.td{
		width: 25%;
		padding: 20px;
		font-size: 30px;
		text-align: left;
	}
	.page_area{
     	width: 100%;
     	height: 170vh;
     }
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<!--헤더 밑 영상  -->
	<div id="continer" style="display:block;">
	<!--영상 위 페이지 타이틀 -->
		<div id="title">
			매치/용병
		</div>
	</div>
	<section class="page_area">
		<!-- 매치페이지 메뉴네비  -->
		<div class="tab-container1">
	            <ul class="tab-list">
	               <li class="selected list-li"><a href="/matching" class="munebar">매칭신청</a></li>
	               <li class="list-li"><a href="/mercenaryRec" class="munebar">용병모집</a></li>
	               <li class="list-li"><a href="/mercenary" class="munebar">용병지원</a></li>
	            </ul>
	            <!-- 탭컨텐츠 제목 -->
	               			<br><br><br>
							<p class="content-header">매칭신청</p>
							<div class="underline"></div>
				<div id="form-cont">
					<form action="/matchApply" method="post">
						<table id="input-table">
							<tr>
								<th class="th">지점</th>
								<td class="td">
									<select name="Bname" style="width: 300px;height:50px;">
										<option value="">지점선택</option>
										<option value="부천점">부천지점</option>
										<option value="고양점">고양지점</option>
										<option value="남양주점">남양주지점</option>
										<option value="성남점">성남지점</option>
										<option value="수원점">수원지점</option>
										<option value="안양점">안양지점</option>
									</select>
								</td>
								<th class="th">구장</th>
								<td class="td">
									<select name="Cname" style="width: 300px;height:50px;">
										<option value="">구장선택</option>
										<option value="A">A구장</option>
										<option value="B">B구장</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="th">신청자</th>
								<td class="td"><input type="text" name="name" style="width: 297px;height: 40px;"></td>
								<th class="th">연락처</th>
								<td class="td"><input type="text" name="phone1" style="width: 90px;height: 40px;">-<input type="text" name="phone2" style="width: 93px;height: 40px;">-<input type="text" name="phone3" style="width: 93px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">매치일정</th>
								<td class="td"><input type="text" name="matchDate" style="width: 297px;height: 40px;"></td>
								<th class="th">시간선택</th>
								<td class="td"><input type="text" name="matchTime" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">유니폼 색상</th>
								<td class="td">
									<input type="text" name="phone1" style="width: 84px;height: 40px;" placeholder="상의">-
									<input type="text" name="phone2" style="width: 84px;height: 40px;" placeholder="하의">-
									<input type="text" name="phone3" style="width: 90px;height: 40px;" placeholder="스타킹">
								</td>
								<th class="th">팀수준</th>
								<td class="td"><input type="text" name="matchLevel" style="width: 297px;height: 40px;"></td>
							</tr>
								<th class="th">매치일정</th>
								<td class="td"><input type="text" name="matchDate" style="width: 297px;height: 40px;"></td>
								<th class="th">시간선택</th>
								<td class="td"><input type="text" name="matchTime" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th" colspan="1">마감여부</th>
								<td class="td" colspan="3"><input type="text" name="matchLevel" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th colspan="4" class="th" >메모</th>
							</tr>
							<tr>
								<td class="th" colspan="4" rowspan="4"><textarea rows="10" cols="60" style="resize: none;text-align: center;"></textarea> </td>
							</tr>
						</table>
						<div id="btn-div" style="margin-top: 30px;"><button class="btn btn-primary btn-lg" type="submit" style="margin-right: 20px;">등록하기</button> <button class="btn btn-primary btn-lg" type="reset">초기화</button></div>
					</form>
				</div>
							
						
					
	              
		</section>
	         <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		
   <script >
   $(document).ready(function(){
	      $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
	      $('#ground2').append('<img src="/img/ground2.png" alt="그라운드2" style="width:100%;height:500px;">');
	      $('#ground3').append('<img src="/img/ground3.png" alt="그라운드3" style="width:100%;height:500px;">');
	      $('#ground4').append('<img src="/img/ground4.png" alt="그라운드4" style="width:100%;height:500px;">');
	      $('#ground5').append('<img src="/img/ground5.png" alt="그라운드5" style="width:100%;height:500px;">');
	   });
   </script>
   
   
</body>
</html>
