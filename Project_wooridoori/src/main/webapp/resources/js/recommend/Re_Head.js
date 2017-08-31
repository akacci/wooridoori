var areaOfList = new Array();
var cat2OfList = new Array();

$(function(){
	
	var areaName = menuAreaName();
	var themaName = menuThemaName();
	
	$(".span_aTag_Controller").click(function(){
		var n = $(this).attr("name");
		if(n=="_1"){
			$("#list_theme").hide();
			$("#list_classification").toggle();	
		}else if(n=="_2"){
			$("#list_classification").hide();
			$("#list_theme").toggle();
		}				
	});
		
	$(document).on("mouseover", ".filter_item", function(){
		var idx_filter = $(this).index();
		var _f = $("._filter_tag").attr("name");
		
		if(_f!="_tag"){
			$(this).append($("<span class='_tag'> ◁</span>"));	
		}
		
		var areaCode;
		var themaCode;
		
		$(this).unbind("click").bind("click",function(){	
			var v = $(this).attr("val");
			var n = $(this).attr("name");
			var menu_division = $(this).attr("division");
			var tmp;
			
			/*menu area, thema 구분*/
			if(menu_division == "area"){			
				for(var i = 0; i < areaName.length; i++){
					if(i==n){
						tmp = areaName[i];
					}
				}
			}else{
				for(var i = 0; i < themaName.length; i++){
					if(i==n){
						tmp = themaName[i];
					}
				}
			}
			
			/*append class _filter_tag _tag_a*/
			if(v == "n"){
				var html = "<span class='_filter_tag' name='_tag' index='"+n+"'>#"+tmp+"<span class='filter_tag_exit'>x</span></span>";
				$("#View").append(html);
				$(this).append($("<span class='_tag_a'> ◀</span>"));
				$(this).attr("val","y");
				
				/*menu에서 지역 클릭시 select list*/
				if(menu_division == "area" && (areaCode != "undefined" || areaCode != "")){
					areaCode = $(this).attr("code");
					selectAreaCodeOfTourList(areaCode);
				}
				
				if(menu_division == "thema" && (themaCode != "undefined" || themaCode != "")){
					themaCode = $(this).attr("code");
					selectCat2OfTourList(themaCode);
				}
			}
			
			/*remove class ._filter_tag,._tag_a */
			if(v == "y"){
				var tagIndex = $("#View").find("._filter_tag").length;
				
				for(var i = 0; i < tagIndex; i++){
					var val_filter_tag = $("._filter_tag").eq(i).attr("index");
					if(n==val_filter_tag){
						$("#View").find("._filter_tag").eq(i).remove();
					}
				}
				
				if(menu_division == "area"){
					firstAreaData();
					areaOfList = new Array();
				}
				if(menu_division == "thema"){
					firstThemaData();
					cat2OfList = new Array();
				}
				
				$(this).find("._tag_a").remove();
				$(this).attr("val","n");
			}
			
			$("#list_classification").hide();
			$("#list_theme").hide();
		});				
	}).on("mouseout", function(){
		$(this).find("._tag").remove();
	});	
	
	$(".filter_tag_exit").click(function(){
		$(this).find("._tag_a").remove();
		$(this).attr("val","n");
	});
	
});

/*menu area code*/
function menuAreaName(){
	var str = new Array();
	
	$.ajax({
		url: "selectareacode.wd",
		type: "post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html = "<ul id = 'list_classification' class='filter_item_list_classification'>";
			for(var i = 0; i < data.length; i++){
				html += "<li class='filter_item' division='area' name='"+i+"' val='n' code='"+data[i].areacode+"'>"+data[i].areaname+"</li>";
				str.push(data[i].areaname); 
			}
			html += "</ul>";
			
			$("#area_ul").html(html);
			$("#list_classification").hide();
		}
	});
	
	return str;
}

/*menu thema name*/
function menuThemaName(){
	var str = new Array();
		
	$.ajax({
		url: "selectcontentcodename.wd",
		type: "post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html = "<ul id='list_theme' class='filter_item_list_theme'>";
			for(var i = 0; i < data.length; i++){
				html += "<li class='filter_item' division='thema' name='"+i+"' val='n' code='"+data[i].cat2+"'>"+data[i].cat2_name+"</li>";
				str.push(data[i].cat2_name);
			}
			html += "</ul>";
			
			$("#content_ul").html(html);
			$("#list_theme").hide();
		}
	});
		
	return str;
}

/*menu에서 지역 클릭시 select list*/
function selectAreaCodeOfTourList(areacode){
	areaOfList.push(areacode);
	var dataList = {"areacode": areaOfList};
	$.ajax({
		url: "selectareacodeoftourlist.wd",
		type: "post",
		data: dataList,
		success:function(resData){
			var data = JSON.parse(resData);

			for(var i = 0; i < data.length; i++){
				$("#area #contentid").eq(i).val(data[i].contentid);
				$("#area .select_img").eq(i).attr("src", data[i].firstimage);
				$("#area .tour_title").eq(i).text(data[i].title + " " + data[i].addr2);
			}
		}
	});
}

/*메뉴에서 테마 클릭시 select list */
function selectCat2OfTourList(cat2){
	cat2OfList.push(cat2);
	var dataList = {"cat2": cat2OfList};
	$.ajax({
		url: "selectcat2oftourlist.wd",
		type: "post",
		data: dataList,
		success:function(resData){
			var data = JSON.parse(resData);

			for(var i = 0; i < data.length; i++){
				$("#thema #contentid").eq(i).val(data[i].contentid);
				$("#thema .select_img").eq(i).attr("src", data[i].firstimage);
				$("#thema .tour_title").eq(i).text(data[i].title + " " + data[i].addr2);
			}
		}
	});
}