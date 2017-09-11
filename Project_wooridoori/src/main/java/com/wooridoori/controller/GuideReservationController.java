package com.wooridoori.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wooridoori.dto.GuideReservationDTO;
import com.wooridoori.service.GuideReservationService;

@Controller
public class GuideReservationController {
	@Autowired
	GuideReservationService grService;
	
	@RequestMapping(value="selectloginuserdata.wd", method=RequestMethod.POST)
	@ResponseBody
	public void SelectLoginUserData(HttpSession session,
									HttpServletResponse response){
		String sessionId = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		sessionId = "bonobono";
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> map = new HashMap<String, String>();
		
		if(!sessionId.equals("GUEST")){
			map = grService.SelectLoginUserData(sessionId); 
		}
		
		try {
			response.getWriter().print(mapper.writeValueAsString(map));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="insertguidereservation.wd", method=RequestMethod.POST)
	@ResponseBody
	public void insertGuideReservation(@ModelAttribute GuideReservationDTO grdto){
		grService.insertGuideReservation(grdto);
	}
	
	//가이드 예약 확인
	@RequestMapping("selectRequestList.wd")
	public String ㄴelectRequestList(Model model, HttpSession session ,
									@RequestParam(value="pageNum", defaultValue="1") int currentPage){
		System.out.println("get in");
		int totalCount = grService.selectGuideTotalReservation((String)session.getAttribute("id")); //총 글의 갯수
		//페이징 처리에 필요한 변수
		int perPage = 15; // : 한 페이지당 보여지는 글의 갯수
		int perBlock = 5; // : 한 블럭 당 보여지는 페이지 번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum; // 한 페이지당 보여지는 시작번호
		int endNum; // 한 페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작 페이지 번호
		int endPage; // 한 블럭당 보여지는 끝 페이지 번호
		int no; // 게시글에 붙일 시작번호
		
		//총 페이지수
		totalPage = (totalCount/perPage) + (totalCount%perPage>0?1:0);
		
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum = (currentPage-1)*perPage + 1;
		endNum = (perPage + startNum) - 1;
		//예를 들어 모두 45개의 글이 있을 경우 마지막 페이지는 endnum이 45가 되어야함
		if(endNum > totalCount) endNum = totalCount; 
		
		//각 블럭에 보여질 시작 페이지 번호와 끝 페이지 번호 구하기
		startPage = (((currentPage-1)/perBlock)*perBlock) + 1;
		endPage = (startPage+perBlock) - 1;
		//예를 들어 총 34페이지일 경우 마지막 블럭은 30-34만 보여야한다
		if(endPage > totalPage) endPage = totalPage;
		
		//각 글에 보여질 번호 구하기(총 100개라면 100부터 출력)
		no = totalCount - ((currentPage - 1)*perPage);

		List<GuideReservationDTO> list = grService.selectGuideReservationList((String)session.getAttribute("id"),startNum, endNum);
		
		model.addAttribute("reservation_list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("no", no);
		return "Guide/GuideRequest_List";
	}
	//예약 리스트
	@RequestMapping("guideReservationList.wd")
	public String selectReservationList(Model model,HttpSession session ,
										@RequestParam(value="pageNum", defaultValue="1") int currentPage){
		System.out.println("get in");
		int totalCount = grService.selectTotalReservation((String)session.getAttribute("id")); //총 글의 갯수
		//페이징 처리에 필요한 변수
		int perPage = 15; // : 한 페이지당 보여지는 글의 갯수
		int perBlock = 5; // : 한 블럭 당 보여지는 페이지 번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum; // 한 페이지당 보여지는 시작번호
		int endNum; // 한 페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작 페이지 번호
		int endPage; // 한 블럭당 보여지는 끝 페이지 번호
		int no; // 게시글에 붙일 시작번호
		
		//총 페이지수
		totalPage = (totalCount/perPage) + (totalCount%perPage>0?1:0);
		
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum = (currentPage-1)*perPage + 1;
		endNum = (perPage + startNum) - 1;
		//예를 들어 모두 45개의 글이 있을 경우 마지막 페이지는 endnum이 45가 되어야함
		if(endNum > totalCount) endNum = totalCount; 
		
		//각 블럭에 보여질 시작 페이지 번호와 끝 페이지 번호 구하기
		startPage = (((currentPage-1)/perBlock)*perBlock) + 1;
		endPage = (startPage+perBlock) - 1;
		//예를 들어 총 34페이지일 경우 마지막 블럭은 30-34만 보여야한다
		if(endPage > totalPage) endPage = totalPage;
		
		//각 글에 보여질 번호 구하기(총 100개라면 100부터 출력)
		no = totalCount - ((currentPage - 1)*perPage);

		List<GuideReservationDTO> list = grService.selectReservationList((String)session.getAttribute("id"),startNum, endNum);
		
		model.addAttribute("reservation_list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("no", no);
		return "Guide/Reservation_List";
	}
		
		//전체 예약 리스트 카운트
		@RequestMapping("selecttotalreservation.wd")
		@ResponseBody
		public int selectTotalReservation(HttpSession session){
			int cnt = grService.selectTotalReservation((String)session.getAttribute("id"));
			return cnt;
		}
	
	
	
	
	
}
