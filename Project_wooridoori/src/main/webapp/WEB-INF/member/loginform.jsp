<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Log in / Sign up</title>
	<link rel="stylesheet" type="text/css" href='resources/css/loginform.css'>
    <style rel="stylesheet"></style>
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
            <form id="frm-log" action="loginaction.wd" method="post">
              <input type="text" name="id" id="id" class="inpt" required="required" placeholder="ID">
              <label for="email">Your email</label>
              <input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD">
              <label for="password">Your password</label>
              <input type="checkbox" id="remember" class="checkbox" checked>
              <label for="remember">Remember me</label>
              <div class="submit-wrap">
                <input type="button" value="Log in" class="submit" id="login">
                <a href="#" class="more">Forgot your password?</a>
              </div>
            </form>
          </div>
          <div class="signup-cont cont">
            <form action="#" method="post">
              <input type="text" name="id" id="id" class="inpt" required="required" placeholder="ID">
              <label for="id">id</label>
              <input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD">
              <label for="password">password</label>
              <input type="text" name="name" id="name" class="inpt" required="required" placeholder="NAME">
              <label for="name">name</label>
              <input type="email" name="email" id="email" class="inpt" required="required" placeholder="EMAIL" style="width : 76.5%;float:left;margin-right:10px;">
              <label for="email">email</label>
              <input type="button" value="SEND CODE" class="inptb">
              <input type="text" name="ecode" id="ecode" class="inpt" required="required" placeholder="CODE" style="width : 76.5%;float:left;margin-right:10px;">
              <input type="button" value="CHECK" class="inptb">
              <label for="ecode">ecode</label>
              <input type="country" name="country" id="country" class="inpt" required="required" placeholder="COUNTRY">
              <label for="country">country</label>
              <input type="tel" name="tel" id="tel" class="inpt" required="required" placeholder="PHONE">
              <label for="tel">tel</label>
              <div class="submit-wrap">
                 <input type="submit" value="Sign up" class="submit"> 
                <a href="#" class="more">Terms and conditions</a>
              </div>
            </form>
          </div>
        </div>
      </article>
    </section>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
    <script type="text/javascript">
      $('.tabs .tab').click(function(){
        if ($(this).hasClass('signin')) {
          $('.tabs .tab').removeClass('active');
          $('body .container').css('height','515px');
          $('body .container .content form').css('height','390px');
          $(this).addClass('active');
          $('.cont').hide();
          $('.signin-cont').show();
        }
        if ($(this).hasClass('signup')) {
          $('.tabs .tab').removeClass('active');
          $('body .container').css('height','570px');
          $('body .container .content form').css('height','440px');
          $(this).addClass('active');
          $('.cont').hide();
          $('.signup-cont').show();
        }
      });
      $('#login').click(function(){
    	 var id = $("#frm-log #id").val();
    	 var password = $("#frm-log #password").val();
    	 $.ajax({
    		url: 'membercheck.wd',
    		data:{id:id,password:password},
    		success : function(data){
    			
    		}
    	 });
      });
    </script>
  </body>
</html>
