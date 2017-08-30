<%@page import="org.springframework.beans.factory.parsing.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		// selectboxChange();
	});

	function myFunction() {
		var x = document.getElementById("Demo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	function goHome() {
		location.href = "wooriMain.wd?wbody_url=wbody.wd";
	}
</script>
<style type="text/css">
a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="w3-bar w3-colorless">
		<!-- 메뉴바 -->
		<div class="w3-bar-item">
			<a class="bar-item" href="wooriMain.wd?wbody_url=searchlist.wd">Search</a>
		</div>
		<div class="w3-bar-item">
			<a class="bar-item" href="wooriMain.wd?wbody_url=guideList.wd">Guide</a>
		</div>
		<div class="w3-bar-item">
			<a class="bar-item" href="wooriMain.wd?wbody_url=dokyo.wd">Dokyo</a>
		</div>

		<!-- 오른쪽 상단 메뉴 -->
		<div class="w3-dropdown-click" style="float: right">
			<button onclick="myFunction()"
				class="w3-btn w3-colorless w3-xlarge w3-text-white">
				<i class="fa fa-bars"></i>
			</button>
			<div id="Demo"
				class="w3-dropdown-content w3-bar-block w3-border w3-animate-opacity"
				style="right: 0; margin-right: 24px;">
				<a href="#" class="w3-bar-item w3-button">Link1</a> <a href="#"
					class="w3-bar-item w3-button">Link2</a> <a href="#"
					class="w3-bar-item w3-button">Link3</a>
			</div>
		</div>

		<div style="float: right">
			<div class="w3-bar-item">
				<c:if
					test="${sessionScope.LOGIN eq 'NO' or empty sessionScope.LOGIN}">
					<a class="bar-item" data-toggle="modal" data-target="#myModal"
						id="login" href="loginform.wd">login<img
						src="resources/image/profile.png" width="35" height="35"
						style="vertical-align: text-bottom;"></a>
				</c:if>
				<c:if test="${sessionScope.LOGIN eq 'YES'}">
					<a class="bar-item" data-toggle="modal" data-target="#myModal"
						id="logout" href="logoutform.wd">logout<img
						src="resources/image/profile.png" width="35" height="35"
						style="vertical-align: text-bottom;"></a>
				</c:if>
			</div>
			<!-- 홈버튼  -->
			<b style="color: white;">&nbsp;|&nbsp;</b>
			<button onclick="goHome()"
				class="w3-btn w3-colorless w3-xlarge w3-text-white">
				<i class="fa fa-home"></i>
			</button>
		</div>
		<!-- 로그인폼 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog"
				style="width: 380px; margin-top: 130px; margin-bottom: 0px;">
				<div class="modal-content"
					style="margin-left: auto; margin-right: auto;"></div>
			</div>
		</div>

		<div style="float: right"></div>

	</div>
</body>
</html>