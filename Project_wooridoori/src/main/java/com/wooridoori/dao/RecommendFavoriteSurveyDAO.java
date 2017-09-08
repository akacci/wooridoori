package com.wooridoori.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
import com.wooridoori.dto.TourInquiryDTO;

public class RecommendFavoriteSurveyDAO extends SqlSessionDaoSupport {
	
	public List<ContentCodeDTO> selectStayCode(){
		List<ContentCodeDTO> list = getSqlSession().selectList("selectStayCode");
		return list;
	}
	
	public Map<String, String> selectCat2OfSurvey(String id){
		Map<String, String> map = getSqlSession().selectOne("selectCat2OfSurvey", id);
		return map;
	}
	
	public List<TourInquiryDTO> selectPreferenceOfArea(Map<String, String> cat){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectPreferenceOfArea", cat);
		return list;
	}
	
	public List<TourInquiryDTO> selectPreferenceOfPurpose(Map<String, String> cat){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectPreferenceOfPurpose", cat);
		return list;
	}
	
	public List<TourInquiryDTO> selectPreferenceOfStay(Map<String, String> cat){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectPreferenceOfStay", cat);
		return list;
	}
	
	public void updatePreference(Map<String, String> map){
		getSqlSession().update("updatePreference", map);
	}
}
