<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"  />
<!-- tabs  -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script><!-- 
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Smart Board -->
<%-- <script src="${root }/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="${root }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script>
 --%>

<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCd4AIIG7caN6x_v-qyPXoSwfg7EuDqbds&callback=initMap" async defer></script>
<!-- 1.preview pic  2.div to pic -->
<script src="${root }/dist/jquery.cropit.js"></script>
<script src="${root }/dist/html2canvas.js"></script>

<style type="text/css">
	#cl-dashboard{display: none;} 
/* 	table{
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
	} */
	body #wirteForm{
		padding-left: 100px;
		padding-top: 100px;
	}
	#info{
		color: blue;
	}
	#frontPic{
		background-color: #AFD9E0;
		width: 200px;
		height:35px;
		cursor: pointer;
		padding-left: 30px;
		padding-top: 5px;
	}
	.frontImg{
		margin-bottom: -10px;
		padding-bottom: -10px;
		height: 25px;
	}
	#reserve_time_ran{
	}
	/* Upload preview */
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
	.frontImg{
		display: inline;
	}
	.check{
		display:inline;
	}
/* 	#target, #target2, #target3, #target4, #target5{
		display: inline;
	} */
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".fileup").hide();
        $('.image-editor').cropit();
		//Address to Map
		var lat=37.484283;
		var lng=126.929583;
		var address="신림역";
		$("#addChk").click(function(){
			 address = $("#address").val();
			var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyCd4AIIG7caN6x_v-qyPXoSwfg7EuDqbds";
			$.ajax({
				url : url ,
				dataType : "json" ,
				type : "post" ,
				success : function(data) {
					// 결과 받아서 처리할 내용
					 lat = data.results[0].geometry.location.lat;
					 lng = data.results[0].geometry.location.lng;
					$("#lat").val(lat);
					$("#lon").val(lng);
					$("#map").css("display", "block"); 
					initMap(lat, lng , address);
				} ,
				error : function (xh, code, msg) {
					alert("주소양식이 적절하지 않습니다.");
				}
			});
		});	
		/* consume_time translate to gb_time */
		$(".consume_time2").change(function(){
			var target=$(".consume_time").val();
			if(target.indexOf(" ")>-1){
				$(".consume_time").val(target.substring(0,target.indexOf(" "))+" "+$(this).val());
			}
			else{
				$(".consume_time").val(target+" "+$(this).val());
			}
		});
		
		/*  Upload guide front image */
		$("#frontPic").click(function(){
			$(".fileup").click();		
		});

		//http://openapi.nsdi.go.kr/서비스제공 restful URI.xml?&authkey=인증키[&요청변수=값] 
		//var Curl="http://openapi.nsdi.go.kr/nsdi/eios/service/rest?&authkey=a230ca22c40176414f4d13&admCodeNm=서울특별시";
		

		/* City select */
		var Curl="http://openapi.nsdi.go.kr/nsdi/eios/service/rest/AdmService/admCodeList.xml?&authkey=8be59419a5070ca1495620";
		$.ajax({
			url:Curl,
			type:"GET",
			dataType:"XML",
			success:function(data){
 				$(data).find("admVOList").each(function(){
 					if($(this).children("lowestAdmCodeNm").text()!="")
					$(".city").append("<option value='"+$(this).children("admCode").text()+"'>"+$(this).children("lowestAdmCodeNm").text()+"</option>");							
 					$("#gb_category_addr").val($(this).children("lowestAdmCodeNm").text());
 				});
			}
		});
		
		/* Village select */
		$(".city").change(function(){
			var Vurl="http://openapi.nsdi.go.kr/nsdi/eios/service/rest/AdmService/admSiList.xml?&authkey=a230ca22c40176414f4d13&admCode="+$(this).val();
			// Get vity text
			$("#gb_category_addr").val();
			$.ajax({
				url:Vurl,
				type:"GET",
				dataType:"XML",
				success:function(data){
 					$(".village").children("option").remove();
	 				$(data).find("admVOList").each(function(){ 					
	 					if($(this).children("lowestAdmCodeNm").text()!="")
							$(".village").append("<option value='"+$(this).children("admCodeNm").text()+"'>"+$(this).children("lowestAdmCodeNm").text()+"</option>");							
	 					});
	 			}
			});			
		});
		
		
		/* Using tabs */
		  $( "#tabs" ).tabs({
		      collapsible: true
		    });
		
		/* Meeting time select make */
		for(var i=1;i<=24;i++){
			if(i==12 || i==24){
				if(i==12)
					$(".meeting_time").append("<option value='pm"+i+"'>pm "+i+"</option>");
				if(i==24)
					$(".meeting_time").append("<option value='am"+i/2+"'>am "+i/2+"</option>");
			}
			else{
				if(i<13){
					$(".meeting_time").append("<option value='am"+i+"'>am "+i+"</option>");
				}if(i>12){
					$(".meeting_time").append("<option value='pm"+(i-12)+"'>pm "+(i-12)+"</option>");
				}if(i%7==0){
					$(".meeting_time2").append("<option value='"+i/7*15+"'>"+i/7*15+"</option>");
				}
			}
		}
		
		
		/* Get Category Addr */
		$(".village").change(function(){
			$("#gb_category_addr").val($(this).val());
		});
		/* Get theme */
		$(".theme").change(function(){
			$("#gb_theme").val($(this).val());
		});
		
		/* Get meeting time */			
		$(".meeting_time2").change(function(){
			$("#gb_meet_time").val($(".meeting_time").val()+":"+$(this).val());
		});
		
		$("#sbtn").click(function(){
			/* Get language */
			var lang=""; 
			$("input[name=check]:checked").each(function(idx) {
				if($('input[name="check"]:checked').length==idx){//+1
					lang+= $(this).val();
					//alert($('input[name="check"]:checked').length);
				}
				else{
					lang+= $(this).val()+", ";
				 	$("#gb_language").val(lang);
				}
			});
			/* Get service */
			var serv=""; 
			$("input[name=check2]:checked").each(function(idx) {
				if($('input[name="check2"]:checked').length==idx){
					serv+= $(this).val();
				}
				else{
					serv+= $(this).val()+" ";
				  $("#gb_service").val(serv);
				}
			});
			/* Send to form */
			$("#frm").submit();
		});
		
	
		
		
	});	
	
	/* Draw map */
	function initMap(lat, lng, address) {
	    // 목표 위치
		var myLatLng = {lat: parseFloat(lat), lng: parseFloat(lng)};
		var markerTitle = address;
	   	// 지도 정보
	    var map = new google.maps.Map(document.getElementById('map'), {
	      center: myLatLng,
	      scrollwheel: false,
	      zoom: 16
	    });
		// 마커 정보
	    var marker = new google.maps.Marker({
	      map: map,
	      position: myLatLng,
	      title: address
	    });
		

/* 	    map.addListener('center_changed', function() {
	      // 3 seconds after the center of the map has changed, pan back to the
	      // marker.
	      window.setTimeout(function() {
	        map.panTo(marker.getPosition());
	      }, 3000);
	    });

	    marker.addListener('click', function() {
	      map.setZoom(8);
	      map.setCenter(marker.getPosition());
	    }); */
	}

