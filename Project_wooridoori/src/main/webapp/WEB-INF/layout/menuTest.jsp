<%@ page import="org.springframework.beans.factory.parsing.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
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
	<div class="w3-bar w3-colorless" style="position: fixed;top: 0;background-color: gray">
		<!-- 메뉴바 -->
		<div class="w3-bar-item">
			<a class="bar-item" href="searchlist.wd">Search</a>
		</div>
		<div class="w3-bar-item">
			<a class="bar-item" href="wooriMain.wd?wbody_url=guideList.wd">Guide</a>
		</div>
		<div class="w3-bar-item">
			<a class="bar-item" href="dokyo.wd">test</a>
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
				<a href="#" class="w3-bar-item w3-button">Link1</a>
				<a href="#" class="w3-bar-item w3-button">Link2</a>
				<a href="#"	class="w3-bar-item w3-button">Link3</a>
			</div>
		</div>

		<div style="float: right">
			<div class="w3-bar-item">
				<c:if test="${sessionScope.LOGIN eq 'NO' or empty sessionScope.LOGIN}">
					<a class="bar-item" data-toggle="modal" data-target="#myModal" id="login" href="loginform.wd">login<img src="resources/image/profile.png" width="35" height="35" style="vertical-align: text-bottom;"></a>
				</c:if>
				<c:if test="${sessionScope.LOGIN eq 'YES'}">
					<a class="bar-item" data-toggle="modal" data-target="#myModal" id="logout" href="logoutform.wd">logout<img src="resources/image/profile.png" width="35" height="35" style="vertical-align: text-bottom;"></a>
				</c:if>
			</div>
			<!-- 홈버튼  -->
			<b style="color: white;">&nbsp;|&nbsp;</b>
			<button onclick="goHome()"
				class="w3-btn w3-colorless w3-xlarge w3-text-white">
				<i class="fa fa-home"></i>
			</button>
		</div>
	</div>
	<!-- 로그인폼 -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width: 380px; margin-top: 130px; margin-bottom: 0px;">
			<div class="modal-content" style="margin-left: auto; margin-right: auto;">
			<section class="container">
			<article class="half">
				<h1>WOORI</h1>
				<div class="tabs">
					<span class="tab signin active"><a href="#signin">Log in</a></span>
					<span class="tab signup"><a href="#signup">Sign up</a></span>
				</div>
				<div class="content">
					<div class="signin-cont cont">
						<form id="frm-log" method="post" action="loginaction.wd">
							<input type="text" name="m_id" id="id" class="inpt"	required="required" placeholder="ID">
							<label for="email">Your email</label>
							<input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD">
							<label for="password">Your password</label>
							<div>
								<!-- reCAPTCHA_v2 -->
								<!--               	<script src='https://www.google.com/recaptcha/api.js'></script> -->
								<!--               	<div class="g-recaptcha" data-sitekey="6LdNBi0UAAAAAIEPW5MjvEO36V1-wDL-MYoQ9WxS"></div> -->
							</div>
							<div class="submit-wrap">
								<input type="button" value="Log in" class="submit" id="btnlog">
								<a href="#" class="forgotpass">Forgot your password?</a>
							</div>
						</form>
					</div>
					<div class="signup-cont cont">
						<form id="frm-sign" action="signupaction.wd" method="post">
							<input type="text" name="m_id" id="m_id" class="inpt" required="required" placeholder="ID"> <label for="id">id</label>
							<input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD">
							<label for="password">password</label>
							<input type="text" name="name" id="name" class="inpt" required="required" placeholder="NAME">
							<label for="name">name</label>
							<input type="email" name="e_mail"	id="e_mail" class="inpt" required="required" placeholder="EMAIL">
							<label for="e_mail">email</label>
							<select name="nation" id="nation" class="inpts">
							</select> <label for="nation">nation</label>
							<input type="text"
								name="tel" id="tel" class="inpt" required="required"
								placeholder="PHONE"> <label for="tel">tel</label>
							<div class="submit-wrap">
								<input type="button" value="Sign up" class="submit" id="btnsign">
								<a href="#" class="more">Terms and conditions</a>
							</div>
						</form>
					</div>
				</div>
			</article>
		</section>
		</div>
		</div>
	</div>	
</body>
</html>