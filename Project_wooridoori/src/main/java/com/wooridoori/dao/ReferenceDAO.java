package com.wooridoori.dao;

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
}
