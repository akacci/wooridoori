package com.wooridoori.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import com.wooridoori.dto.RecommendAverageDTO;
import com.wooridoori.service.RecommendAverageService;

@Controller
public class RecommendAverageController {

	@Autowired
	RecommendAverageService raService;
	
	@RequestMapping(value="todialogreview.wd", method=RequestMethod.POST)
	public void selectDialogReview(Model model,
						   @RequestParam("contentid") String contentid,
						   HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		
		List<RecommendAverageDTO> list = raService.selectRecommendAverage(contentid);
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="totalscore.wd", method=RequestMethod.POST)
	@ResponseBody
	public String selectTotalScore(@RequestParam("contentid") String contentid){
		String str = raService.selectTotalReviewScore(contentid);
		return str;
	}
	
	@RequestMapping(value="insertreview.wd", method=RequestMethod.POST)
	@ResponseBody
	public void insertDialogReview(Model model, @ModelAttribute RecommendAverageDTO radto){
		raService.insertRecommendAverageReview(radto);
	}
	
	@RequestMapping(value="visit_yn.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectVisitYnList(Model model,
								  @RequestParam("contentid") String contentid,
								  @RequestParam("visit_yn") String visit_yn,
			   					  HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		List<String> list = raService.selectVisitYnList(contentid, visit_yn);
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
