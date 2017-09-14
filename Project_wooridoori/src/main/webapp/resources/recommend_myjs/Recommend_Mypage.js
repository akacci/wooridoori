$(function(){
	var pager = new Pager();
	
	try{
		var donut_CountData = chart_BubbleData();
		var bar_data = barChart_Data();
		
		//DONUT CHART
		var donut = new Morris.Donut({
		  element: 'sales-chart',
		  resize: true,
		  colors: ["#3c8dbc", "#f56954", "#86E57F", "#FAED7D", "#A566FF"],
		  data: donut_CountData,
		  hideHover: 'auto'
		});
		//BAR CHART
		var bar = new Morris.Bar({
		  element: 'bar-chart',
		  resize: true,
		  data: bar_data,
		  barColors: ['#00a65a', '#f56954'],
		  xkey: 'y',
		  ykeys: ['a', 'b'],
		  labels: ['mygrade', 'totalgrade'],
		  hideHover: 'auto'
		});
		updateClick(e);
	} catch(e){ console.log(e); }
	
	pager.dataLoad();
	
});

function Pager(){
	var thisobj = this;
	var currentPage = 1;
	var limit = 2;
	var totalCount = 0;
	
	this.dataLoad = function(){
		$.ajax({
			url: 'bubble_Data.wd',
			type: 'POST',
			data: { currentPage: currentPage, limit: limit },
			success: function(ret){
				/*console.log('test - ' + ret + '\n\n\n');*/
				var parsedData = null;
				
				try{ parsedData = JSON.parse(ret); } catch(e){ console.log(e); }
				
				if(parsedData){
					if(!totalCount) totalCount = parsedData.totalCount;
					thisobj.drawList(parsedData.dataList);
					thisobj.drawPage();
				}
			}
		});
	};
	
	this.drawList = function(s_data){
		var mypage = "";
		$("#mypage_list").empty();
		
		var lastNum = (currentPage + limit) - 1;
		var startNum = (currentPage - 1) * limit;
		if(lastNum > totalCount) {lastNum = totalCount;}
		
		console.log(startNum + " , " + lastNum + " , " + currentPage);
		
		if(s_data.length > 0){
			for (var i = startNum; i < lastNum; i++)
			{				
				var title = $.trim(s_data[i].TITLE_REF);
				var contentid = $.trim(s_data[i].CONTENTID_REF);
				var MyPage_List = $("<tr class='mypage_list'>");
				var MyPage_title = $("<td class='mypage_title_span' value="+contentid+" onclick='javascript:click_title(this)'>"+title+"</td>");
				var MyPage_Grade = $("<td class='mypage_grade'>");
				
				mypage += "<tr class='mypage_list'>";				
				mypage += "<td class='mypage_title_span' value="+contentid+" onclick='javascript:click_title(this)'>"+title+"</td>";
				mypage += "<td class='mypage_grade'>";
				mypage += "<div class='rateit bigstars'></div>"+s_data[i].GRADE_POINT+"</td>";
				mypage += "<td class='mypage category_span'>"+s_data[i].CAT2_NAME+"</td>";
				mypage += "<td class='mypage addr_span'>"+s_data[i].ADDR1+"</td>";
				var bookmark = $.trim(s_data[i].BOOKMARK);
				var preference = $.trim(s_data[i].PRE_RENCE);
				var firsttrip = $.trim(s_data[i].FIRSTTRIP);
				if(bookmark == 'y' || bookmark == 'Y')
				{						
					mypage += "<td class='mypage_bookmark' book="+bookmark+" con="+contentid+" onclick='javascript:updateClick(this)'><span class='glyphicon glyphicon-thumbs-up'></span></td>";						
				}else{
					mypage += "<td class='mypage_bookmark' book="+bookmark+" con="+contentid+" onclick='javascript:updateClick(this)'><span class='glyphicon glyphicon-thumbs-down'></span></td>";						
				}
				if(preference == 'y' || preference == 'Y')
				{
					mypage += "<td class='mypage_like' pre="+preference+" con="+contentid+" onclick='javascript:updateClick(this)'><span class='glyphicon glyphicon-heart'></span></td>";
				}else{
					mypage += "<td class='mypage_like' pre="+preference+" con="+contentid+" onclick='javascript:updateClick(this)'><span class='glyphicon glyphicon-heart-empty'></span></td>";
				}
				if(firsttrip == 'y' || firsttrip == 'Y')
				{
					mypage += "<td class='mypage_firsttrip_span' fir="+firsttrip+" con="+contentid+" onclick='javascript:updateClick(this)'><span class='glyphicon glyphicon-ok'></span></td>";
				}else{
					mypage += "<td class='mypage_firsttrip_span' fir="+firsttrip+" con="+contentid+" onclick='javascript:updateClick(this)'><span class='glyphicon glyphicon-remove'></span></td>";
				}
				mypage += "<td class='mypage_day_span'>"+s_data[i].MODIFIED_DATE+"</td>";					
				mypage += "</tr>";
			}
		}else if(s_data.length == 0){
			alert("데이터가 부족합니다.");
		}
		
		$("#mypage_list").append(mypage);
		
	};
	
	this.drawPage = function(){
		
		var left = currentPage > 5 ? true : false;
		var right = currentPage < 5 ? true : false;
		var perBlock = 5;
		var startPage = startPage = (currentPage)/perBlock*perBlock;
		var endPage = startPage + perBlock - 1;
		var maxPage = parseInt(totalCount / limit) + 1;
		
		if(endPage > maxPage) endPage=maxPage;
		
		$('#mypage_paging > td:eq(0)').empty();
		
		var wrapper = $('#mypage_paging > td:eq(0)');
		var leftBtn = $('<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left"></span></button>');
		var rightBtn = $('<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-chevron-right"></span></button>');
		
		if(left) wrapper.append(leftBtn);
		
		for(i = startPage; i <= (maxPage < endPage ? (maxPage == 1 ? 2 : maxPage) : endPage); i++){
			var pageBtn = $('<button id="page_' + i + '" type="button" class="btn btn-success">' + i + '</button>');			
			wrapper.append(pageBtn);
			
			pageBtn.click(function(){ var idx = $(this).text(); thisobj.clickPage(idx); });
				/*var idx = $(this).text();
				if(idx == currentPage) return;
				currentPage = idx;
				Pager(currentPage);
				console.log(idx);*/
			
		}		
		
		if(right) wrapper.append(rightBtn);
		
		leftBtn.click( function(){ thisobj.clickLbtn(startPage - 1); });
		rightBtn.click( function(){ thisobj.clickRbtn(endPage + 1); });
		
	};
	
	this.clickPage = function(idx){		
		if(idx == currentPage) return;			
		currentPage = idx;
		var dataLoad = thisobj.dataLoad(currentPage);
		
		return dataLoad;	
	};
	
	this.clickRbtn = function(idx)
	{
		console.log(idx);
		currentPage = idx;
		var dataLoad = thisobj.dataLoad(currentPage);
	};
	
	this.clickLbtn = function(idx)
	{
		console.log(idx);
		currentPage = idx;
		var dataLoad = thisobj.dataLoad(currentPage);
	};
}

