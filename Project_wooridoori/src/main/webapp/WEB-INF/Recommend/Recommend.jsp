<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- my js -->
<script src="<%=request.getContextPath()%>/resources/js/recommend/recommend.js?t=<%=System.currentTimeMillis()%>" type="text/javascript" charset="UTF-8"></script>

<title></title>
</head>
<body style="margin:0px;">
	<header> 
	      <%-- <jsp:include page= "../layout/top.jsp"/> --%>
	      <%@include file="../layout/top.jsp"%>
	</header>
	<div id="re_smenu" style="z-index:2; position: relative;">
		<c:import url="../Recommend/Recommend_H.jsp"></c:import>
	</div>
	<div id="re_body" style="z-index:1;">
		<c:import url="../Recommend/Recommend_Body.jsp"></c:import>
	</div>
	<footer>
	      <jsp:include page= "../layout/wfooter.jsp"/>
	      <%-- <%@include file="../layout/wfooter.jsp"%> --%>
	</footer>
</body>
</html>