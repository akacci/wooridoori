/*
 * CONTENT_DETAIL.JS 
 */

$(function(){
	
	$(".content_detail .menu").click(function(){
		var find_info = $(this).parent().children(".info");
		find_info.toggle();
		if(find_info.css("display")=="none"){
			$(this).children("span").children("i").removeClass("fa fa-caret-up");
			$(this).children("span").children("i").addClass("fa fa-caret-down");
		}if(find_info.css("display")=="block"){
			$(this).children("span").children("i").removeClass("fa fa-caret-down");
			$(this).children("span").children("i").addClass("fa fa-caret-up");
		}
	});
});
function content_writer(data){
	basic_writer(data.contentid, data.contenttypeid);
	detail_writer(data.contentid, data.contenttypeid);
	weater_writer(data.x, data.y);
}
function basic_writer(contentid, contenttypeid){
	var contentId = contentid;
	var contentTypeId = contenttypeid;
	var key_data = "ohelTML%2FebWtWdtXdLCnZdIG7KRH8mN7N%2BwAiIv1%2BWmyR5RcCtksbUK3aYiYbsbTxrQ7BpvdMRRBBtiIVLaJZQ%3D%3D";
	var url_data = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key_data+"&contentId="+contentId+"&defaultYN=Y&mapinfoYN=Y&firstImageYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTesting";
	$.ajax({
		url:url_data,
		success:function(data){
			console.log("basic");
			console.log(data);
			var content = $(data).find("item");
			$(".basic_info").html(content.find("overview").text());
		}
	});
}
function detail_writer(contentid, contenttypeid){
	var contentId = contentid;
	var contentTypeId = contenttypeid;
	var key_data = "ohelTML%2FebWtWdtXdLCnZdIG7KRH8mN7N%2BwAiIv1%2BWmyR5RcCtksbUK3aYiYbsbTxrQ7BpvdMRRBBtiIVLaJZQ%3D%3D";
	var url_data = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+key_data+"&contentId="+contentId+"&contentTypeId="+contentTypeId+"&MobileOS=ETC&MobileApp=AppTesting";
	$.ajax({
		url:url_data,
		success:function(data){
			var content = $(data).find("item");
			var	TOURIST_ATTRACTION = 12;	//관광지
			var	CULTURE = 14;	//문화시설
			var	FESTIVAL = 15;	//행사.공연.축제
			var	TRAVELING_COURSE = 25;	//여행코스
			var	LEPORTS = 28;	//레포츠
			var	HOTAL = 32;	//숙박
			var	SHOPPING = 38;	//쇼핑
			var	RESTAURANT = 39;	//음식점
			var str = "";
			console.log("detail");
			console.log(data);
			
			if(contentTypeId==TOURIST_ATTRACTION){	//관광지
				if(content.find("infocenter").text().length != 0 && content.find("infocenter").text() != null){
					str += "<b>&nbsp&nbsp문의 및 안내</b><br>"+content.find("infocenter").text()+"<br><br>";
				}if(content.find("accomcount").text().length != 0 && content.find("accomcount").text() != null){
					str += "<b>&nbsp&nbsp수용인원</b> : "+content.find("aaccomcount").text()+"<br><br>";
				}if(content.find("usetime").text().length != 0 && content.find("usetime").text() != null){
					str += "<b>&nbsp&nbsp이용시간</b><br>"+content.find("usetime").text()+"<br><br>";
				}if(content.find("restdate").text().length != 0 && content.find("restdate").text() != null){
					str += "<b>&nbsp&nbsp쉬는날</b><br>"+content.find("restdate").text()+"<br><br>";
				}if(content.find("parking").text().length != 0 && content.find("parking").text() != null){
					str += "<b>&nbsp&nbsp주차시설</b><br>"+content.find("parking").text()+"<br><br>";
				}
	
				$(".detail_info").html(str);
			}else if(contentTypeId==CULTURE){	//문화시설
				if(content.find("infocenterculture").text().length != 0 && content.find("infocenterculture").text() != null){
					str += "<b>&nbsp&nbsp문의 및 안내</b><br>"+content.find("infocenterculture").text()+"<br><br>";
				}if(content.find("accomcountculture").text().length != 0 && content.find("accomcountculture").text() != null){
					str += "<b>&nbsp&nbsp수용인원</b> : "+content.find("accomcountculture").text()+"<br><br>";
				}if(content.find("parkingculture").text().length != 0 && content.find("parkingculture").text() != null){
					str += "<b>&nbsp&nbsp주차시설</b><br>"+content.find("parkingculture").text()+"<br><br>";
				}if(content.find("usefee").text().length != 0 && content.find("usefee").text() != null){
					str += "<b>&nbsp&nbsp이용요금</b><br>"+content.find("usefee").text()+"<br><br>";
				}if(content.find("usetimeculture").text().length != 0 && content.find("usetimeculture").text() != null){
					str += "<b>&nbsp&nbsp이용시간</b><br>"+content.find("usetimeculture").text()+"<br><br>";
				}if(content.find("parkingculture").text().length != 0 && content.find("parkingculture").text() != null){
					str += "<b>&nbsp&nbsp주차시설</b><br>"+content.find("parkingculture").text()+"<br><br>";
				}if(content.find("parkingfee").text().length != 0 && content.find("parkingfee").text() != null){
					str += "<b>&nbsp&nbsp주차요금</b><br>"+content.find("parkingfee").text()+"<br><br>";
				}
				
				$(".detail_info").html(str);
			}else if(contentTypeId==FESTIVAL){	//행사.공연.축제
				if(content.find("eventstartdate").text().length != 0 && content.find("eventstartdate").text() != null){
					str += "<b>&nbsp&nbsp시작일</b><br>"+content.find("eventstartdate").text()+"<br><br>";
				}if(content.find("eventenddate").text().length != 0 && content.find("eventenddate").text() != null){
					str += "<b>&nbsp&nbsp종료일</b><br>"+content.find("eventenddate").text()+"<br><br>";
				}if(content.find("playtime").text().length != 0 && content.find("playtime").text() != null){
					str += "<b>&nbsp&nbsp공연시간</b><br>"+content.find("playtime").text()+"<br><br>";
				}if(content.find("usetimefestival").text().length != 0 && content.find("usetimefestival").text() != null){
					str += "<b>&nbsp&nbsp이용요금</b><br>"+content.find("usetimefestival").text()+"<br><br>";
				}if(content.find("program").text().length != 0 && content.find("program").text() != null){
					str += "<b>&nbsp&nbsp프로그램</b><br>"+content.find("program").text()+"<br><br>";
				}if(content.find("subevent").text().length != 0 && content.find("subevent").text() != null){
					str += "<b>&nbsp&nbsp부대행사</b><br>"+content.find("subevent").text()+"<br><br>";
				}if(content.find("eventplace").text().length != 0 && content.find("eventplace").text() != null){
					str += "<b>&nbsp&nbsp장소</b><br>"+content.find("eventplace").text()+"<br><br>";
				}if(content.find("placeinfo").text().length != 0 && content.find("placeinfo").text() != null){
					str += "<b>&nbsp&nbsp장소정보</b><br>"+content.find("placeinfo").text()+"<br><br>";
				}
				
				$(".detail_info").html(str);
			}else if(contentTypeId==TRAVELING_COURSE){	//여행코스
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==LEPORTS){	//레포츠
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==HOTAL){		//숙박
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==SHOPPING){	//쇼핑
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==RESTAURANT){//음식점
				
				
				$(".detail_info").html(str);
			}
		}
	});
}
function weater_writer(x, y){
	var longitude = x;
	var latitude = y;
	var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat="+latitude+"&lon="+longitude+"&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7069";
	$.ajax({
		/*http://apis.skplanetx.com/weather/current/minutely?version=1&lat=1&lon=1&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7069,32235c48-92ac-3a82-bf93-7fbee73f7061 */
		url:Wurl,
		type:"GET",
		dataType:"JSON",
		cache:false,
		success:function(data){
			var result = data.result.message;
			var city= data.weather.minutely[0].station.name;
			var weather= data.weather.minutely[0].sky.name;
			$(".content_detail .weather").text(city+"의 날씨는 ["+weather+"] 입니다.");
					
		},complete : function(data) {
			//alert("complete");
	    },error : function(xhr, status, error) {
			//alert("error"+error);
		}
	});
}