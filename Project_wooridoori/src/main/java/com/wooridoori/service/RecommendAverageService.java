package com.wooridoori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.RecommendAverageDAO;
import com.wooridoori.dto.RecommendAverageDTO;

@Service
public class RecommendAverageService {
	
	@Autowired
	RecommendAverageDAO radao;
	
	public List<RecommendAverageDTO> selectRecommendAverage(String contentid){
		List<RecommendAverageDTO> list = radao.selectRecommendAverage(contentid);
		return list;
	}
	
	public String selectTotalReviewScore(String contentid){
		String total_score = radao.selectTotalReviewScore(contentid);
		return total_score;
	}
	
	public void insertRecommendAverageReview(RecommendAverageDTO radto){
		radao.insertRecommendAverageReview(radto);
	}
	
	public List<String> selectVisitYnList(String contentid, String visit_yn){
		List<String> list = radao.selectVisitYnList(contentid, visit_yn);
		return list;
	}

}
