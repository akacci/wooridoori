(function ($) {
	var currentPage = 1;
	var data_table = bubble_Data();
	/*mypage_paging(id,currentPage);*/
	/*$('#example1').DataTable({
        ajax: data_table,
        columns: [
            { "Tourist destination": true },
            { "Grade": true },
            { "Category": true },
            { "Address": true },
            { "Bookmark": true },
            { "Recommend": true },
            { "First trip": true },
            { "Date modified": true }  
        ]
    } );*/
	  /*  $('#example1').DataTable()
	    $('#example2').DataTable({
	      'paging'      : true,
	      'lengthChange': false,
	      'searching'   : false,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false
	    });*/
	var donut_CountData = chart_BubbleData();
	var bar_data = barChart_Data();
	//DONUT CHART
	var donut = new Morris.Donut({
	  element: 'sales-chart',
	  resize: true,
	  colors: ["#3c8dbc", "#f56954"],
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
})(jQuery);

function bubble_Data()
{
	$.ajax({
		url: "bubble_Data.wd",
		type: "post",
		success: function(bubdata){
			alert(bubdata);
			var s_data = JSON.parse(bubdata);
			var mypage = "";			
			
				for (var i=0; i < s_data.length; i++)
				{				
					mypage += "<tr class='mypage_list'>";					
					mypage += "<td class='mypage_title_span'>"+s_data[i].TITLE_REF+"</td>";
					mypage += "<td class='mypage_grade'>"
					mypage += "<div class='rateit bigstars'></div>"+s_data[i].GRADE_POINT+"</td>";
					mypage += "<td class='mypage category_span'>"+s_data[i].CAT2_NAME+"</td>";
					mypage += "<td class='mypage addr_span'>"+s_data[i].ADDR1+"</td>";
					if(s_data[i].BOOKMARK == "y")
					{
						mypage += "<td class='mypage bookmark'><span class='glyphicon glyphicon-star'></span></td>";
					}else{
						mypage += "<td class='mypage bookmark'><span class='glyphicon glyphicon-star'></td>";
					}
					if(s_data[i].PRE_RENCE == "y")
					{
						mypage += "<td class='mypage like'>♥</td>";
					}else{
						mypage += "<td class='mypage like'>○</td>";
					}
					if(s_data[i].FIRST_TRIP == 'y')
					{
						mypage += "<td class='mypage_firsttrip_span'>♠</td>";
					}else{
						mypage += "<td class='mypage_firsttrip_span'>♤</td>";
					}
					mypage += "<td class='mypage_day_span'>"+s_data[i].MODIFIED_DATE+"</td>";
					mypage += "</tr>"					
					
				}
			
			$("#mypage_list").append(mypage);
		}	
	});	
};

function mypage_paging(id, currentPage)
{
	$.ajax({
		url: "paging_mypage.wd",
		data: {"id":id, "currentPage":currentPage},
		type: "post",
		async: false,
		success: function(data){
			alert(data);
			var s_data = JSON.parse(data);
			
			var mypage = "";
			
			/*mypage += "<tr>";*/
			mypage += "<td>";			
			if(s_data[i].startPage > s_data[i].perBlock)
			{
				mypage += "<span class='glyphicon glyphicon-chevron-left'></span>";
			}
			for(var j = startPage; j <= endPage; j++)
			{
				mypage += "<button type='button' class='btn btn-success'>"+s_data[j].currentPage+"</button>";
				alert(s_data[j].currentPage);
			}
			/*if(s_data[i].totalCount > 0)
			{
				mypage += "<button type='button' class='btn btn-success'>"+i+"</button>";
			}*/
			
			if(s_data[i].endPage < s_data[i].totalPage)
			{
				mypage += "<span class='glyphicon glyphicon-chevron-right'></span>";
			}						
			mypage += "</td>";			
			/*mypage += "</tr>";*/
	
			$(mypage).insertAfter("#paging_my");
		}
	});
};
function barChart_Data(){
	var bar_str = Array();
	$.ajax({
		url: "barChartData.wd",
		async: false,
		type: "post",		
		success: function(data){
			var bar_data = JSON.parse(data);
			alert(data);
				for(var i = 0; i < bar_data.length; i++)
				{
					var mygrade = parseFloat(bar_data[i].MY_GRADE);
					var totalgrade = parseFloat(bar_data[i].TOTAL_GRADE);
					var Category = bar_data[i].CAT2_NAME;
					
					bar_str.push({"y":Category,"a":mygrade,"b":totalgrade});
				}
			/*	if(bar_data.length > 0){
			}else{
				bar_str.push({"y":"nodata","a":0,"b":0});
			}*/
			
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
			alert(data);
			var b_data = JSON.parse(data);
			
			for(var i = 0; i < b_data.length; i++)
			{
				var cat2_num = parseInt(b_data[i].C_CAT2);
				str.push({"label":b_data[i].CAT2_NAME, "value":cat2_num});				
			}
			console.log(str);
		}
	});
	return str;
};
