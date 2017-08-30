package com.wooridoori.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.ContentDAO;
import com.wooridoori.dto.ContentDTO;
import com.wooridoori.dto.WeatherDTO;

@Service
public class ContentService {
	@Autowired
	ContentDAO cDao;
	ContentDTO cDto;
	WeatherDTO wDto;
	public HashMap<String, Object> getContentData(String contentid){
		cDto = cDao.getContentData(contentid);
		String[] addr = cDto.getAddr1().split(" ");
		HashMap<String, String> map = new HashMap<>();
		map.put("sido", addr[0]);
		map.put("gu", addr[1]);
		wDto = cDao.getWeatherData(map);
		
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat hour = new SimpleDateFormat("HH");
		wDto.setDate(day.format(date));
		wDto.setHour(hour.format(date)+"00");
		HashMap<String, Object> Result = new HashMap<>();
		Result.put("CDATA", cDto);
		Result.put("WDATA", wDto);
		return Result;
	}
}