//function bubble_Data()
//{
//	$.ajax({
//		url: "bubble_Data.wd",
//		type: "post",
//		success: function(bubdata){
//			
//		}	
//	});	
//};
//
//function mypage_paging(currentPage)
//{
//	$.ajax({
//		url: "paging_mypage.wd",
//		data: {"currentPage":currentPage},
//		type: "post",
//		async: false,
//		success: function(data){			
//			var s_data = JSON.parse(data);
//			
//			var mypage = "";
//			
//			mypage += "<tr>";
//			mypage += "<td>";			
//			if(s_data.startPage > s_data.perBlock)
//			{
//				mypage += "<span class='glyphicon glyphicon-chevron-left'></span>";
//			}
//			for(var j = s_data.startPage; j <= s_data.endPage; j++)
//			{
//				mypage += "<button type='button' class='btn btn-success'>"+j+"</button>";
//			}
//			if(s_data.endPage < s_data.totalPage)
//			{
//				mypage += "<span class='glyphicon glyphicon-chevron-right'></span>";
//			}						
//			mypage += "</td>";			
//			mypage += "</tr>";
//	
//			$("#mypage_paging").append(mypage);
//		}
//	});
//};
function barChart_Data(){
	var bar_str = Array();
	$.ajax({
		url: "barChartData.wd",
		async: false,
		type: "post",		
		success: function(data){
			var bar_data = JSON.parse(data);
			
			if(bar_data.length != 0){
				for(var i = 0; i < bar_data.length; i++)
				{
					var mygrade = parseFloat(bar_data[i].MY_GRADE);
					var totalgrade = parseFloat(bar_data[i].TOTAL_GRADE);
					var Category = bar_data[i].CAT2_NAME;
					
					bar_str.push({"y":Category,"a":mygrade,"b":totalgrade});
				}
			}else{
				bar_str.push({"y":noData, "a":0,"b":0});
			}
			
		}
	});
	return bar_str;
};
function chart_BubbleData(){
	var str = new Array();
	$.ajax({
		url: "chart_BubbleData.wd",
		async: false,
		type: "post",
		success: function(data){
			var b_data = JSON.parse(data);
			if(b_data.length != 0){
				for(var i = 0; i < b_data.length; i++)
				{
					var cat2_num = parseInt(b_data[i].C_CAT2);
					str.push({"label":b_data[i].CAT2_NAME, "value":cat2_num});				
				}				
			}else{
				
			}
		}
	});
	return str;
};
function updateClick(e)
{
	var bookmark = "x";
	var preference = "x";
	var firsttrip = "x";
	var contentid = $(e).attr("con");
		
	bookmark = $(e).attr("book");
	preference = $(e).attr("pre");
	firsttrip = $(e).attr("fir");
	
	if(bookmark == 'y')
	{
		$(e).attr("book",'n');
	}else{
		$(e).attr("book",'y');
	}
	if(preference == 'y')
	{
		$(e).attr("pre",'n');
	}else{
		$(e).attr("pre",'y');
	}
	if(firsttrip == 'y')
	{
		$(e).attr("fir",'n');
	}else{
		$(e).attr("fir",'y');
	}
	
	$.ajax({
		url: "updateClickMyPage.wd",
		data: {"bookmark":bookmark, "preference":preference,"firsttrip":firsttrip,"contentid":contentid},
		type: "post",
		success: function(data){
			alert("저장하였습니다.");
		},
		complete: function(){
			Pager();
		}
	});
}

function click_title(e){
	var contentid = $(e).attr("value");
	alert(contentid);
	location.href = "detail.wd?contentid="+contentid;
}
