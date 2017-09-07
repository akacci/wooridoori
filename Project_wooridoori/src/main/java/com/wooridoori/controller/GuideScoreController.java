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

@Controller
public class GuideScoreController {
	@Autowired
	GuideScoreDAO gsDAO;
	@Autowired
	GuideDAO gDAO;
	@Autowired
	MemberDAO mDAO;
	
	@RequestMapping("guideRate.wd")
	@ResponseBody
	public int guideScoreInsert(String id,float score, String num){
		//data packaging
		GuideScoreDTO dto=new GuideScoreDTO();
		dto.setM_id(id);
		dto.setScore(score);
		dto.setGb_num(num);
		
		int isRate=gsDAO.guideIsRated(dto);
		if(isRate>0){
			gsDAO.guideScoreUpdate(dto);
			return 1;
		}
		else{
			gsDAO.guideScoreInsert(dto);	
			return 0;
		}
	}
		
	
}
