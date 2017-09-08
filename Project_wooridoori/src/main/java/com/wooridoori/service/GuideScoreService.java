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
	public void guideScoreUpdate(GuideScoreDTO dto){
		gsDAO.guideScoreUpdate(dto);
	}
	public float guideScoreAverage(String num){
		return gsDAO.guideScoreAverage(Integer.parseInt(num));
	}
	public void guideRate(GuideScoreDTO dto){
		gsDAO.guideRate(dto);
	}
	public String guideRateCount(int num){
		return gsDAO.guideRateCount(num);
	}
}
