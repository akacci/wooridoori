(function ($) {
	var id = "admin";
	var currentPage = 1;
	var data_table = bubble_Data(id,currentPage);
	mypage_paging(id,currentPage);
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
	    $('#example1').DataTable()
	    $('#example2').DataTable({
	      'paging'      : true,
	      'lengthChange': false,
	      'searching'   : false,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false
	    });
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

function bubble_Data(id, currentPage)
{
	$.ajax({
		url: "bubble_Data.wd",
		data: {"id":id, "currentPage":currentPage},
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
						
			alert(s_data.startPage);
			
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
				
				bar_str.push({"Y":Category,"a":mygrade,"b":totalgrade});
			}
			
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
/*
var page = 1;                       //페이지 변수를 1로 초기화
var searchKey = '';                 //검색기능을 위해 검색 변수 초기화

$.ajax({
	type : 'POST',
	url : "bubble_Data.wd",
        dataType : "json",
        data : {
	        'page' : page,
	        'searchKeyword' : searchKey
	},
	success : function (result) {

		respone = result.lists;  //반환값중 데이터목록을 response변수에 삽입	       	

		paging = result.paging;  //페이징관련 데이터들을 paging변수에 삽입	       			    	

	       	$("데이터가 삽입될 객체 table").empty();    //데이터가 삽입될 객체를 비워준다. (들어가있던 전데이터들을 지워주기위해)

	       	if(respone.length == 0){                //가져온 데이터가 없으면 목록이 없다는 문구를 삽입.
	       		$("데이터가 삽입될 tbody").append("<td colspan=20 style='padding:30px;'>데이터가 없습니다.</td>");
	       	}else{                                    //데이터가있으면 목록을 each로 반복
	            _.each(respone, function(item){
			var contentHtml = _.template($('데이터가 삽입될 템플릿').html(), item );      //언더스코어를 이용 템플릿을 제작
			$("데이터가 삽입될 tbody").append(contentHtml);
	      });		
	       	} 	//이부분이 페이징처리
	        $(".pagination").empty();  //페이징에 필요한 객체내부를 비워준다.
	        	
	        if(paging.page != 1){            // 페이지가 1페이지 가아니면
	        	$(".pagination").append("<li class=\"goFirstPage\"><a><<</a></li>");        //첫페이지로가는버튼 활성화
	        }else{
	        	$(".pagination").append("<li class=\"disabled\"><a><<</a></li>");        //첫페이지로가는버튼 비활성화
	        }

	        if(paging.block != 1){            //첫번째 블럭이 아니면
	        	$(".pagination").append("<li class=\"goBackPage\"><a><</a></li>");        //뒤로가기버튼 활성화
	        }else{
	        	$(".pagination").append("<li class=\"disabled\"><a><</a></li>");        //뒤로가기버튼 비활성화
	        }
	        	
	        for(var i = paging.startPage ; i <= paging.endPage ; i++){        //시작페이지부터 종료페이지까지 반복문
	        	if(paging.page == i){                            //현재페이지가 반복중인 페이지와 같다면
	                	$(".pagination").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화
	        	}else{
	        		$(".pagination").append("<li class=\"goPage\" data-page=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
	        	}
	        }

	        if(paging.block < paging.totalBlock){            //전체페이지블럭수가 현재블럭수보다 작을때
	        	$(".pagination").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화
	        }else{
	        	$(".pagination").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화
	        }
  
          if(paging.page < paging.totalPage){                //현재페이지가 전체페이지보다 작을때
        		$(".pagination").append("<li class=\"goLastPage\"><a>>></a></li>");    //마지막페이지로 가기 버튼 활성화
        	}else{
        		$(".pagination").append("<li class=\"disabled\"><a>>></a></li>");        //마지막페이지로 가기 버튼 비활성화
        	}

//첫번째 페이지로 가기 버튼 이벤트
        	$(".goFirstPage").click(function(){
		       	page = 1;
		       	pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
	        });

//뒷페이지로 가기 버튼 이벤트
		$(".goBackPage").click(function(){
		      	page = Number(paging.startPage) - 1;
		       	pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
	        });

//클릭된 페이지로 가기 이벤트
		$(".goPage").click(function(){
			page = $(this).attr("data-page");
			pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
		});

//다음페이지로 가기 클릭이벤트
		$(".goNextPage").click(function(){
			page = Number(paging.endPage) + 1;
			pageFlag = 1;
		      	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
	        });

//마지막페이지로 가기 클릭이벤트
	        $(".goLastPage").click(function(){
	        	page = paging.totalPage;
	        	pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		      	pageFlag = 0;
	        });
	    }
    });*/
/*var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
    this.url = "";     
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.param = "";
     
    if(this.formId == "commonForm"){
        var frm = $("#commonForm");
        if(frm.length > 0){
            frm.remove();
        }
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.setCallback = function setCallback(callBack){
        fv_ajaxCallback = callBack;
    };
 
    this.addParam = function addParam(key,value){
        this.param = this.param + "&" + key + "=" + value;
    };
     
    this.ajax = function ajax(){
        if(this.formId != "commonForm"){
            this.param += "&" + $("#" + this.formId).serialize();
        }
        $.ajax({
            url : this.url,   
            type : "POST",  
            data : this.param,
            async : false,
            success : function(data, status) {
                if(typeof(fv_ajaxCallback) == "function"){
                    fv_ajaxCallback(data);
                }
                else {
                    eval(fv_ajaxCallback + "(data);");
                }
            }
        });
    };
}

divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름

var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
    var divId = params.divId; //페이징이 그려질 div id
    gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
    var totalCount = params.totalCount; //전체 조회 건수
    var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
    if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
        currentIndex = 1;
    }
     
    var recordCount = params.recordCount; //페이지당 레코드 수
    if(gfn_isNull(recordCount) == true){
        recordCount = 20;
    }
    var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
    gfv_eventName = params.eventName;
     
    $("#"+divId).empty();
    var preStr = "";
    var postStr = "";
    var str = "";
     
    var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
    var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
    var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1;
    var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
     
    if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
                "<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
    }
     
    if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
                    "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
     
    for(var i=first; i<(first+last); i++){
        if(i != currentIndex){
            str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
        }
        else{
            str += "<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>";
        }
    }
    $("#"+divId).append(preStr + str + postStr);
}
 
function _movePage(value){
    $("#"+gfv_pageIndex).val(value);
    if(typeof(gfv_eventName) == "function"){
        gfv_eventName(value);
    }
    else {
        eval(gfv_eventName + "(value);");
    }
}*/
