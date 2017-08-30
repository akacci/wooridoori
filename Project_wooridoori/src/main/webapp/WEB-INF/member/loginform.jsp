<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Log in / Sign up</title>
	<link rel="stylesheet" type="text/css" href='resources/css/loginform.css'>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/member.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <style type="text/css"></style>
  </head>
  <body>
    <div class="modal-body">
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
              <input type="text" name="m_id" id="id" class="inpt" required="required" placeholder="ID">
              <label for="email">Your email</label>
              <input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD">
              <label for="password">Your password</label>
              <div><!-- reCAPTCHA_v2 -->
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
              <input type="text" name="id" id="id" class="inpt" required="required" placeholder="ID">
              <label for="id">id</label>
              <input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD">
              <label for="password">password</label>
              <input type="text" name="name" id="name" class="inpt" required="required" placeholder="NAME">
              <label for="name">name</label>
              <input type="email" name="email" id="email" class="inpt" required="required" placeholder="EMAIL">
              <label for="email">email</label>
              <select name="country" id="country" class="inpts">
              	<c:forEach items="${Clist}" var="country"><option value="${country}" <c:if test="${country=='Republic of Korea'}">selected</c:if>>${country}</option></c:forEach>
              </select>
              <label for="country">country</label>
              <input type="text" name="tel" id="tel" class="inpt" required="required" placeholder="PHONE">
              <label for="tel">tel</label>
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
<div></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script type="text/javascript">

    </script>
  </body>
</html>
