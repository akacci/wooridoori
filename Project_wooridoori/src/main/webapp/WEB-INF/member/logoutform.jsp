<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Log out</title>
	<link rel="stylesheet" type="text/css" href='resources/css/loginform.css'>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/member.js"></script>
    <style type="text/css"></style>
  </head>
  <body>
    <div class="modal-body">
    <section class="container" style="height: 212px;">
      <article class="half">
        <h1>WOORI</h1>
        <h1>로그아웃 하시겠습니까?</h1>
        <div class="content-logout" style="margin-top: 8px;margin-bottom: 8px;">
	        <div class="logout-cont cont">
	          <input type="button" id="btnlogout" value="O K" class="inptB">
	        </div>
        </div>
      </article>
    </section>
</div>
<div></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script type="text/javascript">
    </script>
  </body>
</html>
