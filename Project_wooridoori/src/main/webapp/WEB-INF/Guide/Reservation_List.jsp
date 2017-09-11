<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/table-ul-sort.js" type="text/javascript" charset="UTF-8"></script>
		
	   	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/bootstrap.min.css?t=<%=System.currentTimeMillis()%>">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/AdminLTE.min.css?t=<%=System.currentTimeMillis()%>">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/font-awesome.min.css?t=<%=System.currentTimeMillis()%>">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/recommend_mycss/ionicons.min.css?t=<%=System.currentTimeMillis()%>">
		<style type="text/css">
/*  			#tb_reservation th:nth-child(1), #tb_reservation tr td:nth-child(1){
				display: none;
			} 
 */			
			ul{
				padding-top: 10px;
			}
			
			ul li {
				display: inline;
				font: bold 12px Dotum;
				padding: 0 10px;
			}
			
			#tb_reservation>thead th{
				background-color: #313131;
				color: #fff;
			}
			
			div#div_top{
				width: 92%;
				margin-left: 50px;
			}
			
			.pagination {
				width:92%;
				margin-left: 50%;
				text-align:center;
			    display: inline-block;
			}
			
			.pagination a {
			    color: black;
			    float: left;
			    padding: 8px 16px;
			    text-decoration: none;
			    transition: background-color .3s;
			}
			
			.pagination a.active {
			    background-color: #313131;
			    color: white;
			}
			
			.pagination a:hover:not(.active) {background-color: #ddd;}

		</style>
		<script type="text/javascript">
			$(function(){
				
				//최초 로딩시 실행.
			    /* listContent(); */
			    
			    $("#tb_reservation tbody").click(function(e){
			    	var i = $(this).index();
			    	var seq_guide = $("#tb_reservation tr").eq(i).find(".seq_guide").text();
			    	var addr = $("#tb_reservation tr").eq(i).find(".addr").text();
			   	if(e.target.nodeName != "TH" || e.target.nodeName != "BUTTON")
			   		location.href = "guideContent.wd?num="+seq_guide+"&addr="+addr;
			    });
				
			});
		</script>
	</head> 
	<body style="display: none;">
    <!-- Main content -->
      <div id="div_top" class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Reservation List</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="tb_reservation" class="table table-bordered table-hover">
                <thead>
                <tr>
                   <th>가이드 글 번호</th>
                   <th width="120px">번 호&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="fa fa-fw fa-chevron-up" onclick="javascript:sortTD(1);"></span><span class="fa fa-fw fa-chevron-down" onclick="javascript:reverseTD(1);"></span>
				   </th>
                   <th width="300px">제 목&nbsp;&nbsp;&nbsp;&nbsp; 
                   	    <span class="fa fa-fw fa-chevron-up" onclick="javascriipt:jasortTD(2);"></span><span class="fa fa-fw fa-chevron-down" onclick="javascript:reverseTD(2);"></span>
                   </th>                
                   <th width="100px">이 름</th>
                   <th width="120px;">전화번호</th>
                   <th width="150px">기 간&nbsp;&nbsp;&nbsp;&nbsp; 
                   		<span class="fa fa-fw fa-chevron-up" onclick="javascriipt:sortTD(5);"></span><span class="fa fa-fw fa-chevron-down" onclick="javascript:reverseTD(5);"></span>
                   </th>
                   <th width="120px">가 격&nbsp;&nbsp;&nbsp;&nbsp; 
                   		<span class="fa fa-fw fa-chevron-up" onclick="javascriipt:sortTD(6);"></span><span class="fa fa-fw fa-chevron-down" onclick="javascript:reverseTD(6);"></span>
                   </th>
                   <th width="200px">만나는 장소</th>
                   <th width="100px">만나는 시간</th>
                   <th width="100px">지역</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty reservation_list}">
                	<tr>
                		<td colspan="9" style="align:center;">조회된 데이터가 없습니다.</td>
                	</tr>
                </c:if>
                	<c:forEach var="list" items="${reservation_list}">
	                   <tr style="cursor: pointer;">
	                   		<td class="seq_guide">${list.seq_guide}</td>
	                		<td>${list.seq_reservation}</td>
	                		<td>${list.gr_thema}</td>
	                		<td>${list.gr_name}</td>
	                		<td>${list.gr_tel}</td>
	                		<td>${list.gr_day}</td>
	                		<td>${list.gr_price}</td>
	                		<td>${list.gr_meet_addr}</td>
	                		<td>${list.gr_meet_time}</td>
	                		<td class="addr">${list.gr_addr}</td>
	                   </tr>
                   </c:forEach>
                </tbody>                
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
      <!-- 테이블 colum 정렬 -->
      <script type="text/javascript">
      	var myTable = document.getElementById( "tb_reservation" ); 
		var replace = replacement( myTable ); 
		function sortTD( index ){    replace.ascending( index );    } 
		function reverseTD( index ){    replace.descending( index );	}
      </script>
      
      <div class="pagination">
		<c:if test="${totalCount > 0}">
			<c:if test="${startPage > 1}">
				&nbsp;<a href="selectreservationlist.wd?pageNum=${startPage-1}">&laquo;</a>
			</c:if>
			<c:forEach var="pg" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${pg == currentPage}">
					<a href="selectreservationlist.wd?pageNum=${pg}" class="active">${pg}</a>
				</c:if>
				<c:if test="${pg != currentPage}">
					<a href="selectreservationlist.wd?pageNum=${pg}">${pg}</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				&nbsp;<a href="selectreservationlist.wd?pageNum=${endPage+1}">&raquo;</a>
			</c:if>
		</c:if>
	  </div>
	</body>
</html>