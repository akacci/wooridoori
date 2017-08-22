<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var slideIndex=1;
	var imageUrl="";
	var message="정부는 살충제 성분이 검출된 농가에서 생산된 계란의 유통경로를 추적해 살충제계란의 번호를 공개했다";
	var b=false;
	
	function ChangeImage(){
			
		switch(slideIndex)
		{
			case 1:
				imageUrl="url('resources/image/hill.jpg')";
				message="정부는 살충제 성분이 검출된 농가에서 생산된 계란의 유통경로를 추적해 살충제계란의 번호를 공개했다";
				break;
			case 2:
				imageUrl="url('resources/image/dawn.jpg')";
				message="[한경닷컴 IT교육센터만의 특별함] 교육비 무료 , 교재 무료";
				break;
			case 3:
				imageUrl="url('resources/image/tree.jpg')";
				message="[문재인 대통령 취임 100일 기자회견] 민주 “소통하는 대통령”vs 한국당 “자화자찬 쇼통”";
				break;
		}
		$(".bgimg").css("background-image",imageUrl);
		$("#message").text(message);
	}
	
	$(function(){
		imageUrl="url('resources/image/hill.jpg')";
		$(".bgimg").css("background-image",imageUrl);
		$("#message").text(message);
		$("#message_box").hide();
		
		$("#btn_next").click(function(){
			if(slideIndex<3)
				{
					slideIndex++;
				}
			else
				{
					slideIndex=3;
				}
			ChangeImage();
		});
		
		$("#btn_prev").click(function(){
			if(slideIndex>1)
				{
					slideIndex--;
				}
			else
				{
					slideIndex=1;
				}
			ChangeImage();
		});
		
		$("#btn_next").mouseenter(function(){
			$("#message_box").fadeIn();
			b=true;
		});
		
		$("#btn_prev").mouseenter(function(){
			$("#message_box").fadeIn();
			b=true;
		});
		
		$("#message_box").mouseenter(function(){
			if(b)
			{
				$("#message_box").show();
			}
		}).mouseleave(function(){
			$("#message_box").hide();
			b=false;
		});
	});
</script>

<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
    min-height: 100%;
    background-position: center;
    background-size: cover;
    animation: opac 0.8s;
}
.bgimg2 {
	min-height: 100%;
    background-position: center;
    background-size: cover;
    animation: opac 0.8s;
    background-color: olive;
}

</style>
</head>
<body>
<!-- Home화면 에서만 배경화면을 출력하기 위해 클래스명을 value값으로 변수a를 선언함.  -->
<c:if test="${wbody_url eq '/wbody.wd'}">
	<c:set var="a" value="bgimg"></c:set>
</c:if>

<c:if test="${wbody_url != '/wbody.wd'}">
	<c:set var="a" value="bgimg2"></c:set>
</c:if>

<div class="${a} w3-display-container w3-text-white">
  <div class="w3-display-middle" style="width: 100%; height:83%;">
    <h1 class="w3-medium w3-animate-top">
	<c:import url="${wbody_url}"></c:import>
	</h1>
	
    <!-- <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center">35 days left</p> -->
    
  </div>
  
  <div class="w3-display-topleft w3-padding-large w3-large" style="width: 100%;">
	<c:import url="/wtopmenu.wd"></c:import>
  </div>
  

  
  <div class="w3-display-bottomleft w3-padding-large">
	빅-수잔보이
  </div>
  
  <div id="message_box" class="absolute_box w3-container w3-black2" style="white-space: pre-line; word-break:break-all;">
  <p id="message"></p>
  
  </div>
  
	<button class="absolute_btn" style="background-color: rgba(0,0,0,0.5); color: #fff; border:0; outline:0; cursor: pointer"
	id="btn_prev"><</button>
	<button class="absolute_btn" style="background-color: rgba(0,0,0,0.5); color: #fff; border:0; outline:0; cursor: pointer;
	margin-left: 41px" id="btn_next">></button>
</div>

<div style="width: 100%; height: 10%; bottom: 0">
<c:import url="/wfooter.wd"></c:import>
</div>

</body>