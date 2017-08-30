<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;} 
	table{
		border:1px solid aqua;
	}
	tr,td,th{
		border-bottom: 1px solid aqua;
		border-right: 1px solid aqua;
	}
	a:LINK {
		color: black;
		text-decoration: none;
	}
	a:HOVER {
		color: blue;
		text-decoration: underline;
	}
	#Authentication{
		padding-left: 100px;
		padding-top: 100px;
	}
		.emailForm{
		display: inline;
	}
	#auth{
		color: red;
		font-weight: bold;
		display: inline;
	}
	
	#photo{
		display: inline;
	}
 	#View_area{
		display: inline;
		margin-left:100px;
		overflow: hidden;	
		height: 0px;
		width: 0px;
	}
	
	#userImg{ 
		position: absolute ;
		left: -2000px;
	}
	
	 #canvas{
		display: inline;
	 	max-height:100px;
	 	max-width:100px;
	 	border-radius: 50%;
		border-top-left-radius: 50% 50%;
	  	border-top-right-radius: 50% 50%;
	  	border-bottom-right-radius: 50% 50%;
	  	border-bottom-left-radius: 50% 50%;
	 } 
	.emailForm{
		display: inline;
	}
	#auth{
		color: red;
		font-weight: bold;
		display: inline;
	}

</style>
<script type="text/javascript">
	$(function() {
		
	    $("#photo").on('change', function(){
	        readURL(this);        
	    });
	    
	    /* Image resizing */
/* 	    $('#userImg').load(function(){
	        if( $(this).width()  > $(this).height() ) {
	 		   $(this).height($(this).width());
	    	}else if($(this).width()<$(this).height()){
	           	$(this).width($(this).height());
	    	}            	
	        $(this).css("visibility","visible");
	    }); */
	    
	    /* e-mail selector */
		$("#account").change(function(){
			var email=$("#account").val();
			switch(email){
			case "dir":
				$("#email2").val("");
				$("#email2").focus();
				break;	
			case "naver.com":
				$("#email2").val("naver.com");
				break;	
			case "gmail.com":
				$("#email2").val("gmail.com");
				break;	
			case "daum.net":
				$("#email2").val("daum.net");
				break;	
			case "outlook.com":
				$("#email2").val("outlook.com");
				break;	
			}			
		});
			
	});
	
	/* Image preview  */
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {		//image loaded
	    	var canvas = document.getElementById('canvas');
	        var ctx = canvas.getContext('2d');
	    	$('#userImg').attr('src', "#");	//img initiate
	    	ctx.clearRect(0,0,canvas.width,canvas.height);				//canvas initiate	    	

	    	$('#userImg').attr('src', e.target.result); 
	        var img = new Image();
	        img.src =  e.target.result;
	        /* Image resizing */
	       
	       $('#userImg').load(function(){
	    	   if($('#userImg').width()>1000 && $('#userImg').height()>1000){	/* large size img */
		    	  	 //(img,startX,startY,width,height,drawX,drawY,resultWidth,resultHeight)
		               if($('#userImg').width()>$('#userImg').height()){		/* width longer than heigt */
			    		   ctx.drawImage( img, ($('#userImg').width()/5), $('#userImg').height()/9, ($('#userImg').width()/5)*3, ($('#userImg').height()/9)*7, 0, 0,($('#userImg').width()/5)*3/(1.5), ($('#userImg').height()/9)*7/(1.5));
				        }
			    	   if($('#userImg').width()<$('#userImg').height()){		/* height longer than width  */
			    		   ctx.drawImage( img, ($('#userImg').width()/9), $('#userImg').height()/9, ($('#userImg').width()/9)*7, ($('#userImg').height()/5)*3, 0, 0,($('#userImg').width()/9)*7/(1.5), ($('#userImg').height()/5)*3/(1.5));
				        }
		    	   }
		    	   else {	/* small size img */
		    			ctx.drawImage( img, 0, 0, $('#userImg').width(), $('#userImg').height(), 0, 0,$('#userImg').width(), $('#userImg').height());
			    	   }
	    	});
	        

	     /*    var imgWidth = this.naturalWidth; //이미지 크키가 정해져 있지 않을때
	        
	        var imgWidth2 = $(this).width(); //이미지 크키가 정해져 있을때
	         
	 */
	          /*   $('#userImg').attr('src', e.target.result); */
	        $('#userImg').css("visibility","hidden");
	        }
	      reader.readAsDataURL(input.files[0]);
	      
	    }
	}
	
	/* e-mail auth */
	function emailAuth_open()
	{
		var email=$("#email").val();
		var email2=$("#email2").val();
		if(email==null||email2==null){
			return false;
		}
		var addr=email+"@"+email2
		window.open("emailAuth.wd?email="+addr,"",
				"width=400px,height=200px,left=500px,top=100px"); 
	}
	
</script>
</head>
<body>
<!-- Guide photo save  -->



<div id="Authentication" >
<fieldset style="width: 800px;">
	<legend>Guide Authentication</legend>
	<form action="authentication.wd"
	  method="post" enctype="multipart/form-data"
	  name="f">
	  	 <b style="height: 90px;">Guide Image</b>
	     <input type='file' class="form-control" id="photo"
		     style="width: 300px"	required="required" name="photo"
		      placeholder="Guide photo" />
		<div id="View_area"><img  id='userImg' src="#" ></div>
	 	<canvas id="canvas" width="600" height="600"></canvas>
		<br><br><br>

	 	 <b >Guide E-mail</b>
	 	 <div class="form-inline emailForm">
					<input type="text" name="email" id="email"size="12" class="form-control" style="width:100px;" ><b>@</b>
					<input type="text" name="email2" id="email2"size="11" class="form-control" style="width:130px;" >
					<select id="account" class="form-control">
						<option value="dir">직접입력</option>
						<option value="naver.com">Naver</option>
						<option value="gmail.com">Google</option>
						<option value="daum.net">Daum</option>
						<option value="outlook.com">Microsoft</option>
					</select>
		</div>
	 	<input type="button" class="btn btn-info btn-sm"
	 		 value="E-mail Auth" onclick="emailAuth_open();" >
	 	<fieldset id="auth" name="auth">Must be Authenticate</fieldset>
	 	<br><br>
		<input type="submit"  class="btn btn-success btn-sm" value="Authentication">
	</form>
</fieldset>
</div>

	 

</body>
</html>
