package com.wooridoori.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
import com.wooridoori.dto.TourInquiryDTO;
import com.wooridoori.service.RecommendFavoriteSurveyService;
import com.wooridoori.service.RecommendService;

@Controller
public class RecommendFavoriteSurveyController {
	
	@Autowired
	RecommendFavoriteSurveyService rfsService;
		
	@RequestMapping(value="favoritesessionlogin.wd", method=RequestMethod.POST)
	@ResponseBody
	public String sessionLogin(HttpSession session){
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		String str = login + "," + id;

		return str;
	}
	
	@RequestMapping(value="selectstaycode.wd", method=RequestMethod.POST)
	public void selectStayCode(HttpServletResponse response, HttpSession session){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();		
		
		List<ContentCodeDTO> list = rfsService.selectStayCode();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectpreferenceofarea.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectPreferenceOfArea(HttpServletResponse response,
									   HttpSession session){
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		
		List<TourInquiryDTO> list = rfsService.selectPreferenceOfArea(id);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectpreferenceofpurpose.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectPreferenceOfPurpose(HttpServletResponse response,
									   HttpSession session){
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		
		List<TourInquiryDTO> list = rfsService.selectPreferenceOfPurpose(id);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectpreferenceofstay.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectPreferenceOfStay(HttpServletResponse response,
									   HttpSession session){
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		
		List<TourInquiryDTO> list = rfsService.selectPreferenceOfStay(id);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectupdatepreference.wd", method=RequestMethod.POST)
	public void updatePreference(@RequestParam(value="areacode") String areacode,
								@RequestParam(value="age") String age,
								@RequestParam(value="purpose") String purpose,
								@RequestParam(value="person") String person,
								@RequestParam(value="stay") String stay,
								HttpSession session){
		
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		Map<String, String> map = new HashMap<String, String>();
		
		int totcnt = rfsService.totalCountPreference(id);		
		if(login.equals("YES")){
			if(totcnt > 0){
				map.put("m_id", id);
				map.put("areacode", areacode);
				map.put("age", age);
				map.put("grouptrip", person);
				map.put("purpose_code", purpose);
				map.put("stay_code", stay);
				
				rfsService.updatePreference(map);
			}else{
				map.put("error", "insert_error");
			}
		}
	}
	
	@RequestMapping("selecttotalcountpreference.wd")
	@ResponseBody
	public int selectTotalCountPreference(@RequestParam String id){
		int totalCnt = rfsService.totalCountPreference(id);
		System.out.println("totalCnt --------------------- "+totalCnt);
		System.out.println("id ---------------------------- "+id);
		return totalCnt;
	}

}
