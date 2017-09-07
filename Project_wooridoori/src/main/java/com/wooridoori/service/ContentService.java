package com.wooridoori.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.ContentDAO;
import com.wooridoori.dto.ContentDTO;

@Service
public class ContentService {
	@Autowired
	ContentDAO cDao;
	ContentDTO cDto;
	public HashMap<String, Object> getContentData(String contentid){
		cDto = cDao.getContentData(contentid);
		String[] addr = cDto.getAddr1().split(" ");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sido", addr[0]);
		map.put("gu", addr[1]);
		
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat hour = new SimpleDateFormat("HH");
		HashMap<String, Object> Result = new HashMap<String, Object> ();
		Result.put("CDATA", cDto);
		return Result;
	}
}
