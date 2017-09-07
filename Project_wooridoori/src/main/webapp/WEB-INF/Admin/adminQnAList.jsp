<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- mypage table css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/bootstrap.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/font-awesome.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/ionicons.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/morris.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/AdminLTE.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/_all-skins.min.css?t=<%=System.currentTimeMillis()%>">

<title>QnA관리자페이지</title>
</head>
<body>
	<div style="width: 800px; margin-left: auto; margin-right: auto;">
		<h3>QnA관리페이지</h3>
	     <div id="donut_chart_box" style="width: 45%; float: left; margin-left: 20px;">
		<div class="box box-danger">
			<div class="box-header with-border">
			  <h3 class="box-title">문의현황(문의종류)</h3>			
			  <div class="box-tools pull-right">
			    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
			  </div>
			</div>
			<div class="box-body chart-responsive">
			  <div class="chart" id="sales-chart" style="height: 300px; position: relative;"></div>
			</div>
			<!-- /.box-body -->
			</div>
		<!-- /.box -->
	</div>
    </div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>No</th>
					<th style="width: 100px;">Kind</th>
					<th style="width: 250px;">Title</th>
					<th>writer</th>
					<th style="width: 100px;">Date</th>
					<th>Answer</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="data" items="${list}">
				<tr>
					<td>${data.num}</td>
					<td>
					<c:choose>
						<c:when test="${data.kind==1}"><font style="color:#3c8dbc;">[일반문의]</font></c:when>
						<c:when test="${data.kind==2}"><font style="color:#f56954;">[회원문의]</font></c:when>
						<c:when test="${data.kind==3}"><font style="color:#00a65a;">[신고]</font></c:when>
					</c:choose>
					</td>
					<td>${data.title}</td>
					<td>${data.writer}</td>
					<td><fmt:formatDate value="${data.wdate}" pattern="YY.MM.dd"/></td>
					<td>
						<c:if test="${data.acheck eq 'N'}"><a>답글쓰기</a></c:if>
						<c:if test="${data.acheck eq 'Y'}"><a>답글보기</a></c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	<script type="text/javascript">
$(function () {
	//DONUT CHART
	var r = ${r}
	var n = ${n}
	var m = ${m}
	var donut = new Morris.Donut({
		element: 'sales-chart',
		resize: true,
		colors: ["#3c8dbc", "#f56954", "#00a65a"],
		data: [
			{label: "일반문의", value: n},
			{label: "회원문의", value: m},
			{label: "신고", value: r}
    	],
		hideHover: 'auto'
	});
});
</script>
<!-- script -->
    <!-- mypage table script -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/jquery.min.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/bootstrap.min.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/jquery.dataTables.min.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/jquery.slimscroll.min.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/fastclick.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/adminlte.min.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/demo.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/morris.js?j=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/raphael.min.js?j=<%=System.currentTimeMillis()%>"></script>
<%-- 	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/Recommend_Mypage.js?j=<%=System.currentTimeMillis()%>"></script>	 --%>
</body>
</html>