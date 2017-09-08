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
<c:set var="root" value="<%=request.getContextPath() %>"  />
<!-- 
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>  -->
<!-- Dialog -->

 <!-- 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!--  Google API 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script> -->
<!-- 1.preview pic  2.div to pic -->
<script src="${root }/dist/jquery.cropit.js"></script>
<script src="${root }/dist/html2canvas.js"></script>
<style>
      .cropit-image-preview {
        background-color: #f8f8f8;
        background-size: cover;
        border: 1px solid #ccc;
        border-radius: 3px;
        margin-top: 7px;
        width: 250px;
        height: 250px;
        cursor: move;
      }

      .cropit-image-background {
        opacity: .2;
        cursor: auto;
      } 

      .image-size-label {
        margin-top: 10px;
      }

      input {
        display: block;
      }

      button[type="submit"] {
        margin-top: 10px;
      }

/*       #result {
        margin-top: 10px;
        width: 900px;
      }

      #result-data {
        display: block;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        word-wrap: break-word;
      } */
      canvas{
		display: inline;
	 	max-height:110px;
	 	max-width:110px;
	 	border-radius: 50%;
		border-top-left-radius: 50% 50%;
	  	border-top-right-radius: 50% 50%;
	  	border-bottom-right-radius: 50% 50%;
	  	border-bottom-left-radius: 50% 50%;
	  }
	  .cropit-image-zoom-input{
	  	max-width: 300px;
		}
		#Authentication{
			padding-left: 50px;
			padding-top: 50px;
		}
		.real-image, .cropit-image-input, canvas, #save{
			display: inline;
		}
		.real-image{
			margin-left: 20px;
		}
		.image-editor{
			border:1px solid #eeeeee; 
			padding: 20px;
        	height: 350px;
		}
		.email-block{
			border:1px solid #eeeeee; 
			padding: 20px 20px 0px 20px;
		}
		#auth{
			color: red;
			font-weight: bold;
			display: inline;
		}
	  #info{
	  	font-size: 9pt;
	  	color: orange;
	  }
	  #undetect{
	  	font-size: 11pt;
	  	color: red;
	  }
	  #facePic{
		background-color: #AFD9E0;
		width: 250px;
		height:35px;
		cursor: pointer;
		padding-left: 60px;
		padding-top: 5px;
	}
	 .faceImg{
		margin-bottom: -10px;
		padding-bottom: -10px;
		height: 25px;
	}
	.faceTxt{
		display: inline;
	}
	.faceImg{
		display: inline;
	}
    </style>
    <script type="text/javascript">
    var isSaved;
      $(function() {
    	$(".fileup").hide();
    	$("#first_step").hide();
    	$("#use").hide();
        $('.image-editor').cropit();
		$(".cropit-image-input").click(function(){
	    	$("#use").hide();			
		});
		
		//Auth comment
/*  		if($("#title").attr("comm")!=""){
			alert($("#title").attr("comm"));
		} 
		 */
		 /* Face rcog fail */
 		 $( "#dialog-confirm" ).dialog({
 		      resizable: false,
 		      height: "auto",
 		      width: 400,
 		      autoOpen: false,
 		      modal: true,
 		      buttons: {
 		        "문의하기": function() {
 		          $( this ).dialog( "close" );
 		        },
 		        Cancel: function() {
 		          $( this ).dialog( "close" );
 		        }
 		      }
 		    }); 
 		 /* Face-auth fail */
		if($("#title").attr("comm")!=""){		
				$('#dialog-confirm').dialog('open');		
		    	 
		}
 		 /* Picture is not available */
		 $( "#dialog-picErr" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: "auto",
		      autoOpen: false,
		      modal: true,
		      buttons: {
		        "확인": function() {
		          $( this ).dialog( "close" );
		        }
		      }
		    }); 
  		/* Not exist picture */
 		 $( "#dialog-picUpErr" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: "auto",
		      autoOpen: false,
		      modal: true,
		      buttons: {
		        "확인": function() {
		          $( this ).dialog( "close" );
		        }
		      }
		    });
		
		/*  Upload guide face image */
 		$("#facePic").click(function(){
 			$(".fileup").click();		 			
 		});
		$(".faceImg").click(function(e) { e.preventDefault(); });
		
		
/*         $('form').submit(function() {
          // Move cropped image data to hidden input
          var imageData = $('.image-editor').cropit('export');
          $('.hidden-image-data').val(imageData);

          // Print HTTP request params
          var formValue = $(this).serialize();
          $('#result-data').text(formValue);

          // Prevent the form from actually submitting
          return false;
        }); */
      
		 var myImage;
/* 	        $('.image-editor').cropit({
	          exportZoom: 1.25,
	          imageBackground: false,
	          imageBackgroundBorderWidth: 20,
	          imageState: {
	            src: '#',
	          },
	        }); */
	        
	     
