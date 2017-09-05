(function ($) {
	var id = "admin";
	bubble_Data(id);
	var donut_CountData = chart_BubbleData(id);
	var bar_data = barChart_Data(id);
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

function bubble_Data(id)
{
	$.ajax({
		url: "bubble_Data.wd",
		data: {"id":id},
		type: "post",
		success: function(bubdata){
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
				}else if(s_data[i].BOOKMARK !="y")
				{
					mypage += "<td class='mypage bookmark'><span class='glyphicon glyphicon-star'></td>";
				}
				if(s_data[i].PRE_RENCE == "y")
				{
					mypage += "<td class='mypage like'>♥</td>";
				}else if(s_data[i].PRE_RENCE != "y")
				{
					mypage += "<td class='mypage like'>○</td>";
				}
				if(s_data[i].FIRST_TRIP == 'y')
				{
					mypage += "<td class='mypage_firsttrip_span'>♠</td>";
				}else if(s_data[i].FIRST_TRIP != "y")
				{
					mypage += "<td class='mypage_firsttrip_span'>♤</td>";
				}
				mypage += "<td class='mypage_day_span'>"+s_data[i].MODIFIED_DATE+"</td>";
				mypage += "</tr>"
			}
			$("#mypage_list").append(mypage);
		}		
	});	
};
function barChart_Data(id){
	var bar_str = Array();
	$.ajax({
		url: "barChartData.wd",
		data: {"id":id},
		async: false,
		type: "post",		
		success: function(data){
			var bar_data = JSON.parse(data);
			for(var i = 0; i < bar_data.length; i++)
			{
				var mygrade = parseFloat(bar_data[i].MY_GRADE);
				var totalgrade = parseFloat(bar_data[i].TOTAL_GRADE);
				var Category = bar_data[i].CAT2_NAME;
				alert(Category);
				bar_str.push({"Y":Category,"a":mygrade,"b":totalgrade});
			}
			alert(bar_str);
		}
	});
	return bar_str;
};
function chart_BubbleData(id){
	var str = new Array();
	$.ajax({
		url: "chart_BubbleData.wd",
		data: {"id":id},
		async: false,
		type: "post",
		success: function(data){
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
