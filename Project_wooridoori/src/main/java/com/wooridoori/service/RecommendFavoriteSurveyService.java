package com.wooridoori.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.RecommendFavoriteSurveyDAO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.TourInquiryDTO;

@Service
public class RecommendFavoriteSurveyService {

	@Autowired
	RecommendFavoriteSurveyDAO rfsdao;
	
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
	
	public void insertPreference(Map<String, String> map){
		rfsdao.insertPreference(map);
	}
}