/* 	        $('.export').click(function() {
	          var imageData = $('.image-editor').cropit('export');
	          window.open(imageData);
	 
	        }); */
	        
	        /* Image preview  */
	        /* Convert div to image using js library */
	        $("#preview").click(function(){	        	
	        	$("canvas").remove();
	        	var ext=$(".cropit-image-input").val().split(".").pop().toLowerCase();
	            if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		           	 $("#dialog-picErr").dialog("open");
		           	 return;
	                 }
	            else{
		        	html2canvas(document.getElementById('target'), {
		        		  onrendered: function(canvas) {
		        		    document.getElementById('real-image').appendChild(canvas);
		        		    myImage= canvas.toDataURL();
		    				$("canvas").trigger("create");
		     				$("#use").show();
		        		  }
		        		});
	        	}
	        });
	        /* cannvas send to controller and detect face*/ 
	        $("#use").click(function(){
	        	$.ajax({
	        		url:'GuideInfoUpload.wd?id='+$("#title").attr("getid"),
	        		data:{strImg:myImage},
	        		type:'POST',
	        		success:function(data){	
	        			if(data=="false"){		// Undetected Face
	        				$("#info").empty();
	        				var str="<br><b id='undetect'> [Retry!! Undetected your face]</b>";
	        				$("#info").append(str);
	        				isSaved=false;
	        				 $("#use").hide();
	        			}else{
	        				isSaved=true;
	        			}
	        		}
	        	});
	        });
        
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
        
        /* Authenticated first step proc() */  
        
        /* Already e-mail Auth checked */
/*          $("#first_step").click(function(){
             if(isSaved==false ){
             	 alert("You should upload picture first");
             	 return false;
             } 
         });   */     
 		
        
      });
      	
	 /* e-mail auth */
	function emailAuth_open()
		{
		 if(isSaved==true){
			var email=$("#email").val();
			var email2=$("#email2").val();
			if(email==null||email2==null){
				return false;
			}
			var addr=email+"@"+email2
			window.open("emailAuth.wd?email="+addr,"",
					"width=400px,height=200px,left=500px,top=100px"); 
		 }
		 else{
			 $( "#dialog-picUpErr" ).dialog("open");
		 }
		}
		  
    /* Authenticated first step proc() */        /* Just called children window */
    function first_step(){
 		  $("#first_step").show();
 	   
    }
      
    </script>
  </head>
  <body>
   	<header>
		<%@ include file= "../layout/top.jsp" %>
	</header>  
  <div id="dialog-confirm" title="관리자에게 문의하세요.">
 		 <p>
 		 	<span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>
 		 	${comment }
 		 </p>
  </div>
 <div id="dialog-picErr" title="Picture is not support">
 		 <p>
 		 	<span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>
 		 	Just [gif,png,jpg,jpeg] are available.
 		 </p>
  </div>
   <div id="dialog-picUpErr" title="Picture is not exist">
 		 <p>
 		 	<span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>
 		 	Picture upload first.
 		 </p>
  </div>
  
<div id="Authentication" >
    <form action="authentication.wd"
	  method="post" enctype="multipart/form-data"
	  name="f">
    <fieldset style="width: 800px;">
	<legend id="title" getid="${sessionScope.id}" comm="${comment }">Guide Authentication of ${sessionScope.name}</legend> 
	    <div class="image-editor">
	      <div class="col-sm-4">
	      <b>Guide Picture </b>
		      <input type="file" class="cropit-image-input fileup"  >
		      <div id="facePic">
	   			 <input type="image" src="${root }/Guide_img/camera-icon.png" class="faceImg">
	   			  <b class="faceTxt" style="display: inline;"> My Picture</b>
	   		   </div>
		      
		      <div class="cropit-image-preview"  id="target"></div>
	      </div>
	      <div class="col-sm-6" style="padding-left: 40px;">
		      <div class="image-size-label">       Resize image      </div>
		      <input type="range" class="cropit-image-zoom-input">
		      <input type="button" id="preview" value="preview" class="btn btn-info btn-sm">
		      <input type="hidden" name="image-data" class="hidden-image-data" />
		      <input type="button" id="use" value="use" class="btn btn-warning btn-sm"><br>
		      <b id="info"> [Your face is must locate in the middle of picture]</b><br>
		      <div id="detected"></div>
		  		<div class="real-image "  id="real-image"></div>
	      </div><br>
	   </div>
	   <br>
	    
	    <div class="email-block" style="display: block;">
		     <b >Guide E-mail</b><br>
		 	 <div class="form-inline emailForm" style="display: block;">
						<input type="text" name="email" id="email"size="12" class="form-control" style="width:100px;" value="${sessionScope.email1 }" ><b>@</b>
						<input type="text" name="email2" id="email2"size="11" class="form-control" style="width:130px;" value="${sessionScope.email2 }" >
						<select id="account" class="form-control">
							<option value="dir">Select</option>
							<option value="naver.com">Naver</option>
							<option value="gmail.com">Google</option>
							<option value="daum.net">Daum</option>
							<option value="outlook.com">Microsoft</option>
						</select>
			
		 	<input type="button" class="btn btn-info btn-sm"
		 		 value="E-mail Auth" onclick="emailAuth_open();" >
		 	<fieldset id="auth" name="auth" value="">Must be Authenticate</fieldset>
		 	</div>
		 	<br>
		 	<input type="submit"  class="btn btn-success btn-sm" value="Authentication" id="first_step">
		 	<br><br>
		 	</div>
    </fieldset>
    </form>
<%-- 
    <div id="result">
      <code>$form.serialize() =</code>
      <code id="result-data"></code>
    </div> --%>
</div>




  </body>
</html>
