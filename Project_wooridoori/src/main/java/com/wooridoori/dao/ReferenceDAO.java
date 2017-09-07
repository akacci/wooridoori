package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.ReferenceDTO;

public class ReferenceDAO extends SqlSessionDaoSupport{

	public int searchOfCount(ReferenceDTO refdto)
	{
		int count = getSqlSession().selectOne("searchOfCount",refdto);
		return count;
	}
	
	public void insertFirsttrip(ReferenceDTO refdto)
	{
		getSqlSession().insert("insertOfFirsttrip",refdto);
	}	
	public void insertBookmark(ReferenceDTO refdto)
	{
		getSqlSession().insert("insertOfBookmark",refdto);
	}
	public void insertGradePoint(ReferenceDTO refdto)
	{
		getSqlSession().insert("insertOfGradePoint",refdto);
	}
	public void insertPreference(ReferenceDTO refdto)
	{
		getSqlSession().insert("insertOfPreference",refdto);
	}
	
	/*recommend mypage*/
	public List<HashMap<String, Object>> selectBubbleData(String id)
	{		
		return getSqlSession().selectList("selectOfBubbleData", id);	
	}
	
	public List<HashMap<String, Object>> barChart_Data(String id)
	{
		return getSqlSession().selectList("barchartsOfData", id);
	}
	
	public List<ReferenceDTO> bubble_Count(String id)
	{
		return getSqlSession().selectList("bubbleOfCount", id);		
	}
	
	public int totalCount_Mypage(String id)
	{
		return getSqlSession().selectOne("totalcountOfPreference", id);
	}
}
