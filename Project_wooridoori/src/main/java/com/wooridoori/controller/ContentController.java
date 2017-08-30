package com.wooridoori.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.dto.ContentDTO;
import com.wooridoori.dto.WeatherDTO;
import com.wooridoori.service.ContentService;

@Controller
public class ContentController {
	@Autowired
	ContentService cService;
	
	@RequestMapping("/list.wd")
	public String list(Model model, @RequestParam String data){
		model.addAttribute("data", data);
		return "/layout/list";
	}
	@RequestMapping("/detail.wd")
	public String detail(Model model, @RequestParam String contentid){
		
		HashMap<String, Object> map = cService.getContentData(contentid);
		model.addAttribute("cdata", (ContentDTO)map.get("CDATA"));
		model.addAttribute("wdata", (WeatherDTO)map.get("WDATA"));
		model.addAttribute("contentid", contentid);
		return "/layout/detail";
	}
}