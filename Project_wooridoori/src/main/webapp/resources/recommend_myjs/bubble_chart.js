$(document).ready(function () {
	var bubble_CountData;
	var id = "admin";
	var bubble_D = bubble_Data(id);
	buble_CountData = chart_BubbleData(id);
	var bubbleChart = new d3.svg.BubbleChart({
    supportResponsive: true,
    //container: => use @default
    size: 600,
    //viewBoxSize: => use @default
    innerRadius: 600 / 3.5,
    //outerRadius: => use @default
    radiusMin: 50,
    //radiusMax: use @default
    //intersectDelta: use @default
    //intersectInc: use @default
    //circleColor: use @default
    
    data:{
      items: bubble_CountData,
      eval: function (item) {return item.count;},
      classed: function (item) {return item.text.split(" ").join("");}
    },
    plugins: [
      {
        name: "central-click",
        options: {
          text: "(See more detail)",
          style: {
            "font-size": "12px",
            "font-style": "italic",
            "font-family": "Source Sans Pro, sans-serif",
            //"font-weight": "700",
            "text-anchor": "middle",
            "fill": "white"
          },
          attr: {dy: "65px"},
          centralClick: function() {
            alert("Here is more details!!");
          }
        }
      },
      {
        name: "lines",
        options: {
          format: [
            {// Line #0
              textField: "count",
              classed: {count: true},
              style: {
                "font-size": "28px",
                "font-family": "Source Sans Pro, sans-serif",
                "text-anchor": "middle",
                fill: "white"
              },
              attr: {
                dy: "0px",
                x: function (d) {return d.cx;},
                y: function (d) {return d.cy;}
              }
            },
            {// Line #1
              textField: "text",
              classed: {text: true},
              style: {
                "font-size": "14px",
                "font-family": "Source Sans Pro, sans-serif",
                "text-anchor": "middle",
                fill: "white"
              },
              attr: {
                dy: "20px",
                x: function (d) {return d.cx;},
                y: function (d) {return d.cy;}
              }
            }
          ],
          centralFormat: [
            {// Line #0
              style: {"font-size": "50px"},
              attr: {}
            },
            {// Line #1
              style: {"font-size": "30px"},
              attr: {dy: "40px"}
            }
          ]
        }
      }]
  });
});

function bubble_Data(id)
{
	$.ajax({
		url: "bubble_Data.wd",
		data: {"id":id},
		type: "post",
		success: function(bubdata){
			var s_data = JSON.parse(bubdata);
			alert(bubdata);
			var mypage = "";
			for (var i=0; i < s_data.length; i++)
			{
				mypage += "<tr class='mypage_list'>";
				mypage += "<td class='mypage_title_span'>"+s_data[i].title_ref+"</td>";
				mypage += "<td class='mypage_grade'>"
				mypage += "<div class='rateit bigstars'></div>"+s_data[i].grade_point+"</td>";
				mypage += "<td class='mypage category_span'>"+s_data[i].category2+"</td>";
				mypage += "<td class='mypage addr_span'>"+s_data[i].contentid_ref+"</td>";
				if(s_data[i].bookmark == 'y')
				{
					mypage += "<td class='mypage bookmark'>★</td>";
				}else if(s_data[i].bookmark =='n')
				{
					mypage += "<td class='mypage bookmark'>☆</td>";
				}
				if(s_data[i].pre_rence == "y")
				{
					mypage += "<td class='mypage like'>♥</td>";
				}else if(s_data[i].pre_rence != "y")
				{
					mypage += "<td class='mypage like'>○</td>";
				}
				if(s_data[i].first_trip == 'y')
				{
					mypage += "<td class='mypage_firsttrip_span'>♠</td>";
				}else if(s_data[i].first_trip != "y")
				{
					mypage += "<td class='mypage_firsttrip_span'>♤</td>";
				}
				mypage += "<td class='mypage_day_span'>"+s_data[i].modified_date+"</td>";
				mypage += "</tr>"
			}
			$("#mypage_list").append(mypage);
		}		
	});	
}

function chart_BubbleData(id){
	var str = new Array();
	$.ajax({
		url: "chart_BubbleData.wd",
		data: {"id":id},
		async: false,
		type: "post",
		success: function(data){
			var b_data = JSON.parse(data);
			alert(b_data);
			for(var i = 0; i < b_data.length; i++)
			{
				str.push("{text:"+b_data[i].category2+","+"count:"+b_data[i].C_CAT2);
			}

		}
	});
	return str;
};