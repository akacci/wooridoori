package com.wooridoori.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.RecommendFavoriteSurveyDAO;
import com.wooridoori.dao.ReferenceDAO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.TourInquiryDTO;

@Service
public class RecommendFavoriteSurveyService {

	@Autowired
	RecommendFavoriteSurveyDAO rfsdao;
	
	@Autowired
	ReferenceDAO refdao;
	
	public List<ContentCodeDTO> selectStayCode(){
		List<ContentCodeDTO> list = rfsdao.selectStayCode();
		return list;
	}
	
	public List<TourInquiryDTO> selectPreferenceOfArea(String id){
		Map<String, String> catMap = rfsdao.selectCat2OfSurvey(id);
		List<TourInquiryDTO> list = rfsdao.selectPreferenceOfArea(catMap);
		return list;
	}
	
	public List<TourInquiryDTO> selectPreferenceOfPurpose(String id){
		Map<String, String> catMap = rfsdao.selectCat2OfSurvey(id);
		List<TourInquiryDTO> list = rfsdao.selectPreferenceOfPurpose(catMap);
		return list;
	}
	
	public List<TourInquiryDTO> selectPreferenceOfStay(String id){
		Map<String, String> catMap = rfsdao.selectCat2OfSurvey(id);
		List<TourInquiryDTO> list = rfsdao.selectPreferenceOfStay(catMap);
		return list;
	}
	
	public void updatePreference(Map<String, String> map){
		Map<String, String> selSurvey = rfsdao.selectCat2OfSurvey(map.get("id"));
		System.out.println("service------------------------ insert " + map.get("id"));
		System.out.println("service------------------------ insert " + selSurvey.get("preference_seq"));
		map.put("seq_preference", selSurvey.get("seq_preference"));
		rfsdao.updatePreference(map);
	}
	
	public int totalCountPreference(String id)
	{
		int cnt = refdao.totalCount_Mypage(id);
		return cnt;
	}
}
