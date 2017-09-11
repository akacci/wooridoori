<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<!-- dialog에 필요함 -->
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<!-- 내 js,css -->
		<script charset="utf-8" type="text/javascript" src="<%=request.getContextPath()%>/resources/js/recommend/favorite_survey_dialog.js?t=<%=System.currentTimeMillis()%>"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/js/recommend/favorite_survey_dialog.css?t=<%=System.currentTimeMillis()%>">
	</head> 
	<body>
		<div id="survey">
			<input type="hidden" id="login_val">
			<input type="hidden" id="login_id">
			<br>
			<div>
				<span>Q1. 연령대를 선택하세요.</span><br>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="chk_age" value="10">10대&nbsp;&nbsp;
				<input type="radio" name="chk_age" value="20">20대&nbsp;&nbsp;
				<input type="radio" name="chk_age" value="30">30대&nbsp;&nbsp;
				<input type="radio" name="chk_age" value="40">40대&nbsp;&nbsp;
				<input type="radio" name="chk_age" value="50">50대&nbsp;&nbsp;
				<input type="radio" name="chk_age" value="0">그 이상
			</div>
			<br>
			<div>
				<span>Q2. 한국에 오신 목적을 선택하세요.</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="sel_purpose" class="form-control">
				</select>
			</div>
			<br>
			<div>
				<span>Q3. 선호하는 지역을 선택하세요.</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="sel_area" class="form-control">
				</select>
			</div>
			<br>
			<div>
				<span>Q4. 인원수는 몇명이신가요?</span><br>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="chk_cnt" value="1">1명&nbsp;&nbsp;
				<input type="radio" name="chk_cnt" value="2">2명&nbsp;&nbsp;
				<input type="radio" name="chk_cnt" value="3">3명&nbsp;&nbsp;
				<input type="radio" name="chk_cnt" value="0">그 이상
			</div>
			<br>
			<div>
				<span>Q5. 원하는 숙박 시설을 선택하세요.</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="sel_stay" class="form-control">
				</select>
			</div>
		</div>
	</body>
</html>