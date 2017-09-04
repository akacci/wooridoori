package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.GuanDTO;


public class GuanDAO extends SqlSessionDaoSupport {
	
	//리스트 출력에 필요한 dao
	public List<String> selectList1(){
		List<String> list = getSqlSession().selectList("AreaCodeOfMain1");
		
		return list;
	}
	
	public List<String> selectList2(String areaname){
		List<String> list = getSqlSession().selectList("GetSigunguName",areaname);
		
		return list;
	}
	
	//도만 코드 뽑기
	public String getAreaCode(String areaname){
		String areacode = getSqlSession().selectOne("GetcodeOfArea", areaname);
		
		return areacode;
	}
	
	//도, 시군구 코드 뽑기
	public GuanDTO getCode(String areaname, String sigungu){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("areaname", areaname);
		map.put("sigungu", sigungu);
		
		GuanDTO gdto = getSqlSession().selectOne("SelectcodeFromDB", map); 
		
		return gdto;
	}
	
	public List<GuanDTO> getSigunguInfo(String areacode){
		
		List<GuanDTO> gdto = getSqlSession().selectList("GetSigunguInfo", areacode);
		
		return gdto;
	}
	
	//리스트 총 개수
	public int getTotalCount(String areacode, String sigungucode){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		
		int totalCount = getSqlSession().selectOne("CountofTList", map);
		
		return totalCount;
	}
	
	//리스트에 뽑힐 내용
	public List<GuanDTO> listView(String areacode, String sigungucode, int startNum, int endNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<GuanDTO> tlist = getSqlSession().selectList("TListOfMain", map );
		
		return tlist;
	}
	
	//관광지 이름순 
	public List<GuanDTO> listViewWithName(String areacode, String sigungucode, int startNum, int endNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<GuanDTO> tlist = getSqlSession().selectList("TListWithName", map );
		
		return tlist;
	}
	
	//관광지 구분순
	public List<GuanDTO> listViewWithCat(String areacode, String sigungucode, int startNum, int endNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<GuanDTO> tlist = getSqlSession().selectList("TListWithCat", map );
		
		return tlist;
	}
	
	//관광지 평점순 
	public List<GuanDTO> listViewWithAvg(String areacode, String sigungucode, int startNum, int endNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<GuanDTO> tlist = getSqlSession().selectList("TListWithAvg", map );
		
		return tlist;
	}
	
	//관광지 조회순
	public List<GuanDTO> listViewWithCount(String areacode, String sigungucode, int startNum, int endNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<GuanDTO> tlist = getSqlSession().selectList("TListWithCount", map );
		
		return tlist;
	}
	
	//관광지 조회 증가
	public void updateReadCountofTlist(String contentid){
		getSqlSession().update("updateReadcountOfTList", contentid);
	}
	
}
