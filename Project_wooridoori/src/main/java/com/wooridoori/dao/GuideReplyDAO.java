package com.wooridoori.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.GuideReplyDTO;

public class GuideReplyDAO extends SqlSessionDaoSupport{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReply(GuideReplyDTO dto){
		sqlSessionTemplate.insert("guideReply.insertReply",dto);
	}
	public List<GuideReplyDTO> getReplyList(int num){
		return sqlSessionTemplate.selectList("guideReply.getReplyList",num);
	}
}
