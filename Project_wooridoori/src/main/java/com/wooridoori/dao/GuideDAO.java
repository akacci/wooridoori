package com.wooridoori.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.GuideDTO;

public class GuideDAO extends SqlSessionDaoSupport {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<GuideDTO> getList(String addr){
		return sqlSessionTemplate.selectList("guide.getGuideList",addr);
	}
	public void writeGuide(GuideDTO dto){
		sqlSessionTemplate.insert("guide.writeGuide",dto);
	}
	public String isGuide(String id){
		return sqlSessionTemplate.selectOne("guide.isGuide",id);
	}
	public GuideDTO getContent(String num){
		return sqlSessionTemplate.selectOne("guide.getContent", num);
	}
}
