package com.wooridoori.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.ContentCodeDAO;
import com.wooridoori.dao.RecommendDAO;
import com.wooridoori.dao.ReferenceDAO;
import com.wooridoori.dto.AreaCodeDTO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
import com.wooridoori.dto.TourInquiryDTO;

@Service
public class RecommendService {

	@Autowired
	RecommendDAO rdao;
	
	@Autowired
	ContentCodeDAO condao;
	
	@Autowired
	ReferenceDAO refdao;
	
	public List<AreaCodeDTO> selectAreaCode(){
		List<AreaCodeDTO> list = rdao.selectAreaCode();
		return list;
	}
	
	public List<TourInquiryDTO> selectAreaCodeOfTourList(HashMap<String, Object> areacode){
		List<TourInquiryDTO> list = rdao.selectAreaCodeOfTourList(areacode);
		return list;
	}
	
	public List<TourInquiryDTO> selectCat2OfTourlist(HashMap<String, Object> cat2){
		List<TourInquiryDTO> list = rdao.selectCat2OfTourlist(cat2);
		return list;
	}
	
	public List<ContentCodeDTO> selectContentCodeName(){
		List<ContentCodeDTO> list = rdao.selectContentCodeName();
		return list;
	}
	
	public List<TourInquiryDTO> selectTourInquiry(){
		List<TourInquiryDTO> list = rdao.selectTourInquiry();
		return list;
	}
	
	public TourInquiryDTO selectTourInquiryOne(String contentid){
		TourInquiryDTO tdto = rdao.selectTourInquiryOne(contentid);
		return tdto;
	}
	
	public List<ContentCodeDTO> filter_main(){
		List<ContentCodeDTO> list = condao.filter_search();
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendArea(){
		List<TourInquiryDTO> list = rdao.selectFirstRecommendArea();
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendThema(){
		List<TourInquiryDTO> list = rdao.selectFirstRecommendThema();
		return list;
	}
	
	/*reference*/
	public void insertOrUpdateFirsttrip(ReferenceDTO refdto)
	{
		
		String content = refdto.getContent_id();
		char firsttrip = refdto.getFirsttrip();
		char bookmark = refdto.getBookmark();
		float grade_point = refdto.getGrade_point();			
		char pre_rence = refdto.getPre_rence();
		if(firsttrip!='x')
		{
			refdao.insertFirsttrip(refdto);
		}
		if(bookmark != 'x')
		{
			refdao.insertBookmark(refdto);
		}
		if(grade_point != 0)
		{
			refdao.insertGradePoint(refdto);
		}
		if(pre_rence != 'x')
		{
			refdao.insertPreference(refdto);
		}
		
	}
	
}
