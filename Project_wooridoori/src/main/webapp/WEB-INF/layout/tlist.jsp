<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href='resources/css/tlist.css?t=<%=System.currentTimeMillis()%>'>
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("[class^=first_cat]").each(function (index) {
			$(this).addClass("first_cat");
			$(this).addClass("first_cat:hover");
		});
		
		$("[class^=text_info]").each(function (index) {
			$(this).addClass("text_info");
		});
		
		$("[class^=first_cat] [class^=img]").each(function (index) {
			$(this).addClass("area_img");
		});
		
		var depth = '<c:out value="${depth}"/>';
		if(depth=='2'){
			$(".subwrap").css({
				'display' : 'none'
			});
			$(".tText_1").css({
				'display' : 'none'
			});
		}
		
		var asname =  '<c:out value="${sigungu}"/>';
		if(asname == '세종특별자치시'){
			$(".tText_2_1").css({
				'width' : '680'
			});
		}
		
		var searchkey = '<c:out value="${searchkey}"/>';
		if(!searchkey == ''){
			$(".tText_2 .tText_2_a").css({
				'pointer-events': 'none',
				'cursor': 'default'
			});
			$(".tText_2_1").css({
				'background' : 'none'
			});
		    $("#Ttable_cover tr td span:contains('"+searchkey+"')").each(function () {
		        var regex = new RegExp(searchkey,'gi');
		       $(this).html($(this).text().replace(regex, "<span class='Ttext_red'>"+searchkey+"</span>"));
		    });
		}
		
		var cat2_name = '<c:out value="${cat2_name}"/>';
		if(!cat2_name == ''){
			$(".tText_2 .tText_2_a").css({
				'pointer-events': 'none',
				'cursor': 'default'
			});
			$(".tText_2_1").css({
				'background' : 'none'
			});
		}

	});
</script>
<title>Insert title here</title>
</head>
<body style="width: 100%; height: 1500px;">
	<header> 
         <%-- <jsp:include page= "../layout/wtopmenu.jsp"/> --%>
         <%@include file="../layout/top.jsp"%>
   </header>
	<div class="t_wrap">

	<div class="tText_1">
		<div class="tText_1_1"><b>가고싶은 곳을 선택하세요.</b><br>
		</div>
	</div>

	<div class="subwrap" style="width: 100%; height: 90%;">
		<c:set var="depth" value="${depth}"></c:set>
		<c:if test="${depth eq '0'}">
		<div class="area_content">
			<ul>
			<c:forEach var="a" items="${list}" varStatus="i">
				<li>
				<a href="tlist.wd?areaname=${a}" class="cat_href${i.count}"
				style="float: left; margin-top: 30px; text-decoration:none; width: 220px; height: 220px;">
					<div class="first_cat${i.count}" style="width: 100%; height: 100%; ">
						<img src="resources/image/tlist/area${i.count}.jpg" class="img${i.count}" width="200px" height="200px" -webkit-border-radius: 80px;>
						<div class="text_info${i.count}" >
							<span class="cover"></span>
							<strong class="city_name">${a}<i class="new"></i></strong>
						</div>
					</div>
				</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		</c:if>

		<c:if test="${depth eq '1'}">
			<c:set var="a" value="${areaname}" />
			<div class="area_choice"><b>${areaname}</b>을(를) 선택하셨어요</div>
			<div class="sigungu_content">
				<ul>
					<c:forEach var="in" items="${imglist}" varStatus="i">
					<li>
						<div class="sigungu_list">
							<a href="tlist.wd?sigungu=${in.sigunguname}&areaname=${areaname}" class="sel">
							<div class="sigungu_span">
								<span>${in.sigunguname}</span>
							</div>
							<div class="sigungu_img">
								<img src="${in.firstimage}" >
							</div>
							</a>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>

	<div class="t_list_wrap">
<c:set var="a" value="${areaname}" />
<c:set var="s" value="${sigungu}" />
<c:set var="c" value="${cat2_name}"/>
		<c:if test="${depth eq '2'}">
				<c:set var="search" value="${searchkey}"></c:set>
				<div class="tText_2">
					<a href="#"  class="tText_2_a">
