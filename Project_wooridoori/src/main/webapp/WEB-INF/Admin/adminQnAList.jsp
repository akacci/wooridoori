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

<script type="text/javascript">
$(function(){
	$(".table-striped .content_qna").hide();
	$(".table-striped .write_qna").click(function(){
		var id= $(this).attr("id");
		console.log(id);
		$("#qna_"+id).show();
	});
});
</script>
<title>QnA관리자페이지</title>
</head>
<body>
	<div style="width: 800px; margin-left: auto; margin-right: auto;">
		<h3>QnA관리페이지</h3>

			<div class="box-body chart-responsive">
			  <div class="chart" id="barchart" style="width: 45%;float:right;"></div>
			  <div class="chart" id="donutchart" style="width: 45%;"></div>
			</div>
	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>No</th>
					<th style="width: 100px;">Kind</th>
					<th style="width: 300px;">Title</th>
					<th>writer</th>
					<th style="width: 100px;">Date</th>
					<th>Answer</th>
				</tr>
			</thead>
			<tbody class="awds">
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
					<td><a class="write_qna" id="qna${data.num}" onclick="changePage('answerqna.wd?num=${data.num}')">[${data.title}]</a></td>
					<td>${data.writer}</td>
					<td><fmt:formatDate value="${data.wdate}" pattern="YY.MM.dd"/></td>
					<td>
						<c:if test="${data.acheck eq 'N'}">미답변</c:if>
						<c:if test="${data.acheck eq 'Y'}"><a>답변완료</a></c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	var nnum = ${n};
  		var mnum = ${m};
  		var rnum = ${r};
        var data = google.visualization.arrayToDataTable([
          ['Kind', 'Num', { role : "style" }],
          ['일반문의',	nnum	, "#3c8dbc" ],
          ['회원문의',	mnum	, "#f56954" ],
          ['신고',	rnum	,"#00a65a"]     
        ]);
		
        var options = {
        		legend: 'none',
                pieSliceText: 'label',
                title: '문의현황(문의종류)',
                pieStartAngle: 100,
                fontSize: 17,
                textStyle: {bold:true},
                'width':300,
                'height':300,
                chartArea: {left: 10, bottom:20, top:25,right:10,}
        };
        var tt = ${T};
  		var yy = ${Y};
  		var nn = ${N};
        var data2 = google.visualization.arrayToDataTable([
          ['Kind', 'Num', { role : "style" }],
          ['전체문의',	tt	, "#3c8dbc" ],
          ['답변완료',	yy	, "#f56954" ],
          ['미답변',	nn	,"#00a65a"]     
        ]);
		
        var options2 = {
        		legend: 'none',
                pieSliceText: 'label',
                title: '처리현황',
                pieStartAngle: 100,
                fontSize: 17,
                textStyle: {bold:true},
                'width':350,
                'height':300,
                chartArea: {left: 30, bottom:20, top:25,right:20,}
        };
        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
        var chart = new google.visualization.ColumnChart(document.getElementById('barchart'));
        chart.draw(data2, options2);
      }
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