<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var slideIndex= Math.floor(Math.random()*17+1);
	var imageUrl="";
	var message_title="";
	var message="";
	var detail_url="";
	var b=false;
	
	
	function ChangeImage(){
			
		switch(slideIndex)
		{
			case 1:
				imageUrl="url('resources/image/main/background/강원도_양떼목장.jpg')";
				message_title="강원도 양떼목장";
				message="아름다운 능선과 맑은 공기를 자랑하는 대관령에 위치한 목장으로 여름에는 초록빛 목초지, 겨울에는 환상적인 설경을 자랑하는 대한민국의 대표 힐링 장소입니다.";
				detail_url="detail.wd?contentid=129263&areaname=강원도&sigungu=평창군";
				break;
			case 2:
				imageUrl="url('resources/image/main/background/경기도_수원화성.jpg')";
				message_title="경기도 수원화성";
				message="수원 화성은 경기도 수원시 팔달구와 장안구에 걸쳐 있는 길이 5.52킬로미터의 성곽으로, 1997년 유네스코 세계문화유산으로 등록되었습니다.";
				detail_url="detail.wd?contentid=1921150&areaname=경기도&sigungu=수원시";
				break;
			case 3:
				imageUrl="url('resources/image/main/background/경남_거제도.jpg')";
				message_title="경상남도 거제도";
				message="거제도는 경상남도 거제시의 주도로, 대한민국에서 2번째로 큰 섬입니다.";
				detail_url="detail.wd?contentid=126972&areaname=경상남도&sigungu=거제시";
				break;
			case 4:
				imageUrl="url('resources/image/main/background/경북_하회마을.jpg')";
				message_title="경상북도 하회마을";
				message="우리나라 전통적인 유교문화가 살아 숨쉬고있는 가장 한국적이며 독창적인 문화를 간직한 마을로서 민속적 전통과 건축물을 잘 보존한 씨족마을로, 2010년 유네스코 세계문화유산으로 등재되었습니다.";
				detail_url="detail.wd?contentid=894027&areaname=경상북도&sigungu=안동시";
				break;
			case 5:
				imageUrl="url('resources/image/main/background/광주_무등산.jpg')";
				message_title="광주 무등산";
				message="광주 북구와 화순군, 담양군을 경계에 두고 있는 무등산은 여러 코스로 오를 수 있는 등산로가 있어 다양한 모습의 산을 감상할 수 있으며, 수려한 산세로 사계절 내내 찾는 이들의 발길이 끊이지 않고 있습니다.";
				detail_url="detail.wd?contentid=1074432&areaname=광주광역시&sigungu=동구";
				break;
			case 6:
				imageUrl="url('resources/image/main/background/대구_83타워.jpg')";
				message_title="대구 83타워";
				message="83타워는 타워 꼭대기가 83층에 해당하여 이름 붙여졌으며, 일대에 종합 테마 공원을 조성하여 1995년에 오픈했습니다.";
				detail_url="detail.wd?contentid=1614282&areaname=대구광역시&sigungu=달서구";
				break;
			case 7:
				imageUrl="url('resources/image/main/background/대전_국립중앙과학관.jpg')";
				message_title="대전 국립중앙과학관";
				message="별자리와 태양이야기를 전시해 놓은 국립중앙과학관의 천체관, 다양한 우주의 이야기를 눈으로 보고 귀로 들으며 학습할 수 있는 흥미로운 곳!";
				detail_url="detail.wd?contentid=129785&areaname=대전광역시&sigungu=유성구";
				break;
			case 8:
				imageUrl="url('resources/image/main/background/부산_해운대.jpg')";
				message_title="부산 해운대";
				message="해운대해수욕장은 젊음의 상징이며 여름철 휴가 때면 관광객들로 발길로 끊이질 않는 곳입니다. 매년 모래축제가 열리는 등 다양한 체험을 할 수 있고, 시원한 바다도 맘껏 즐길 수 있습니다.";
				detail_url="detail.wd?contentid=995455&areaname=부산광역시&sigungu=해운대구";
				break;
			case 9:
				imageUrl="url('resources/image/main/background/서울_숭례문.jpg')";
				message_title="서울 숭례문";
				message="조선시대의 항성 도성 4대문으로 남대문으로도 불리는 숭례문 야경은 도심과 어우러져 감탄을 자아내고 있습니다. 교통의 중심지에 위치해있어서 지나가는 사람들의 눈길을 사로잡는 궁궐입니다.";
				detail_url="detail.wd?contentid=128162&areaname=서울특별시&sigungu=중구";
				break;
			case 10:
				imageUrl="url('resources/image/main/background/세종_호수공원.jpg')";
				message_title="세종 호수공원";
				message="세종특별시에 위치하고 있는 세종호수공원은 다양한 테마의 섬들이 있어 호수공원을 찾는 시민들에게 볼거리를 선사하는 공원입니다.";
				detail_url="detail.wd?contentid=1946955&areaname=세종특별자치시&sigungu=연기면";
				break;
			case 11:
				imageUrl="url('resources/image/main/background/송도_한옥마을.jpg')";
				message_title="송도 한옥마을";
				message="인천 연수구에 있는 송도한옥마을은 송도신도시에 위치해있는데, 전통적인 멋과 현대적인 멋이 어우러져 색다른 한옥마을의 느낌이 드는 곳입니다.";
				detail_url="";
				break;
			case 12:
				imageUrl="url('resources/image/main/background/울산_간절곶.jpg')";
				message_title="울산 간절곶";
				message="간절곶은 대한민국에서 해가 가장 먼저 뜨는 곳으로, 새 천년 밀레니엄 첫 해돋이로 유명한 곳입니다. 매년 새해맞이 축제가 진행되며, 새 천년 기념비와 조각공원 등이 조성되어 있어 많은 사람들의 발길이 끊이질 않고 있습니다.";
				detail_url="detail.wd?contentid=128022&areaname=울산광역시&sigungu=울주군";
				break;
			case 13:
				imageUrl="url('resources/image/main/background/전남_죽녹원.jpg')";
				message_title="담양 죽녹원";
				message="전라남도 담양 성인산 일대에 위치해있는 울창한 대나무 숲인 담양 죽녹원에는 8가지의 테마로 조성된 산책로가 있으며, 전망대는 메타세콰이아 가로수길이 한눈에 내려다보이는 장관을 이루고 있습니다.";
				detail_url="detail.wd?contentid=128834&areaname=전라남도&sigungu=담양군";
				break;
			case 14:
				imageUrl="url('resources/image/main/background/전북_한옥마을.jpg')";
				message_title="전주 한옥마을";
				message="전주한옥마을은 수많은 한옥마을 중 가장 인기 있는 곳으로 최근 몇년 사이에 꼭 가야할 관광명소로 급부상한 곳입니다. 한옥으로 지어진 멋스러운 게스트하우스나 이곳저곳 다양하게 판매하고 있는 먹거리로 남녀노소 누구에게나 인기가 높습니다.";
				detail_url="detail.wd?contentid=264284&areaname=전라북도&sigungu=전주시";
				break;
			case 15:
				imageUrl="url('resources/image/main/background/제주도_한라산.jpg')";
				message_title="제주도 한라산";
				message="세계 자연유산으로 선정된 우리나라를 대표하는 명산인 제주도의 한라산은 사계절 내내 아름다움을 뽐내며, 특히 겨울에 펼쳐지는 설경은 신이 내린 선물이라 할 정도로 환상적인 경관을 자랑해 많은 분들이 찾는 한국을 대표하는 관광지입니다.";
				detail_url="";
				break;
			case 16:
				imageUrl="url('resources/image/main/background/충남_독립기념관.jpg')";
				message_title="충청남도 독립기념관";
				message="충청남도 천안에 위치해있는 독립기념관에는 가을의 아름다움을 만끽할 수 있는 단풍나무길이 조성되어 있습니다. 알록달록 곱게 물든 단풍나무 사이로 가족, 연인, 친구와 함께 걸으며 좋은 추억 만드시길 바랍니다.";
				detail_url="detail.wd?contentid=129790&areaname=충청남도&sigungu=천안시";
				break;
			case 17:
				imageUrl="url('resources/image/main/background/충북_고수동굴.jpg')";
				message_title="충청북도 고수동굴";
				message="단양 고수동굴은 충청북도 단양군 단양읍 고수리에 있는 석회암 동굴입니다. 지하수가 많이 흘러들어 다양한 형태의 종유석과 석순이 잘 발달되어 있으며 지하궁전을 연상케 하는 장년기의 동굴 지형을 이루고 있습니다.";
				detail_url="detail.wd?contentid=125861&areaname=충청북도&sigungu=단양군";
				break;
			
		}
		$(".bgimg").css("background-image",imageUrl);
		$("#message").text(message_title+"\n"+message);
		$("#message").html("<b style='font-size:15pt;'>"+message_title+"</b><br>"+message);
	} 
	
	$(function(){
		ChangeImage();
		$("#message_box").hide();
		
		$("#btn_next").click(function(){
			if(slideIndex<17)
				{
					slideIndex++;
				}
			else
				{
					slideIndex=17;
				}
			ChangeImage();
		});
		
		$("#btn_prev").click(function(){
			if(slideIndex>1)
				{
					slideIndex--;
				}
			else
				{
					slideIndex=1;
				}
			ChangeImage();
		});
		
		$("#btn_next").mouseenter(function(){
			$("#message_box").fadeIn();
			b=true;
		});
		
		$("#btn_prev").mouseenter(function(){
			$("#message_box").fadeIn();
			b=true;
		});
		
		$("#message_box").mouseenter(function(){
			if(b)
			{
				$("#message_box").show();
			}
		}).mouseleave(function(){
			$("#message_box").hide();
			b=false;
		});
		
		$("#message_box").click(function(){
			location.href=detail_url;
		});
	});
