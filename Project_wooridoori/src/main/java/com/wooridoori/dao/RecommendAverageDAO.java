package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.RecommendAverageDTO;

public class RecommendAverageDAO extends SqlSessionDaoSupport {
	
	public List<RecommendAverageDTO> selectRecommendAverage(Map<String, Object> map){
		List<RecommendAverageDTO> list = getSqlSession().selectList("selectRecommendAverage", map);
		return list;
	}
	
	public String selectTotalReviewScore(String contentid){
		String total_score = getSqlSession().selectOne("selectTotalReviewScore", contentid);
		return total_score;
	}
	
	public void insertRecommendAverageReview(RecommendAverageDTO radto){
		getSqlSession().insert("insertRecommendAverageReview", radto);
	}
	
	public List<String> selectVisitYnList(String contentid, String visit_yn){
		Map<String, String> map = new HashMap<String, String>();
		map.put("contentid", contentid);
		map.put("visit_yn", visit_yn);
		
		List<String> list = getSqlSession().selectList("selectVisitYnList", map);
		
		return list;
	}
	
}
