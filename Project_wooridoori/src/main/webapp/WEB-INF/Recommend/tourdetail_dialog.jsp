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
		<!-- 평점 먹이는 별 -->
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
		<script src="js/rateit/scripts/jquery.rateit.js?t=<%=System.currentTimeMillis()%>" type="text/javascript" charset="UTF-8"></script>
		<link rel="stylesheet" type="text/css" href="js/rateit/scripts/rateit.css?t=<%=System.currentTimeMillis()%>">
		<!-- Highchart에 필요함  -->
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<!-- js, css -->
		<script charset="utf-8" type="text/javascript" src="js/recommend/tourdetail_dialog.js?t=<%=System.currentTimeMillis()%>"></script>
		<link rel="stylesheet" type="text/css" href="js/recommend/tourdetail_dialog.css?t=<%=System.currentTimeMillis()%>">
		
	</head> 
	<body>
		<div id="dailog">
			<div id="dialog_top_img">
				<%-- <img src="${firstimage}"> --%>
			</div>
			<div id="dialog_content">
				<div id="dialog_preperence">
					좋아요 [그림] &nbsp;&nbsp;&nbsp;&nbsp;
					즐겨찾기 [그림]
				</div>
				<div id="inner_content">
					관광지명 : <span id="span_title"></span>
					<br><br>
					주소 : <span id="span_addr"></span>
					<br><br>
					<div id="total_socre_div">
						
					</div>
				</div>
				<div id="score_chart"></div>
			</div> 
			<div id="dialog_review_write">
				<form action="insertreview.wd" method="post" id="frm_review">
					아이디 : <input type="text" name="m_id" id="m_id"> 
					평점 : <div class="rateit" id="rateit_write"></div><br>
					한줄평 : <input type="text" name="pre_review" id="pre_review">
					<input type="button" id="insert_btn" value="확인">
					<input type="hidden" name="contentid" id="contentid">
					<input type="hidden" name="pre_score" id="pre_score">
					<input type="hidden" name="seq_member" id="seq_member">
				</form> 
				<div id="review_msg">
				</div>
			</div>
			<div id="dialog_review_read">
			</div>
		</div>
	</body>
</html>