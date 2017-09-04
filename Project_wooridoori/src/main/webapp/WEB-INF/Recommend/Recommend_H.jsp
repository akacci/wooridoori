<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- dialog에 필요함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- my js, css -->
<script src="<%=request.getContextPath()%>/resources/js/recommend/Re_Head.js?t=<%=System.currentTimeMillis()%>" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/js/recommend/recommend.css?t=<%=System.currentTimeMillis()%>">

<title>관광지 추천</title>
</head>
<body>
	<div id="content">
		<div id="filter_controller">
			<div id="" class="aTag_Controller_box" >
				<span class="span_aTag_Controller" name="_1" >지역</span>&nbsp;&nbsp;
				<span class="span_aTag_Controller" name="_2" >테마</span>&nbsp;&nbsp;
				<span class="span_aTag_Controller" name="_3">선호도설문</span>
			</div>
			<div id="area_ul" style="z-index:201;">
			</div>
			<div id="content_ul" style="z-index:201;">
			</div>
		</div>
	</div>
	<div id="View"></div>
	<!-- dialog -->
	<div id="favorite_survey">
		<c:import url="../Recommend/favorite_survey_dialog.jsp"/>
	</div>
</body>
</html>