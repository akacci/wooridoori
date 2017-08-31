<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- rateit -->
<link rel="stylesheet" type="text/css" href="js/rateit/scripts/rateit.css">

<!-- my js, css -->
<script src="js/recommend/Re_Head.js?t=<%=System.currentTimeMillis()%>" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="js/recommend/recommend.css?t=<%=System.currentTimeMillis()%>">

<title>관광지 추천</title>
</head>
<body>
	<div id="content">
		<div id="filter_controller">
			<div id="" class="aTag_Controller_box">
				<span class="span_aTag_Controller" name="_1" >지역</span>
				//
				<span class="span_aTag_Controller" name="_2" >테마</span>
				//
				<span class="span_aTag_Controller" name="_3">선호도 설문</span>
			</div>
			<div id="area_ul">
			<%-- <ul id = "list_classification" class="filter_item_list_classification">
				<c:forEach var="area" begin="1" end="17" varStatus="a">
				<li class="filter_item" name="${a.count}" val="n">			
					지역${a.count}		
				</li>
				</c:forEach>
			</ul> --%>
			</div>
			<div id="content_ul">
				<%-- <ul id="list_theme" class="filter_item_list_theme">
					<c:forEach var="theme" begin="1" end="10" varStatus="t">
					<li class="filter_item" name="${t.count}" val="n">				
						테마${t.count}
					</li>
					</c:forEach>
				</ul> --%>
			</div>
		</div>
	</div>
	<div id="View"></div>
</body>
</html>