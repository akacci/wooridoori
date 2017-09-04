<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<style type="text/css">
.a_contents{
	margin-top: 60px;
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
	height: 220px;
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script><!-- 구글차트 -->
<script type="text/javascript">

//	==============QnA===============
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawQChart);
	function drawQChart() {
		var data = google.visualization.arrayToDataTable([
				[ "Element", "Density", { role : "style" } ],
				[ "Copper", 8.94, "#b87333" ],
				[ "Silver", 10.49, "silver" ],
				[ "Gold", 19.30, "gold" ],
				[ "Platinum", 21.45, "color: #e5e4e2" ] ]);

		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "Density of Precious Metals, in g/cm^3",
			width : 400,
			height : 220,
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
				[ 'Year', 'Sales', 'Expenses' ], [ '2013', 1000, 400 ],
				[ '2014', 1170, 460 ], [ '2015', 660, 1120 ],
				[ '2016', 1030, 540 ] ]);

		var options = {
			title : 'Company Performance',
			hAxis : {
				title : 'Year',
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
	<header>
		<%@ include file="../layout/wtopmenu.jsp"%>
	</header>
	<div class="a_contents admin">
		<div id="div_detail">
			<span class="tab">전체</span>
			<span class="tab">QnA질문리스트</span>
			<span class="tab">회원관리</span>
			<span class="tab">+a</span>
		</div>
		<div id="div_detail">
			<div class="M_list">
				<div class="p_title">QnA질문리스트(8)<hr class="title_hr"></div>
				<div class="preview bgcolor_black">
					<div class="Q_list">
						<hr class="p_hr"><div style="text-align: center;"><div class="q_title">TITLE</div><span class="q_writer">Writer</span></div><hr class="p_hr">
						<div>
							<div class="q_title">제목란 입니다.</div><span class="q_writer">글쓴이</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
						</div>
					</div>
			</div>
			<div class="preview" id="chart_qna">
			
			</div>
			</div>
			<div class="M_list">
				<div class="p_title">회원관리(9)<hr class="title_hr"></div>
				<div class="preview" id="chart_member"></div>
				<div class="preview bgcolor_black">
					<div class="Q_list">
						<hr class="p_hr"><div style="text-align: center;"><div class="m_id">ID</div><span class="sign_date">Sign date</span></div><hr class="p_hr">
						<div>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
							<div class="m_id">asdf</div><span class="sign_date">17.09.04 00:00</span>
						</div>
					</div>
				</div>
			</div>
			<div class="M_list">
				<div class="p_title">+a<hr class="title_hr"></div>
				<div class="preview bgcolor_black">
					<div class="Q_list">
						<hr class="p_hr"><div style="text-align: center;"><div class="q_title">Title</div><span class="q_writer">Writer</span></div><hr class="p_hr">
						<div>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
							<div class="q_title">asdf</div><span class="q_writer">writer</span>
						</div>
					</div>
				</div>
				<div class="preview"></div>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../layout/wfooter.jsp"%>
	</footer>
</body>
</html>