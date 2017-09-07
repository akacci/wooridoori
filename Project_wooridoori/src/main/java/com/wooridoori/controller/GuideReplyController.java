package com.wooridoori.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooridoori.dto.GuideReplyDTO;
import com.wooridoori.service.GuideReplyService;

@Controller
public class GuideReplyController {
	@Autowired
	GuideReplyService grService;
	
	@RequestMapping("replyInsertProc.wd")
	@ResponseBody
	public String replyInsertProc(GuideReplyDTO dto){
		grService.insertReply(dto);
		return "ok";
		
	}
	
	@RequestMapping("gerReplyList.wd")
	public String replyInsertProc(int num){
		grService.getReplyList(num);
		return "";
	}
	
	
}
