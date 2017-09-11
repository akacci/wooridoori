package com.wooridoori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooridoori.dao.GuideDAO;
import com.wooridoori.dao.GuideScoreDAO;
import com.wooridoori.dao.MemberDAO;
import com.wooridoori.dto.GuideScoreDTO;
import com.wooridoori.service.GuideScoreService;
import com.wooridoori.service.GuideService;

@Controller
public class GuideScoreController {
	@Autowired
	GuideScoreService gsService;
	@Autowired
	GuideService gService;
	
	@RequestMapping("guideRate.wd")
	@ResponseBody
	public int guideScoreInsert(String id,float score, String num){
		//data packaging
		GuideScoreDTO dto=new GuideScoreDTO();
		dto.setM_id(id);
		dto.setScore(score);
		dto.setGb_num(num);
		
	
		int isRate=gsService.guideIsRated(dto);	
		if(isRate>0){													//Guide re-rating
			gsService.guideScoreUpdate(dto);					//User rate to guide
			float rate=gsService.guideScoreAverage(num);		//Rate of target guide
			dto.setScore(rate);
			gsService.guideRate(dto);							//Guide rate insert
			return 1;
		}
		else{
			gsService.guideScoreInsert(dto);						//Guide rating
			float rate=gsService.guideScoreAverage(num);	
			gsService.guideRate(dto);
			return 0;
		}
	}
		
	
}
