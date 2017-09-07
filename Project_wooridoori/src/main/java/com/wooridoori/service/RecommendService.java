package com.wooridoori.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	
	public List<TourInquiryDTO> selectLoginRecommendArea(String id){
		List<Map<String, String>> catMap = rdao.selectNationOfTourRank(id);
		List<TourInquiryDTO> list = new ArrayList<TourInquiryDTO>();
		
		if(catMap.size() > 0){
			String pre_cat1 = "";
			for(int i = 0; i < catMap.size(); i++) pre_cat1 = catMap.get(i).get("PRE_CAT1");
			list = rdao.selectLoginRecommendArea(pre_cat1);
		}else{
			list = rdao.selectFirstRecommendArea();
		}
		
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendThema(){
		List<TourInquiryDTO> list = rdao.selectFirstRecommendThema();
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendThema(String id){
		List<Map<String, String>> catMap = rdao.selectNationOfTourRank(id);
		List<TourInquiryDTO> list = new ArrayList<TourInquiryDTO>();
		
		if(catMap.size() > 0){
			for(int i = 0; i <catMap.size(); i++){
				catMap.get(i).remove("PRE_CAT1");
			}
			list = rdao.selectLoginRecommendThema(catMap);
		}else{
			list = rdao.selectFirstRecommendThema();
		}
		return list;
	}
	
	public List<TourInquiryDTO> selectFirstRecommendNonFavorite(){
		List<TourInquiryDTO> list = rdao.selectFirstRecommendNonFavorite();
		return list;
	}
	
	public List<TourInquiryDTO> selectLoginRecommendNonFavorite(String id){
		List<Map<String, String>> catMap = rdao.selectNationOfTourRank(id);
		List<TourInquiryDTO> list = new ArrayList<TourInquiryDTO>();
		
		if(catMap.size() > 0){
			list = rdao.selectLoginRecommendNonFavorite(catMap); 
		}else{
			list = rdao.selectFirstRecommendNonFavorite();
		}
		 
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
		
		List<HashMap<String, String>> list = refdao.searchOfpreference(refdto.getM_id());
		HashMap<String, String> hashmap = list.get(0);
		String age = hashmap.get("AGE");
		String grouptrip = hashmap.get("GROUPRRIP");
		String purpose_code = hashmap.get("PURPOSE_CODE");
		String stay_code = hashmap.get("STAY_CODE");
		
		if(!(age.equals("0")))
		{
			refdto.setAge(age);
			refdto.setGrouptrip(grouptrip);
			refdto.setPurpose_code(purpose_code);
			refdto.setStay_code(stay_code);
		}
		
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
	public List<HashMap<String, Object>> bubble_Data(String id, int currentPage)
	{
		
		Date date = new Date();
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		List<HashMap<String, Object>> list = refdao.selectBubbleData(id);		
				
		for(int i = 0; i<list.size(); i++)
		{
			String MOD_DATE = sdf.format(list.get(i).get("MODIFIED_DATE"));
			list.get(i).put("MODIFIED_DATE", MOD_DATE);				
		}		
		
		return list;
	}
	public HashMap<String, Object> paging_Data(String id, int currentPage)
	{		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();		
		//페이징 처리
		int perPage=10; //한페이지당 보여지는 글의 갯수
		int perBlock=5; //한블럭당 보여지는 페이지번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호		
		
		int totalCount = refdao.totalCount_Mypage(id);
		
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
		
		no=totalCount-((currentPage-1)*perPage);
		
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
				
		if(endNum>totalCount)
		{
			endNum=totalCount;
		}			
		
		startPage= (currentPage)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		
		if(endPage>totalPage)
		{
			endPage=totalPage;
		}
		
		hashmap.put("no", no);
		hashmap.put("perPage",perPage);
		hashmap.put("perBlock",perBlock);
		hashmap.put("totalPage",totalPage);
		hashmap.put("startNum",startNum);
		hashmap.put("endNum",endNum);
		hashmap.put("startPage",startPage);
		hashmap.put("endPage",endPage);
		hashmap.put("currentPage", currentPage);
		
		
		return hashmap;
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
