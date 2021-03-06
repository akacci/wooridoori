package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.AreaCodeDTO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
import com.wooridoori.dto.TourInquiryDTO;

public class RecommendDAO extends SqlSessionDaoSupport{
	
	public List<AreaCodeDTO> selectAreaCode(){
		List<AreaCodeDTO> list = getSqlSession().selectList("selectAreaCode");
		return list;
	}
	
	public List<TourInquiryDTO> selectCodeOfTourlist(HashMap<String, Object> code){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectCodeOfTourList", code);
		return list;
	}
	
	public List<Map<String, String>> selectNationOfTourRank(String id){
		List<Map<String, String>> map = getSqlSession().selectList("selectNationOfTourRank", id);
		return map;
	}
	
	/*public List<TourInquiryDTO> selectAreaCodeOfTourList(HashMap<String, Object> areacode){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectAreaCodeOfTourList", areacode);
		return list;
	}
	
	public List<TourInquiryDTO> selectCat2OfTourlist(HashMap<String, Object> cat2){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectCat2OfTourlist", cat2);
		return list;
	}*/
	
	public List<ContentCodeDTO> selectContentCodeName(){
		List<ContentCodeDTO> list = getSqlSession().selectList("selectContentCodeName");
		return list;
	}
	
	public List<TourInquiryDTO> selectTourInquiry(){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectTourInquiry");
		return list;
	}
	
	public TourInquiryDTO selectTourInquiryOne(String contentid){
		TourInquiryDTO tdto = getSqlSession().selectOne("selectTourInquiryOne", contentid);
		return tdto;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendArea(){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectFirstRecommendArea");
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendArea(String pre_cat1){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectLoginRecommendArea", pre_cat1);
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendThema(){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectFirstRecommendThema");
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendThema(Map<String, String> pre_cat){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectLoginRecommendThema", pre_cat);
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendNonFavorite(){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectFirstRecommendNonFavorite");
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendNonFavorite(Map<String, String> pre_cat){
		List<TourInquiryDTO> list = getSqlSession().selectList("selectLoginRecommendNonFavorite", pre_cat);
		return list;
	}
	
}
