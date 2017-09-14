<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- dialog에 필요함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- my js, css -->
<script src="<%=request.getContextPath()%>/resources/js/recommend/Re_Body.js?t=<%=System.currentTimeMillis()%>" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/js/recommend/recommend.css?t=<%=System.currentTimeMillis()%>">

<!-- icon -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/bootstrap.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/font-awesome.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/ionicons.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/AdminLTE.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/_all-skins.min.css?t=<%=System.currentTimeMillis()%>">

<title>관광지 추천</title>
</head>
<body>
	<div id="success_message"></div>
	<div id="recommend_main">
		<input type="hidden" id="login_val">
		<div id="area">
			<div class="slider">
				<a href="#none" class="slide_left"><img src="<%=request.getContextPath()%>/resources/image/Recommend/left.png"></a>
				<div id="slider_body">
					<span class="category">지역</span>
					<c:forEach begin="1" end="20" varStatus="i">
						<div id="slide_div">
							<div class="select_box_div">
								<input type="hidden" value="${i.index}" id="cnt">
								<input type="hidden" class="contentid" id="contentid">
								<div class="select_tourbox">
									<img class="select_img" onError="this.src='/Project_wooridoori/resources/image/Recommend/no_image.png'">
								</div>
								<div class="div_hover_box">				
									<div class="select_blockA">
										<span class="first_trip_click" value="n" inx="${i.count}">
											<!-- <img class="check_img" src="resources/image/Recommend/Check-icon.png"> -->
											<span class = "glyphicon glyphicon-check" style="right:20px; top:20px; font-size: 2em; color: black;"></span>
										</span>
									</div>
									<div class="select_blockB">
										<ul class="select_box_ul">
											<li class="select_box_li"><span class="tour_title">관광지명</span></li>
											<li class="rateit_box">
												<div class="rateit bigstars" id="rateit_false" inx="${i.count}"></div>
											</li>
											<li>
												<div class="_ccimg" value="n" inx="${i.count}">
													좋아요
													<img class="ccimg" src="resources/image/Recommend/cc_img_1.png">													
												</div>						
												<div class="_jcimg" value="n" inx="${i.count}">
													즐겨찾기												
													<img class="jcimg" src="resources/image/Recommend/jc_img_1.png">													
												</div>												
											</li>				
										</ul>
									</div>								 
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<a href="#none" class="slide_right"><img src="<%=request.getContextPath()%>/resources/image/Recommend/right.png"></a>
			</div>
		</div>
		<div id="thema">
			<div class="slider">
				<a href="#none" class="slide_left"><img src="<%=request.getContextPath()%>/resources/image/Recommend/left.png"></a>
				<div id="slider_body">
					<span class="category">테마</span>
					<c:forEach begin="1" end="20" varStatus="i">
						<div id="slide_div">
							<div class="select_box_div">
								<input type="hidden" value="${i.index}" id="cnt">
								<input type="hidden" class="contentid" id="contentid">
								<div class="select_tourbox">
									<img class="select_img" onError="this.src='/Project_wooridoori/resources/image/Recommend/no_image.png'">
								</div>
								<div class="div_hover_box">				
									<div class="select_blockA">
										<span class="first_trip_click" name="first_trip" value="n" inx="${i.count}">
											<span class = "glyphicon glyphicon-check" style="right:20px; top:20px; font-size: 2em; color: black;"></span>
										</span>
									</div>
									<div class="select_blockB">
										<ul class="select_box_ul">
											<li><span class="tour_title">관광지명</span></li>
											<li class="rateit_box">
												<div class="rateit bigstars" id="rateit_false" inx="${i.count}"></div>
											</li>
											<li>							
												<div class="_ccimg" value="n" inx="${i.count}">
													좋아요
													<img class="ccimg" src="resources/image/Recommend/cc_img_1.png">													
												</div>						
												<div class="_jcimg" value="n" inx="${i.count}">
													즐겨찾기												
													<img class="jcimg" src="resources/image/Recommend/jc_img_1.png">													
												</div>
											</li>				
										</ul>
									</div>								 
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<a href="#none" class="slide_right"><img src="<%=request.getContextPath()%>/resources/image/Recommend/right.png"></a>
			</div>
		</div>
		<div id="non_favorite">
			<div class="slider">
				<a href="#none" class="slide_left"><img src="<%=request.getContextPath()%>/resources/image/Recommend/left.png"></a>
				<div id="slider_body">
					<span class="category">추천하고 싶은 곳</span>
					<c:forEach begin="1" end="20" varStatus="i">
						<div id="slide_div">
							<div class="select_box_div">																
								<input type="hidden" class="contentid" id="contentid">
								<div class="select_tourbox">
									<img class="select_img" onError="this.src='/Project_wooridoori/resources/image/Recommend/no_image.png'">
								</div>
								<div class="div_hover_box">				
									<div class="select_blockA">
										<span class="first_trip_click" name="first_trip" value="n" inx="${i.count}">
											<span class = "glyphicon glyphicon-check" style="right:20px; top:20px; font-size: 2em; color: black;"></span>
										</span>
									</div>
									<div class="select_blockB">
										<ul class="select_box_ul">
											<li><span class="tour_title">관광지명</span></li>
											<li class="rateit_box">
												<div class="rateit bigstars" id="rateit_false" inx="${i.count}"></div>
											</li>
											<li>							
												<div class="_ccimg" value="n" inx="${i.count}">
													좋아요
													<img class="ccimg" src="resources/image/Recommend/cc_img_1.png">													
												</div>						
												<div class="_jcimg" value="n" inx="${i.count}">
													즐겨찾기												
													<img class="jcimg" src="resources/image/Recommend/jc_img_1.png">													
												</div>
											</li>				
										</ul>
									</div>								 
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<a href="#none" class="slide_right"><img src="<%=request.getContextPath()%>/resources/image/Recommend/right.png"></a>
			</div>
		</div>
	</div>
	<!-- recommend detail data list  -->
	<div id="recommend_detail">
		<div style="width:1200px; height:800px;">
			<div style="width:1200px; height:800px;">
				<div id="list" style="width:1200px; height:800px;">
				</div>
				<div id="div_more">
					<a href="javascript:void(0);" id="btn_more">더보기</a>
				</div>
			</div>
		</div>
	</div>	
	<!-- dialog  -->
	<div id="detail_tour">
		<c:import url="../Recommend/tourdetail_dialog.jsp"/> 
	</div>
</body>
</html>