</script>

<style>
body,html{width: 100%;height: 100%;}
.bgimg {
    min-height: 90%;
    width : 100%;
    background-position: center;
    background-size: cover;
    animation: opac 0.8s;
}
.bgimg2 {
	min-height: 100%;
    background-position: center;
    background-size: cover;
    animation: opac 0.8s;
    background-color: white;
}
.wfooter:hover{
	color: #c0c0c0 !important;
	text-decoration: underline;
}
</style>
</head>
<body>
<header>
		<%@ include file="./top.jsp"%>
</header>
<!-- Home화면 에서만 배경화면을 출력하기 위해 클래스명을 value값으로 변수a를 선언함.  -->
<c:if test="${wbody_url eq '/wbody.wd'}">
	<c:set var="a" value="bgimg"></c:set>
	<c:set var="btn_visible" value="visible"></c:set>
	<c:set var="b" value=""></c:set>
</c:if>

<c:if test="${wbody_url != '/wbody.wd'}">
	<c:set var="a" value="bgimg2"></c:set>
	<c:set var="btn_visible" value="hidden"></c:set>
	<c:set var="b" value="background-color: gray"></c:set>
</c:if>

<div class="${a} w3-display-container w3-text-white">
  <div class="w3-display-middle" style="width: 100%; height:100%;overflow:auto ;">
	<c:import url="${wbody_url}"></c:import> 
	
    <!-- <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center">35 days left</p> -->
    
  </div>
  <div id="message_box" class="fixed_box w3-container w3-black2" style="white-space: pre-line; word-break:break-all; padding-top: 5px; cursor: pointer;"><span id="message"></span>
  </div>
  
	 
</div>
<button class="fixed_btn_left" style="visibility:${btn_visible}; background-color: rgba(0,0,0,0.5); color: #fff; border:0; outline:0; cursor: pointer"
	id="btn_prev">&lt;</button>
	<button class="fixed_btn_right" style="visibility:${btn_visible}; background-color: rgba(0,0,0,0.5); color: #fff; border:0; outline:0; cursor: pointer;
	margin-left: 41px" id="btn_next">&gt;</button>
<footer>
	<%@ include file="./wfooter.jsp"%>
</footer>
</body>
</html>