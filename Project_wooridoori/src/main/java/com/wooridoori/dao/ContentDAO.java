package com.wooridoori.dao;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.ContentDTO;

public class ContentDAO extends SqlSessionDaoSupport{
	ContentDTO cDto;
	
	public ContentDTO getContentData(String contentid){
		cDto = getSqlSession().selectOne("getContentData", contentid);
		return cDto;
	}
}
