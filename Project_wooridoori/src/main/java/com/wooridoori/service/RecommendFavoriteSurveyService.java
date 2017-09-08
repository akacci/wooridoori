package com.wooridoori.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.RecommendDAO;
import com.wooridoori.dao.RecommendFavoriteSurveyDAO;
import com.wooridoori.dao.ReferenceDAO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
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
		//아래 3개 null 처리 해야됨
		//recommend랑 비슷함 근데 애초에 막아야 할듯
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
	
	public void insertPreference(Map<String, String> map){
		Map<String, String> selSurvey = rfsdao.selectCat2OfSurvey(map.get("id"));
		System.out.println("service------------------------ insert " + map.get("id"));
		System.out.println("service------------------------ insert " + selSurvey.get("seq_preference"));
		map.put("seq_preference", selSurvey.get("seq_preference"));
		rfsdao.insertPreference(map);
	}
	
	public int totalCountPreference(String id)
	{
		int cnt = refdao.totalCount_Mypage(id);
		return cnt;
	}
}
