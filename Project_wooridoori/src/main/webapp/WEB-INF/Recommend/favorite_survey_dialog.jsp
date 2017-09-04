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
			<div>
				<span>Q1. ㅁㄴㄻㄴㅇㄻㄴㄻㄴㅁㄴㅇㄻㄴㅁ?</span><br>
				<input type="radio" name="chk_info" value="HTML">HTML
				<input type="radio" name="chk_info" value="CSS">CSS
				<input type="radio" name="chk_info" value="웹디자인">웹디자인
			</div>
			<div>
				<span>Q2. ㅁㄴㄻㄴㅇㄻㄴㄻㄴㅁㄴㅇㄻㄴㅁ?</span><br>
				<input type="radio" name="chk_info" value="HTML">HTML
				<input type="radio" name="chk_info" value="CSS">CSS
				<input type="radio" name="chk_info" value="웹디자인">웹디자인
			</div>
			<div>
				<span>Q3. ㅁㄴㄻㄴㅇㄻㄴㄻㄴㅁㄴㅇㄻㄴㅁ?</span><br>
				<input type="radio" name="chk_info" value="HTML">HTML
				<input type="radio" name="chk_info" value="CSS">CSS
				<input type="radio" name="chk_info" value="웹디자인">웹디자인
			</div>
			<div>
				<span>Q4. ㅁㄴㄻㄴㅇㄻㄴㄻㄴㅁㄴㅇㄻㄴㅁ?</span><br>
				<input type="radio" name="chk_info" value="HTML">HTML
				<input type="radio" name="chk_info" value="CSS">CSS
				<input type="radio" name="chk_info" value="웹디자인">웹디자인
			</div>
			<div>
				<span>Q5. ㅁㄴㄻㄴㅇㄻㄴㄻㄴㅁㄴㅇㄻㄴㅁ?</span><br>
			</div>
		</div>
	</body>
</html>