<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<style type="text/css">
.a_contents{
	margin-bottom: 33px;
	width: 850px;
	margin-left: auto;
	margin-right: auto;
}
.admin #div_detail {
	width: 850px;
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	padding-left: auto;
	padding-right: auto;
}
.admin #div_detail .content_detail {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
	margin-top: 20px;
	padding: 10px;
}
.admin #div_detail .tab{
	width: 25%;
	float: left;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
	padding: 5px;
	text-decoration: underline;
}
.admin #div_detail .tab:hover{
	font-weight: bolder;
	text-decoration: underline;
}
.admin #div_detail .M_list{
	height: 250px;
	margin-top: 20px;
}
.admin #div_detail .M_list .preview{
	position: relative;
	float: left;
	height: 270px;
	width: 400px;
	margin: 7px;
}
.admin #div_detail .M_list .preview .p_title{
	font-weight: bolder;
}
.admin #div_detail .M_list .preview .p_title .enter{
	font-size: 12px;
	float: right;
	margin-top: 6px;
}
.admin #div_detail .M_list .preview .p_title .enter:hover{
	cursor: pointer;
}
.admin #div_detail .M_list .preview .p_hr{
	margin: 3px 0;
	border-top: 1px solid #666;
}
.admin #div_detail .M_list .preview .Q_list{
	padding: 0 2px;
}
.admin #div_detail .M_list .preview .Q_list .q_title{
	padding: 0 5px;
	width: 300px;
	float: left;
	font-variant: small-caps;
}
.admin #div_detail .M_list .preview .Q_list .q_writer{
	padding: 0 5px;
	font-variant: small-caps;
}
.admin #div_detail .M_list .preview .Q_list .m_id{
	padding: 0 5px;
	width: 260px;
	float: left;
	font-variant: small-caps;
}
.admin #div_detail .M_list .preview .Q_list .sign_date{
	padding: 0 5px;
	font-variant: small-caps;
}
.bgcolor_orange{
	color: white;
	background-color: orange;
}
.bgcolor_green{
	color: white;
	background-color: green;
}
.bgcolor_blue{
	color: white;
	background-color: blue;
}
.bgcolor_black{
	color: white;
	background-color: #313131;
}
.title_hr{
	border-top: 1px solid #313131;
	margin: 1px 0;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

//	==============QnA===============
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawQChart);
	function drawQChart() {
		var nnum = ${n};
		var mnum = ${m};
		var rnum = ${r};
		var data = google.visualization.arrayToDataTable([
				[ "Kind", "Num", { role : "style" } ],
				[ "일반문의", nnum, "#3c8dbc" ],
				[ "회원문의", mnum, "#f56954" ],
				[ "신고", rnum, 	 "#00a65a" ],
			]);
		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "문의 내역",
			width : 400,
			height : 300,
			bar : {	groupWidth : "95%" },
			legend : { position : "none" },
		};
		var chart = new google.visualization.BarChart(document.getElementById("chart_qna"));
		chart.draw(view, options);
	}
//	==============회원용===============
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawMChart);

	function drawMChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Day', 'Member', 'Total' ],
				[ '2013', 1000, 400 ],
				[ '2014', 1170, 460 ],
				[ '2015', 660, 1120 ],
				[ '2016', 1030, 540 ] ]);

		var options = {
			title : 'Sign up',
			width : 400,
			height : 300,
			hAxis : {
				title : 'Day',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document.getElementById('chart_member'));
		chart.draw(data, options);
	}
//	==============회원용===============
</script>
</head>
<body>
	<div class="a_contents admin">
		<div id="div_detail">
			<div class="M_list">
				<div class="p_title"><a onclick="changePage('adminQnAList.wd')" href="#">QnA질문리스트(${noncheckCount})</a><hr class="title_hr"></div>
				<div class="preview bgcolor_black">
					<div class="Q_list">
						<hr class="p_hr"><div style="text-align: center;"><div class="q_title">TITLE</div><span class="q_writer">Writer</span></div><hr class="p_hr">
						<div>
							<c:forEach var="data" items="${qlist}" end="10">
								<div class="q_title"><a onclick="changePage('answerqna.wd?num=${data.num}')">${data.title}</a></div><span class="q_writer">${data.writer}</span>
							</c:forEach>
						</div>
					</div>
			</div>
			<div class="preview" id="chart_qna">
			
			</div>
			</div>
			<div class="M_list">
				<div class="p_title"><a onclick="changePage('adminMemberList.wd')" href="#">회원관리(9)</a><hr class="title_hr"></div>
				<div class="preview" id="chart_member"></div>
				<div class="preview bgcolor_black">
					<div class="Q_list">
						<hr class="p_hr"><div style="text-align: center;"><div class="m_id">ID</div><span class="sign_date">Sign date</span></div><hr class="p_hr">
						<div>
						<c:forEach var="m" items="${mlist}" end="9">
							<div class="m_id">${m.m_id}</div><span class="sign_date"><fmt:formatDate value="${m.cre_date}" pattern="YY.MM.dd"/></span>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>