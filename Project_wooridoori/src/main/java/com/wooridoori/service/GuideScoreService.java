package com.wooridoori.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.GuideScoreDAO;
import com.wooridoori.dto.GuideScoreDTO;

@Service
public class GuideScoreService {
	@Autowired
	GuideScoreDAO gsDAO;
	
	public void guideScoreInsert(GuideScoreDTO dto){
		gsDAO.guideScoreInsert(dto);
	}
	
	public int guideIsRated(GuideScoreDTO dto){
		return gsDAO.guideIsRated(dto);
	}
}
