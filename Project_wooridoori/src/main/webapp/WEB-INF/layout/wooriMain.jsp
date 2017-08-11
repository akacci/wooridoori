<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<c:url value="css/main.css"/>'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
    background-image: url('resources/image/다리.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>

</head>
<body>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
<div>
메뉴
</div>
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
	<c:import url="/wtopmenu.wd"></c:import>
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top">
	<c:import url="/wbody.wd"></c:import>
	</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p c564+4lass="w3-large w3-center">35 days left</p>
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
	ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
<a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a>
  </div>

<div style="width: 100%; height: 10%; bottom: 0">
<c:import url="/wfooter.wd"></c:import>
</div>

</body>

