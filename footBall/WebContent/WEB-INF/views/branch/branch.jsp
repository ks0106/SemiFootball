<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 동영상CSS  -->
<link rel='stylesheet' href="css/common/pageCss.css">
	<style>
		.tab-container {
			position: absolute;
			top: 485px;
			width: 100%;
			height: 100px;
		}
		
		.tab-list {
			margin: 0; padding0;
			height: 100%;
			list-style-type: none;
			border-bottom: 1px solid black;
			padding-left: 0;
		}
		
		.list-li {
			height: 100%;
			width: 50%;
			float: left;
			text-align: center;
			line-height: 100px;
			font-size: 40px;
			font-weight: bold;
			border-right: 1px solid black;
			box-sizing: border-box;
		}
		
		.navi_match_li:last-child {
			border-right: none;
		}
		
		.munebar {
			text-decoration: none;
			color: black;
		}
		
		.selected {
			background-color: lightgray;
		}
	</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점현황</title>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!--헤더 밑 영상  -->
	<div id="continer">
		<div id="mv">
			<video id="video01" class="pblock" autoplay playsinline muted loop
				title> <source src="/img/page3.mp4" type="video/mp4"></video>
		</div>
		<!--영상 위 페이지 타이틀 -->
		<div id="title">지점현황</div>
	</div>
	<section class="page_area">
	<div class="tab-container">
		<ul class="tab-list">
			<li class="selected list-li"><a href="#T-con01" class="munebar">F&Q</a></li>
			<li class="list-li"><a href="#T-con02" class="munebar">공지사항</a></li>
		</ul>
		<div class="tab-content-wrapper">
			<div id="T-con01" class="tab-con">ddddd</div>
			<div id="T-con02" class="tab-con">ffff</div>
		</div>
	</div>
	</section>
	<script>
	  $(".tab-container").each(function  () {
	      var $cmTabList = $(this).children(".tab-list");
	      var $cmTabListli = $cmTabList.find("li");
	      var $cmConWrapper = $(this).children(".tab-content-wrapper");
	      var $cmContent = $cmConWrapper.children(".tab-con");
	      
	      
	      // 탭 영역 숨기고 selected 클래스가 있는 영역만 보이게
	      var $selectCon = $cmTabList.find("li.selected").find("a").attr("href");
	      $cmContent.hide();
	      $($selectCon).show();

	      $cmTabListli.children("a").click(function  () {
	         if ( !$(this).parent().hasClass("selected")) {
	            var visibleCon = $(this).attr("href");
	            $cmTabListli.removeClass("selected");
	            $(this).parent("li").addClass("selected");
	            $cmContent.hide();
	            $(visibleCon).fadeIn();
	         }
	         return false;
	      });
	   });
	</script>
</body>
</html>