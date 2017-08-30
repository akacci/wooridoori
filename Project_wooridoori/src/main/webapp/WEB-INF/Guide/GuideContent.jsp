<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;} 
	#title{
		margin-left: 100px;
		margin-bottom: 30px;
		margin-top: 30px;
		font-size: 23pt;
		font-weight: bold;
	}
	#content, #content_body, hr{
		margin-left: 100px;
		margin-bottom: 30px;
		margin-top: 30px;
	}
 	#top{
		margin-left: 100px;
    	margin-top: 50px;
		background-repeat: no-repeat;
		width: 1200px;
		max-height: 200px;
		overflow: hidden;
		background-size: cover;
		background-position: center;
	} 
	#topImg{
    	margin-top: 50px;
    	width: 1200px;
	}
	
	.top_info img{
		max-height: 50px;
	}
	.top_info{
		height: 60px;
		margin-left: 80px;
		display: inline;
	}
	.top_info2{
		color: gray;
	}
	.top_info3{
		font-size: 12pt;
	}
	#guide{
		max-height:55px;
	 	border-radius: 50%;
		border-top-left-radius: 50% 50%;
	  	border-top-right-radius: 50% 50%;
	  	border-bottom-right-radius: 50% 50%;
	  	border-bottom-left-radius: 50% 50%; 
	  }
	#page{
		margin-top: -300px;
	}
</style>
</head>
<script type="text/javascript">
	$(function(){
		//title img
		
		
		
	});
	
	
</script>

<c:set var="root" value="<%=request.getContextPath() %>"  />
<body>
<%-- 	<!-- top -->
	<div id="top" >
		 <img src="save/GuidePreview/${gdto.gb_preview_imgpath }" id="topImg"> 
	</div>
	
	<!-- title -->
	<div id="title">
		${gdto.gb_title }
	</div>
	<hr width="1200px;">
	<!-- content -->
	<div id="content">
		<div class="top_info">
			<img src="${root }/Guide_img/theme.png">
			<b class="top_info2">여행 테마</b>
			<b class="top_info3">${gdto.gb_theme }</b>
		</div>
		<div class="top_info">
			<img src="${root }/Guide_img/meet_time.png">
			<b class="top_info2">만나는 시간</b>
			<b class="top_info3">${gdto.gb_meet_time }</b>
		</div>
		<div class="top_info">
			<img src="${root }/Guide_img/time_.png">
			<b class="top_info2">소요 시간</b>
			<b class="top_info3">${gdto.gb_time }</b>
		</div>
		<div class="top_info">
			<img src="${root }/Guide_img/lang.png">
			<b class="top_info2">언어</b>
			<b class="top_info3">${gdto.gb_language }</b>
		</div>
	</div>
	<hr width="1200px;">	
	
	<!-- content body -->
	<div id="content_body">
		<span>
			<img src="save/GuideFace/${gdto.imagepath}" id="guide"  >
			<a href="" id="name" >${gdto.gb_name }</a>						
		</span><br>	<br>
		<span>
			<b class="top_info2">여행 소개</b> <br>	<br>
			${gdto.gb_content }	
		</span>
	</div>
	
	<div id="hash">
		${gdto.gb_keyword}
	</div>
	
	<div id="location">
		${gdto.gb_address}
	</div>
	
	<div id="meetNgreet">
		${gdto.gb_address_name}
	</div>
	
	
	<div id="price">
		${gdto.gb_price}
	</div>
	
	
	<div id="score">
		${gdto.gb_score}
	</div>
	
	<div id="service">
		${gdto.gb_service}
		${gdto.gb_service}
	</div>
	 --%>
	<!-- reply -->
	<div id="page">
		<c:import url="https://www.myrealtrip.com/offers/2007"/>
	</div>
</body>
</html>