<%-- 					${sigungu}${areaname}${a.addr1 }${a.title } --%>
						<div class="tText_2_1" name="${s}">		
							<c:if test="${a != '' && a ne null}">
								<b>현재 ${a}&nbsp;${s}에서 매칭 중인 가이드 보러 가기&nbsp;&nbsp;</b>
							</c:if>
							
							<c:if test="${search != '' && search ne null}">
								<b><font color=red>${search}</font>(으)로 검색한 결과입니다.&nbsp;&nbsp;</b>
							</c:if>
							
							<c:if test="${c != '' && c ne null}">
								<b><font color="red">${c}</font>(으)로 분류한 결과입니다.</b>
							</c:if>
						</div>
					</a>
					<a href="tlist.wd?" class="tText_2_b">
						<div class="tText_2_2">
							<b style="right: 0;">다른 지역 선택&nbsp;&nbsp;</b>
						</div>
					</a>
				</div>
				<div class="Ttable_cover" id="Ttable_cover">
					<table class="tlist_table" id="tlist_table">
						<tr>
							<th style="width: 70px">글번호</th>
							<th style="width: 220px"><a class="t_standard" href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&standard=1">관광지▼</a></th>
							<th style="width: 300px">지역</th>
							<th style="width: 150px"><a class="t_standard" href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&standard=2">구분▼</a></th>
							<th style="width: 70px"><a class="t_standard" href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&standard=3">평점▼</a></th>
							<th style="width: 70px"><a class="t_standard" href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&standard=4">조회수▼</a></th>
						</tr>
						<c:forEach var="t" items="${tlist}" varStatus="i">
							<tr class="tlist_item" onclick="location.href='detail.wd?contentid=${t.contentid}&areaname=${areaname}&sigungu=${sigungu}&depth=2'">
								<td style="text-align: center;">${no}</td><%-- ${fn:length(tlist)-i.index} --%>
								<c:set var="no" value="${no-1}"></c:set>
								<td><span>${t.title }</span></td>
								<td><span>${t.addr1 }</span></td>
								<td style="text-align: center;"><span>${t.cat3_name}</span></td>
								<td></td>
								<td style="text-align: center;"><span>${t.readcount }</span></td>
							</tr>
						</c:forEach>
					</table>
					
				<c:if test="${a != '' && a ne null}">	
					<div class="tlist_arrange">
						<ul >
						<c:if test="${startPage>1 }">
							<li style="float: left;"><a href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&pageNum=${startPage-1 }"><&nbsp;&nbsp;</a></li>
						</c:if> 
						<c:forEach var="pg" begin="${startPage}" end="${endPage }">
							<li style="float: left;"><a href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&pageNum=${pg}">${pg }</a>&nbsp;&nbsp;&nbsp;</li>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li style="float: left;"><a href="category.wd?areaname=${areaname}&sigungu=${sigungu}&depth=2&pageNum=${endPage+1 }">&nbsp;></a></li>
						</c:if>
						</ul>
					</div>
				</c:if>	
				
				<c:if test="${search != '' && search ne null}">
					<div class="tlist_arrange">
						<ul >
						<c:if test="${startPage>1 }">
							<li style="float: left;"><a href="category.wd?searchkey=${searchkey}&depth=2&pageNum=${startPage-1 }"><&nbsp;&nbsp;</a></li>
						</c:if> 
						<c:forEach var="pg" begin="${startPage}" end="${endPage }">
							<li style="float: left;"><a href="category.wd?searchkey=${searchkey}&depth=2&pageNum=${pg}">${pg }</a>&nbsp;&nbsp;&nbsp;</li>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li style="float: left;"><a href="category.wd?searchkey=${searchkey}&depth=2&pageNum=${endPage+1 }">&nbsp;></a></li>
						</c:if>
						</ul>
					</div>
				</c:if>
				
				<c:if test="${c != '' && c ne null}">
					<div class="tlist_arrange">
						<ul >
						<c:if test="${startPage>1 }">
							<li style="float: left;"><a href="category.wd?cat2_name=${cat2_name}&depth=2&pageNum=${startPage-1 }"><&nbsp;&nbsp;</a></li>
						</c:if> 
						<c:forEach var="pg" begin="${startPage}" end="${endPage }">
							<li style="float: left;"><a href="category.wd?cat2_name=${cat2_name}&depth=2&pageNum=${pg}">${pg }</a>&nbsp;&nbsp;&nbsp;</li>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li style="float: left;"><a href="category.wd?cat2_name=${cat2_name}&depth=2&pageNum=${endPage+1 }">&nbsp;></a></li>
						</c:if>
						</ul>
					</div>
				</c:if>
				
				</div>
		</c:if>
	</div>
	<br style="clear: both;">
	<div style="text-align: right;">
	<button type="button" onclick="javascript:window.scrollTo(0, 0);" class="goTop"><!-- <img src="./resources/image/tlist/goTop.png" alt="맨위로" width="30px" height="30px"> --></button>
	</div>
</div>

<footer>
         <%-- <jsp:include page= "../layout/wfooter.jsp"/> --%>
         <%@include file="../layout/wfooter.jsp"%>
</footer>
</body>
</html>