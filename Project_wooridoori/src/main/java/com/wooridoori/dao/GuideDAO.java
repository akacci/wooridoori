package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.GuideDTO;

public class GuideDAO extends SqlSessionDaoSupport {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<GuideDTO> getList(String addr,int start,int end){
		HashMap<String,String> data=new HashMap<String, String>();
		data.put("addr", addr);
		data.put("start", Integer.toString(start));
		data.put("end",  Integer.toString(end));
		return sqlSessionTemplate.selectList("guide.getGuideList",data);
	}
	public String getListCount(String addr){
		return sqlSessionTemplate.selectOne("guide.getGuideListCount",addr);
	}
	
	public void guideAuthUpdate(String m_id){
		sqlSessionTemplate.update("guide.guideAuthUpdate",m_id);
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
	
	public List<GuideDTO> hashSearch(String addr,String hash,int start,int end){
		HashMap<String,String> data=new HashMap<String, String>();
		data.put("addr", addr);
		data.put("hash", hash);
		data.put("start", Integer.toString(start));
		data.put("end",  Integer.toString(end));
		return sqlSessionTemplate.selectList("guide.hashSearch",data);
	}
	public String getGuideHashListCount(String addr,String hash){
		HashMap<String,String> data=new HashMap<String, String>();
		data.put("addr", addr);
		data.put("hash", hash);
		return sqlSessionTemplate.selectOne("guide.getGuideHashListCount",data);
	}
	
	public List<GuideDTO> themeSearch(String addr,String theme,int start,int end){
		HashMap<String,String> data=new HashMap<String, String>();
		data.put("addr", addr);
		data.put("theme", theme);
		data.put("start", Integer.toString(start));
		data.put("end",  Integer.toString(end));
		return sqlSessionTemplate.selectList("guide.themeSearch",data);
	}
	public String getGuideThemeListCount(String addr,String theme){
		HashMap<String,String> data=new HashMap<String, String>();
		data.put("addr", addr);
		data.put("theme", theme);
		return sqlSessionTemplate.selectOne("guide.getGuideThemeListCount",data);
	}
	
	public List<GuideDTO> guideNearestOfList(double lat,double lon){
		HashMap<String,Double> data=new HashMap<String, Double>();
		data.put("lat", lat);
		data.put("lon", lon);
		return sqlSessionTemplate.selectList("guide.guideNearestOfList",data);		
	}
}
