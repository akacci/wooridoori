<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- 평점 먹이는 별 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
<script src="startStyle/scripts/jquery.rateit.js" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="startStyle/scripts/rateit.css">
 -->
<!-- mypage table css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/bootstrap.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/font-awesome.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/ionicons.min.css?t=<%=System.currentTimeMillis()%>">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/morris.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/AdminLTE.min.css?t=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/_all-skins.min.css?t=<%=System.currentTimeMillis()%>">

<!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/Recommend_Mypage.css"> -->
</head>
<body>
     <!-- DONUT CHART -->
     
     <div id="chart_total_box" style="margin-left: 40px;">
     <div id="donut_chart_box" style="width: 45%; float: left; margin-left: 20px;">
		<div class="box box-danger">
			<div class="box-header with-border">
			  <h3 class="box-title">Donut Chart</h3>			
			  <div class="box-tools pull-right">
			    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
			    </button>
			    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
			  </div>
			</div>
			<div class="box-body chart-responsive">
			  <div class="chart" id="sales-chart" style="height: 300px; position: relative;"></div>
			</div>
			<!-- /.box-body -->
			</div>
		<!-- /.box -->
	</div>
          <!-- BAR CHART -->
	<div id="bar_chart_box" style="float: left; width: 45%; margin-left: 20px;">
		<div class="box box-success">
		  <div class="box-header with-border">
		    <h3 class="box-title">Bar Chart</h3>
		    <div class="box-tools pull-right">
		      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
		      </button>
		      <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		    </div>
		  </div>
		  <div class="box-body chart-responsive">
		    <div class="chart" id="bar-chart" style="height: 300px;"></div>
		</div>
		<!-- /.box-body -->
		</div>
	</div>
    </div>
    <!-- Main content -->
      <div class="row" style="width: 92%; margin-left: 40px;">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                 	<th>Tourist destination</th>
	                <th>Grade</th>                
	                <th>Category</th>
	                <th>Address</th>
	                <th>Bookmark</th>
	                <th>Recommend</th>
	                <th>First trip</th>
	                <th>Date modified</th>
                </tr>
                </thead>
                <tbody id="mypage_list">
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/recommend_myjs/Recommend_Mypage.js?j=<%=System.currentTimeMillis()%>"></script>	
	
</body>
</html>