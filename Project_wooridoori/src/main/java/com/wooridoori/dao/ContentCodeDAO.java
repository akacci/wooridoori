package com.wooridoori.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.ContentCodeDTO;

public class ContentCodeDAO extends SqlSessionDaoSupport{

	public List<ContentCodeDTO> filter_search(){
		List<ContentCodeDTO> list = getSqlSession().selectList("fliterSearchOfCat_Name");
		return list;
	}
	
}
