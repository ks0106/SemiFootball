<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	footer{
		position:relative;
		width:100%;
		height:300px;
		margin:0;
		padding:0;
	}
	.footer_area{
		position:absolute;
		bottom:0;
		width:100%;
		height:200px;
		margin:0;
		padding:0;
		background-color: rgb(50,50,50);
	}
	.footer_nav{
		display:inline-block;
		margin-right:20px;
		margin-top:60px;
	}
	.footer_nav a{
		color:white;
		text-decoration:none;
		font-size:13px;
	}
</style>
<footer>
	<div class="footer_area">
		<div style="width:350px;padding:0;margin-top:35px;margin-left:300px;float:left;">
			<a href="/"><img src="/img/footer_logo.png" width="350" style="opacity:0.2;padding:0;margin:0;"></a>
		</div>
		<div style="height:100%;width:500px;margin-left:100px;float:left;">
			<ul style="padding:0;margin:0 auto;list-style-type:none;">
				<li class="footer_nav"><a href="#">개인정보처리방침</a></li>
				<li class="footer_nav" style="color:gray;font-size:13px">|</li>
				<li class="footer_nav"><a href="#">이용약관</a></li>
				<li class="footer_nav" style="color:gray;font-size:13px">|</li>
				<li class="footer_nav"><a href="#">이메일무단수집거부</a></li>
			</ul>
		</div>
		<div style="height:100%;width:500px;margin-left:500px;background-color:red;">
		</div>
	</div>
</footer>
