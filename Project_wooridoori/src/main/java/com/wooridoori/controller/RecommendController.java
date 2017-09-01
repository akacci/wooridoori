package com.wooridoori.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wooridoori.dto.AreaCodeDTO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
import com.wooridoori.dto.TourInquiryDTO;
import com.wooridoori.service.RecommendService;

@Controller
public class RecommendController {

	@Autowired
	RecommendService service;
	
	@RequestMapping("/recommend.wd")
	public String recommendTest(){		
		return "Recommend/Recommend";
	}
	
	@RequestMapping("text.wd")
	public String selectTourInquiry(Model model){
		List<TourInquiryDTO> list = service.selectTourInquiry();
		model.addAttribute("tourlist", list);
		return "Recommend/text";
	}
	
	/*@RequestMapping("/re_smenu.wd")
	public String recommend_SMenu(Model model){
		
		List<TourInquiryDTO> list = rservice.re_Test();
		List<ContentCodeDTO> contentcode_list = rservice.filter_main();
		
		model.addAttribute(list);
		model.addAttribute(contentcode_list);
		
		return "view/Recommend_H";
	}*/
	
	@RequestMapping(value="/re_body_area.wd", method=RequestMethod.POST)
	public void recommendBodyArea(Model model,
								 HttpServletResponse response){			
		response.setContentType("text/html;charset=UTF-8"); // 한글
		ObjectMapper mapper = new ObjectMapper();
		List<TourInquiryDTO> list = service.selectFirstRecommendArea();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/re_body_thema.wd", method=RequestMethod.POST)
	public void recommendBodyThema(Model model,
								 HttpServletResponse response){			
		response.setContentType("text/html;charset=UTF-8"); // 한글
		ObjectMapper mapper = new ObjectMapper();
		List<TourInquiryDTO> list = service.selectFirstRecommendThema();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectareacode.wd", method=RequestMethod.POST)
	public void selectAreaCode(Model model,
							   HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		List<AreaCodeDTO> list = service.selectAreaCode();

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectareacodeoftourlist.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectAreaCodeOfTourList(Model model,
										 @RequestParam(value="areacode[]") List<String> areacode,
							             HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		List<TourInquiryDTO> list = service.selectAreaCodeOfTourList(map);

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectcat2oftourlist.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectCat2OfTourlist(Model model,
										 @RequestParam(value="cat2[]") List<String> cat2,
							             HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat2", cat2);
		List<TourInquiryDTO> list = service.selectCat2OfTourlist(map);

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectcontentcodename.wd", method=RequestMethod.POST)
	public void selectContentCode(Model model,
							      HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		List<ContentCodeDTO> list = service.selectContentCodeName();

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="tourinquiry_one.wd", method=RequestMethod.POST)
	public void selectTourInquiryOne(Model model,
									   @RequestParam(value="contentid") String contentid,
									   HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		TourInquiryDTO tdto = service.selectTourInquiryOne(contentid);

		try {
			response.getWriter().print(mapper.writeValueAsString(tdto));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/select_data.wd", method=RequestMethod.POST)
	@ResponseBody
	public void select_data(@RequestParam Float grade_point, 
				@RequestParam char firsttrip, 
				@RequestParam char bookmark,
				@RequestParam String contentid,
				@RequestParam char pre_rence,
				ReferenceDTO refdto)
	{		
		String m_id = "admin";
		String age = "20";
		char solotrip = 'n';
		char grouptrip = 'n';
		/*session.setAttribute("m_id", "adimn");*/
		
		refdto.setSeq_member(1);
		refdto.setM_id(m_id);
		refdto.setContent_id(contentid);
		refdto.setAge(age);
		refdto.setFirsttrip(firsttrip);
		refdto.setBookmark(bookmark);
		refdto.setSolotrip(solotrip);
		refdto.setGrouptrip(grouptrip);
		refdto.setGrade_point(grade_point);		
		
		service.insertOrUpdateFirsttrip(refdto);
	}
	
}
