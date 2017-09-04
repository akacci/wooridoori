<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="<%=request.getContextPath() %>" />

<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
	<header>
		<%@ include file="./wtopmenu.jsp"%>
	</header>
	<div>
		<span class="w3-jumbo w3-ab" style="margin-left: 5%; margin-top: 5%;">Search</span>
		<div id="list_div"
			style="border: 1px solid red; width: 800px; margin-left: auto; margin-right: auto; padding: 15px;">
			<a href="detail.wd?contentid=126508">경복궁</a>
		</div>
	</div>
	<footer>
		<%@ include file="./wfooter.jsp"%>
	</footer>
</body>
</html>