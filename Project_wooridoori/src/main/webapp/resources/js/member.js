$(function(){
      $('.tabs .tab').click(function(){
        if ($(this).hasClass('signin')){
          $('.tabs .tab').removeClass('active');
          $(this).addClass('active');
          $('.cont').hide();
          $('.signin-cont').show();
        }
        if ($(this).hasClass('signup')){
          $('.tabs .tab').removeClass('active');
          $('')
          $(this).addClass('active');
          $('.cont').hide();
          $('.signup-cont').show();
        }
      });
      $('#btnlog').click(function(){
    	 login();
      });
      $('#frm-log #id').keyup(function(key){
    	  if(key.keyCode==13){
    		  if($(this).val().length==0){
    			  logfail();
    			  
    		  }else{
    			  $('#frm-log #password').focus();
    		  }
    	  }
      })
      $('#frm-log #password').keyup(function(key){
    	  if(key.keyCode==13){
    		  if($(this).val().length==0){
    			  logfail();
    		  }else{
    			  login();
    		  }
    	  }
      });
      $('#frm-sign #id').focusin(function(){
    	  $('#frm-sign #id').css("border-color","#999999");
      });
      $('#frm-sign #id').focusout(function(){
    	  if($(this).val().length==0){
    			$('#frm-sign #id').css("border-color","#d9d9d9");
    	  }else{
    		  console.log(idcheck());
    	  }
      });
      $('#frm-sign #btnsign').click(function(){
    	  if(idcheck()){
    		  $('#frm-sign').submit();
    	  }
      });
      $(".content-logout #btnlogout").click(function(){
 		 location.href = "logoutaction.wd";
 	 })
});
function login(){
	var frmdata = $("#frm-log").serialize();
	 $.ajax({
		url: 'membercheck.wd',
		type: 'post',
		data: frmdata,
		success : function(data){
			if($.trim(data)=="no"){
				logfail();
				$("").html("아이디 혹은 비밀번호가 맞지 않습니다.");
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
		 data: {id:$("#frm-sign #id").val()},
		 success : function(data){
			 if($.trim(data)=='Y'){
				 $('#frm-sign #id').css("border-color","red");
				 alert("중복된 아이디입니다.");
				 result = false;
			 }else{
				 $('#frm-sign #id').css("border-color","#00ff00");
				 result = true;
			 }
		 }
	  });
	return result;
}
function logfail(message){
	$("#frm-log #id").css("border-color","red");
	$("#frm-log #password").css("border-color","red");
	$("#frm-log #id").animate({
		borderColor: "#d9d9d9"		
	},"slow");
	$("#frm-log #password").animate({
		borderColor: "#d9d9d9"
	},"slow");
}