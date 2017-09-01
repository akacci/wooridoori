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
<link rel="stylesheet" type="text/css"	href='resources/css/loginform.css'>
<link rel="stylesheet"	href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/resources/js/member.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.3/jquery.xdomainrequest.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".w3-bar-item #log").click(function(){
		var log = $(".w3-bar-item #log #logb").attr("class");
		console.log(log);
		create_logform(log);
		$(".log_dialog").css("display","block");
	});
	$(window).click(function(event){
		if(event.target.className == 'log_dialog'){
			$(".log_dialog").css("display","none");
		};
	});
})
	function myFunction(){
		var x = document.getElementById("Demo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
	function goHome(){
		location.href = "wooriMain.wd?wbody_url=wbody.wd";
	}
</script>
<style type="text/css">
a:hover {
	text-decoration: none;
}
.log_dialog {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	
}
/* The Modal (background) */
.logform {
    position: fixed;
    width: 363px;
    height: 529px;
    top: 40%;
    left: 50%;
   	transform: translate(-50%, -50%);
    background-color: #ddd;
}

/* The Close Button */

.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>
</head>
<body>
	<div class="w3-bar w3-colorless" style="position: fixed;top: 0;background-color: #313131">
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
				<a class="bar-item" id="log">
					<c:if test="${sessionScope.LOGIN eq 'NO' or empty sessionScope.LOGIN}"><b id="logb" class="log_in">LOGIN</b></c:if>
					<c:if test="${sessionScope.LOGIN eq 'YES'}"><b id="logb" class="log_out">LOGOUT</b></c:if>
				<img src="resources/image/profile.png" width="35" height="35" style="vertical-align: text-bottom;"></a>
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
	<div class="log_dialog">
		<div class="logform">
		
		
		</div>
		</div>
</body>
</html>