<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<html>
	<head>
		<meta charset="utf-8">
<c:set var="root" value="<%=request.getContextPath() %>"  />
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<!-- dialog에 필요함 -->
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <!-- rate  -->
<script src="${root }/gjunge-rateit.js-937fff8/scripts/jquery.rateit.js" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="${root }/gjunge-rateit.js-937fff8/scripts/rateit.css">

		<script type="text/javascript">
			$(document).ready(function(){
				$("#dialog_jsp").dialog({
				  	autoOpen: false,
				  	modal: true,
				  	resizable: false,
				  	width: 900,
				  	height: 550,
				  	open: function(){
				  		$("#gr_day").val($("#datepicker").val());
				  		
	                    $(".ui-widget-overlay").off("click");
	                    
	                    $(".ui-widget-overlay").on("click", function(){
	                       $("#dialog_jsp").dialog("close");
	                    });
	                 },
				  	buttons:{
				  		"예약 확인":function(){
				  			insertGuideReservation();
				  		}
				  	}
				}); 
				
				$("#reserveBtn").click(function(){
			  		if("${sessionScope.id}"==""){			  			
			  			alert("회원만 예약이 가능합니다.");
			  		}
			  		else if($("#datepicker").val()==""){
			  			alert("예약 날짜를 선택하세요.");
			  		}
			  		else{
			  			$("#dialog_jsp").dialog("open");
			  			var i=1;
						setTimeout(initMap(i),100);
			  		}
				});
				
			//	loginUserData();
			});
		
			//로그인한 유저 정보 select
/* 			function loginUserData(){
				$.ajax({
					url: "selectloginuserdata.wd",
					type: "post",
					success: function(resData){
						var data = JSON.parse(resData.toLowerCase());

						$("#gr_name").val(data.name);
						$("#gr_tel").val(data.tel);
						$("#seq_member").val(data.num);
						$("#m_id").val(data.num);
					}
				});
			} */
			
			//insert
			function insertGuideReservation(){
				var data = $("#frm_reservation").serialize();
				$.ajax({
					url: "insertguidereservation.wd",
					type: "post",
					data: data,
					success: function(){
						$("#dialog_jsp").dialog("close");
					}
				});
				
			}
		</script>
		<style type="text/css">
			.ui-dialog {
				top: 0;
				left: 0;
				padding: 0 0 0 0;
				margin: 0 0 0 0;
				outline: 0;
			}
		   
		   .ui-dialog .ui-dialog-titlebar {
				display:none;
				top: 0;
				padding: 0 0 0 0;
				margin: 0 0 0 0;
				/*position: relative;
				background-color: red; */
			}
			
			b#msg{
				font-size: 18px;
				font-weight: bold;
			}
			
			span.basic-font{
				font-size: 14px;
				font-weight: bold;
			}
			
			div#gr_component{
				position: relative;
				top: 0px;
				width:100%;
				height: 100%;
			}
			
			#gr_component #reservation_content{
				top: 0px;
				float: left;
				width: 400px;
			}
			
			#gr_component #reservation_location{
				top: 0px;
				float: left;
				width: 400px;
				margin-left: 30px;
			}
			
			#reservation_location #map2{
				margin: 0 auto;
				padding: 0 auto;
				height: 300px;
				width: 350px;
			}
			
			#reservation_location span.basic-font{
				margin: 0 auto;
				padding: 0 auto;
			}
			
		</style>
	</head> 
	<body >
		<br>
		<b id="msg">예약 정보를 확인해 주세요!!</b>
		<br><br>
		<form id="frm_reservation" action="insertguidereservation.wd" method="post">
			<div id="gr_component">
				<div id="reservation_content">
					<span class="basic-font">여행 테마</span><br>
					<input type="text" class="form-control" id="gr_thema" name="gr_thema" readonly="readonly" value="${param.gr_thema}"><br>
					<span class="basic-font">예약자 성함</span><br>
					<input type="text" class="form-control" id="gr_name" name="gr_name" readonly="readonly" value="${param.gr_name }"><br>
					<span class="basic-font">예약자 전화번호</span><br>
					<input type="text" class="form-control" id="gr_tel" name="gr_tel" readonly="readonly" value="${param.gr_tel }"><br>
					<span class="basic-font">가격</span><br>
					<fmt:formatNumber var="gr_price" value="${param.gr_price}" pattern="#,###원" />
					<input type="text" class="form-control" id="gr_price" name="gr_price" readonly="readonly" value="${gr_price}"><br>
					<span class="basic-font">기간</span><br>
					<input type="text" class="form-control" id="gr_day" name="gr_day" readonly="readonly" value=""><br>
				</div>
				<div id="reservation_location">
					<span class="basic-font">만나는 장소 및 시간</span><br>
					<div id="map2" ></div>
					<span class="basic-font">장소 : ${param.gr_addr}</span><br>
					<span class="basic-font">시간 : ${param.gr_meet_time}</span><br>
					<input type="hidden" id="seq_guide" name="seq_guide" value="${param.seq_guide}">
					<input type="hidden" id="gr_meet_addr" name="gr_meet_addr" value="${param.gr_addr}">
					<input type="hidden" id="gr_meet_time" name="gr_meet_time" value="${param.gr_meet_time}">
					<input type="hidden" id="m_id" name="m_id" value="${param.gr_id}">
					<input type="hidden" id="gr_addr" name="gr_addr" value="${param.gr_category_addr}">
			
				</div>
			</div>
		</form>
	</body>


</html>