</script>
</head>

<body> 
   	<header>
		<%@ include file= "../layout/top.jsp" %>
	</header>   
	<form action="GuideWriteAction.wd"
	  method="post" enctype="multipart/form-data"
	   id="frm">
	   
<div id="wirteForm" >
<fieldset style="width: 900px;">
	<legend>Guide 등록</legend>
	<input type="hidden" value="${addr}">
	<div id="tabs">
	
		  <ul>
		    <li><a href="#tabs-1">가이드 투어 상세정보</a></li>
		    <li><a href="#tabs-2">가이드 투어 기타정보 </a></li>
		    <li><a href="#tabs-3">가이드 투어 게시정보</a></li>
		  </ul>
		  
		  <input type="hidden" name="gb_name" value="${sessionScope.name}" id="gb_name">
		  <input type="hidden" name="gb_state" value="0" >

		  <div id="tabs-1">
		   	<span>
				여행 제목  *<br>
				<input type="text" class="form-control"
			 			  style="width: 800px;" required="required"
			 			  name="gb_title" placeholder="Title">	
			 	
			 	<b id="info">-여행 주제를 정확하고 간결하게 표현해주세요. <br>
			 	   -지역명이 포함된 제목은 상품 노출에 더 효과적입니다. (ex:서울,경리단길 투어/강남 도심투어)
			 	</b>	
			</span>	 	 	
			 <br><br>
		
			<span>
				여행 소개  *
			 	<textarea class="form-control"	 			 
					 style="width:100%; height:300px; "
					 name="gb_content" id="content"></textarea>	
				<br><br> 	
			</span>
			
			<span>
				도시/지역 *<br>
				<div class="col-xs-4">
				<select class="form-control city" >
					<option value="">시/도</option>
				</select>
				</div>
				<div class="col-xs-4">
				<select class="form-control village">
					<option value="">구/군</option>
				</select>
				</div>
				<input type="hidden" name="gb_category_addr" id="gb_category_addr">
			</span>	
			<br><br><br> 
				
			<span id="consumeTime">
				총 소요시간 *<br>
				<div class="col-xs-4" > 
					<input type="text" class="form-control consume_time" name="gb_time" placeholder="0">
				</div>
				<div class="col-xs-4">
					<select class="form-control consume_time2" >
						<option value="">선택하세요</option>
						<option value="시간">시간</option>
						<option value="일">일</option>
					</select>
				</div>
			</span>
			<br><br><br>
	   </div>	
	   
	<!-- page distribute  -->
	 
  	<div id="tabs-2">
	  	<span>만나는 장소 위치 *<br></span>
		<span>
			<div class="col-sm-9 " >
			<input type="text" 	class="form-control inputdefault" name="gb_address" id="address">
			</div>
			<div class="col-sm-2">
				<input type="button" class="btn btn-default" value="검색" id="addChk">
			</div>
			<div  class="col-sm-12" id="map" style="height:400px; display:none; ">
			</div>	
			<input type="hidden" name="gb_lat" 	id="lat">
			<input type="hidden" name="gb_lon" 	id="lon"><!--hidden  --> 
		</span>
		<br><br><br>
		
		<span>
			만나는 장소 이름*<br>
			&nbsp; &nbsp; <input type="text" class="form-control"
		 		  style="width: 700px; display: inline;" required="required"
		 		  name="gb_address_name" placeholder="Meet">	
		</span>
		<br><br>
		 
		<span>
			만나는 시간*<br>
			<div class="col-sm-4">
				<select class="form-control meeting_time">
					<option value="">시간 선택</option>
				</select>
			</div>
			<div class="col-sm-4">
				<select class="form-control meeting_time2" >
					<option value="00">00</option>
				</select>	
			</div>
			<input type="hidden" name="gb_meet_time" value="" id="gb_meet_time">
		</span>
		<br><br><br>
		
		<span>
			사용 언어 *<br>
				&nbsp; &nbsp; 
				<input type="checkbox" value="한국어" class="check" name="check">한국어  &nbsp;&nbsp;
				<input type="checkbox" value="영어" class="check" name="check">영어  &nbsp;&nbsp;
				<input type="checkbox" value="중국어" class="check" name="check">중국어  &nbsp;&nbsp;
				<input type="checkbox" value="일본어" class="check" name="check">일본어  &nbsp;&nbsp;
				<input type="checkbox" value="프랑스어" class="check" name="check">프랑스어  &nbsp;&nbsp;
				<input type="checkbox" value="스페인어" class="check" name="check">스페인어  &nbsp;&nbsp;
				<input type="checkbox" value="독일어" class="check" name="check">독일어  &nbsp;&nbsp;
				<input type="checkbox" value="" class="check" name="check">그 외
				
				<input type="hidden" name="gb_language" value="" id="gb_language">
		</span>
		<br><br><br>
		
		<span>
			가이드 서비스<br>
			&nbsp; &nbsp; 
			<input type="checkbox" value="숙소픽업" class="check" name="check2">숙소픽업  &nbsp;&nbsp;
			<input type="checkbox" value="공항/터미널픽업 " class="check" name="check2">공항/터미널픽업  &nbsp;&nbsp;
			<input type="checkbox" value="통역" class="check" name="check2">통역  &nbsp;&nbsp;
			<input type="checkbox" value="차량제공" class="check" name="check2">차량제공
			<input type="checkbox" value="보모동반" class="check" name="check2">보모동반
			<input type="hidden" name="gb_service" value="" id="gb_service">
		</span>
		<br><br><br>
			
		<span>
			가격 * <br>
		   		&nbsp; &nbsp; <input type="text" class="form-control"
			  style="width: 700px; display: inline;" required="required"
			  name="gb_price" placeholder="(￦)">
		   <b id="info"><br>
		   &nbsp; &nbsp; -여행 주제와 관련된 내용을 등록하세요. <br>
		 	   &nbsp; &nbsp; -첫 사진이 대표사진으로 등록됩니다.<br>
		 	  <br>
		   <br><br>
		</span>

	
	</div>
	
	<!-- page distribute  -->

	 <div id="tabs-3">
	 	<span>
			Hash Tag *<br>
			<input type="text" class="form-control"
			  style="width: 800px;" required="required"
			  name="gb_keyword" placeholder="#Hash Tag">	
			<b id="info">-여행 주제와 관련된 내용을 등록하세요. <br>
		 	   -지역명,투어내용이 포함된 태그는 상품 노출에 더 효과적입니다.<br>
		 	   -태그명 앞에 '#'을 붙여주세요. (ex:#이태원/#경리단길/#맛집투어)<br><br>
		 	</b>	
		</span>
		<br><br>
		
		 <span>
			여행 테마 *<br>
				<select class="form-control theme" style="width: 800px;">
					<option value="">선택하세요.</option>
					<option value="문화재">문화재</option>
					<option value="체험(예술)">체험(예술)</option>
					<option value="체험(레져)">체험(레져)</option>
					<option value="식도락">식도락</option>
					<option value="자연">자연</option>
				</select>	 		
				<input type="hidden" name="gb_theme"  id="gb_theme">
		</span>
		<br><br>
		
		<span>
		    <div class="image-editor">
				여행 대표 사진 * <br>
			   <input type="file" class="cropit-image-input fileup" id="fileup" name="fileup" multiple="multiple"><br>
			   <div id="frontPic">
			   		<input type="image" src="${root }/Guide_img/camera-icon.png" class="frontImg">&nbsp; <b>대표 사진 등록</b>
			   </div>
			   <b id="info">-여행 주제와 관련된 내용을 등록하세요. <br>
			 	   -첫 사진이 상세보기 배경으로 등록됩니다.<br>
			 	   -최소 가로400pixel 이상의 사진파일을 사용하세요.<br>
			 	 </b>
			 	 <b id="info"> [Your preview images are must locate in the middle of the area]</b><br>
			 	<div class="cropit-image-preview"  id="target" style="width: 400px;"></div>		
		 	</div>
		   <br><br> 
		</span>	
		
	</div>
  
</div>



		
	
	<!-- page distribute  -->
	 	<input type="button" id="sbtn" value="가이드 등록하기"	 class="btn btn-info btn-sm"  style="width: 130px;">
	 	<input type="button" value="중간저장" class="btn btn-info btn-sm"  style="width: 130px;"
	 			  onclick="location.href='list.wd'">
	 	<input type="button" value="미리보기"	 class="btn btn-info btn-sm"  style="width: 130px;"
	 			  onclick="location.href='list.wd'">
 	 <br><br><br>
	</form>
	
<%-- 
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'"'+' style="max-width:400px;">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

} 
</script>
--%>
<%-- 	<footer>
	      <jsp:include page= "../layout/wfooter.jsp"/>
	      <%@include file="../layout/wfooter.jsp"%>
	</footer> --%>

</body>
<%-- 	 
   <footer class="container-fluid text-center">
      <%@ include file= "../layout/wfooter.jsp" %>
   </footer>    --%>

</html>
