$(function(){
	
      $(document).on("click",'.container .logtabs .logtab',function(){
        if ($(this).hasClass('signin')){
          $('.container .logtabs .logtab').removeClass('active');
          $(this).addClass('active');
          $('.cont').hide();
          $('.signin-cont').show();
        }
        if ($(this).hasClass('signup')){
          $('.container .logtabs .logtab').removeClass('active');
          $('#frm-log #m_id').val("");
          $('#frm-log #password').val("");
          $(".message_div").html("");
          $(this).addClass('active');
          $('.cont').hide();
          $('.signup-cont').show();
        }
      });
      $(document).on("click",'.submit-wrap #btnlog',function(){
    	 login();
      });
      $(document).on("keyup",'#frm-log #m_id',function(key){
    	  if(key.keyCode==13){
    		  if($(this).val().length==0){
    			  logfail();
    		  }else{
    			  $('#frm-log #password').focus();
    		  }
    	  }
      })
      $(document).on("keyup",'#frm-log #password',function(key){
    	  if(key.keyCode==13){
    		  if($(this).val().length==0){
    			  logfail();
    		  }else{
    			  login();
    		  }
    	  }
      });
      $(document).on("focusin",'#frm-sign #m_id',function(){
    	  $('#frm-sign #id').css("border-color","#999999");
      });
      $(document).on("focusout",'#frm-sign #m_id',function(){
    	  if($(this).val().length==0){
    			$('#frm-sign #m_id').css("border-color","#d9d9d9");
    	  }else{
    		  console.log(idcheck());
    	  }
      });
      $(document).on("click",'#frm-sign #btnsign',function(){
    	  if($("#frm-sign #m_id").val().length!=0 && $("#frm-sign #password").val().length!=0 && $("#frm-sign #name").val().length!=0 && $("#frm-sign #e_mail").val().length!=0 && $("#frm-sign #tel").val().length!=0){
	    	  if(idcheck()){
	    		  $('#frm-sign').submit();
	    	  }
    	  }else{
    		  alert("모든 정보를 작성해주세요.");
    	  }
      });
      $(document).on("click",'.content-logout #btnlogout',function(){
    	  location.href = "logoutaction.wd";
 	 })
});
function create_logform(log){
	var str = "";
	if(log == 'log_in'){
		$(".logform").css("height","529px");
		var str2 = "<script src='https://www.google.com/recaptcha/api.js'/><div class='g-recaptcha' data-sitekey='6LdNBi0UAAAAAIEPW5MjvEO36V1-wDL-MYoQ9WxS'></div>";
		str = '<section class="container"><article class="half"><h1>WOORI</h1><div class="logtabs"><span class="logtab signin active"><a href="#signin">Log in</a></span><span class="logtab signup"><a href="#signup">Sign up</a></span></div><div class="content"><div class="signin-cont cont"><form id="frm-log" method="post" action="loginaction.wd"><input type="text" name="m_id" id="m_id" class="inpt"	required="required" placeholder="ID"><label for="m_id">Your id</label><input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD"><label for="password">Your password</label><div></div><div class="message_div"></div><div class="submit-wrap"><input type="button" value="Log in" class="submit" id="btnlog"><a href="#" class="forgotpass">Forgot your password?</a></div></form></div><div class="signup-cont cont"><form id="frm-sign" action="signupaction.wd" method="post"><input type="text" name="m_id" id="m_id" class="inpt" required="required" placeholder="ID"> <label for="m_id">id</label><input type="password" name="password" id="password" class="inpt" required="required" placeholder="PASSWORD"><label for="password">password</label><input type="text" name="name" id="name" class="inpt" required="required" placeholder="NAME"><label for="name">name</label><input type="email" name="e_mail"	id="e_mail" class="inpt" required="required" placeholder="EMAIL"><label for="e_mail">email</label><select name="nation" id="nation" class="inpts"></select> <label for="nation">nation</label><input type="text"name="tel" id="tel" class="inpt" required="required"placeholder="PHONE"> <label for="tel">tel</label><div class="submit-wrap"><input type="button" value="Sign up" class="submit" id="btnsign"><a href="#" class="more">Terms and conditions</a></div></form></div></div></article></section>';
	}if(log == 'log_out'){
		$(".logform").css("height","226px");
		str = '<section class="container" style="height: 212px;"><article class="half"><h1>WOORI</h1><h1>로그아웃 하시겠습니까?</h1><div class="content-logout" style="margin-top: 8px;margin-bottom: 8px;"><div class="logout-cont cont"><input type="button" id="btnlogout" value="O K" class="inptB"></div></div></article></section>';
	}
	$(".logform").html(str);
	getOptionData();
	
}
function getOptionData(){
	var list_nation = [];
	$.ajax({
		url : "membernation.wd",
		success: function(data){
			var s_data = JSON.parse(data);
			var option_nation = "";
			for(var i=0;i<s_data.length;i++){
				var selected = "";
				if(s_data[i] == 'South Korea'){
					selected = "selected";
				}
				option_nation += "<option  var='"+s_data[i]+"' "+selected+" >"+s_data[i]+"</option>";
		    }
		    $("#frm-sign #nation").html(option_nation);
		}
	});
}
function login(){
	console.log("dd");
	var frmdata = $("#frm-log").serialize();
	
	 $.ajax({
		url: 'membercheck.wd',
		type: 'post',
		data: frmdata,
		success : function(data){
			if($.trim(data)=="no"){
				$(".message_div").html("<div class='log_message'>아이디 혹은 비밀번호가 맞지 않습니다.</div>");
			}
			if($.trim(data)=="yes"){
				$("#frm-log").submit();
			}
		}
	 });
}
function idcheck(){
	var result = false;
	$.ajax({
		 url: 'idcheck.wd',
		 async: false,
		 data: {id:$("#frm-sign #m_id").val()},
		 success : function(data){
			 if($.trim(data)=='Y'){
				 $('#frm-sign #m_id').css("border-color","red");
				 alert("중복된 아이디입니다.");
				 result = false;
			 }else{
				 $('#frm-sign #m_id').css("border-color","#00ff00");
				 result = true;
			 }
		 }
	  });
	return result;
}