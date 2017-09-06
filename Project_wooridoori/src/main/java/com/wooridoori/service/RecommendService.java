package com.wooridoori.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<TourInquiryDTO> selectCodeOfTourlist(HashMap<String, Object> code){
		List<TourInquiryDTO> list = rdao.selectCodeOfTourlist(code);
		return list;
	}
	
	/*public List<TourInquiryDTO> selectAreaCodeOfTourList(HashMap<String, Object> areacode){
		List<TourInquiryDTO> list = rdao.selectAreaCodeOfTourList(areacode);
		return list;
	}
	
	public List<TourInquiryDTO> selectCat2OfTourlist(HashMap<String, Object> cat2){
		List<TourInquiryDTO> list = rdao.selectCat2OfTourlist(cat2);
		return list;
	}*/
	
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
	
	public List<TourInquiryDTO> selectLoginRecommendArea(){
		Map<String, String> catMap = rdao.selectNationOfTourRank();
		String pre_cat1 = catMap.get("PRE_CAT1");
		List<TourInquiryDTO> list = rdao.selectLoginRecommendArea(pre_cat1);
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendThema(){
		List<TourInquiryDTO> list = rdao.selectFirstRecommendThema();
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendThema(){
		Map<String, String> catMap = rdao.selectNationOfTourRank();
		catMap.remove("PRE_CAT1");
		List<TourInquiryDTO> list = rdao.selectLoginRecommendThema(catMap);
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendNonFavorite(){
		List<TourInquiryDTO> list = rdao.selectFirstRecommendNonFavorite();
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendNonFavorite(){
		Map<String, String> catMap = rdao.selectNationOfTourRank();
		List<TourInquiryDTO> list = rdao.selectLoginRecommendNonFavorite(catMap);
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
	
	/*recommend mypage*/
	public List<HashMap<String, Object>> bubble_Data(String id)
	{
		Date date = new Date();
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		List<HashMap<String, Object>> list = refdao.selectBubbleData(id);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		for(int i = 0; i<list.size(); i++)
		{
			String MOD_DATE = sdf.format(list.get(i).get("MODIFIED_DATE"));
			list.get(i).put("MODIFIED_DATE", MOD_DATE);								
		}
		return list;
	}
	
	public List<HashMap<String, Object>> barCharts_Data(String id)
	{
		List<HashMap<String, Object>> list = refdao.barChart_Data(id);
		return list;
	}
	public List<ReferenceDTO> bubble_Count(String id)
	{
		List<ReferenceDTO> list = refdao.bubble_Count(id);
		return list;			
	}
}
