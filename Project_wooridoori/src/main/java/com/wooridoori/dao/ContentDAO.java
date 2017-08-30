package com.wooridoori.dao;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.ContentDTO;
import com.wooridoori.dto.WeatherDTO;

public class ContentDAO extends SqlSessionDaoSupport{
	ContentDTO cDto;
	WeatherDTO wDto;
	
	public ContentDTO getContentData(String contentid){
		cDto = getSqlSession().selectOne("getContentData", contentid);
		return cDto;
	}
	public WeatherDTO getWeatherData(HashMap<String, String> map){
		wDto = getSqlSession().selectOne("getWeatherXY", map);
		return wDto;
	}
}
