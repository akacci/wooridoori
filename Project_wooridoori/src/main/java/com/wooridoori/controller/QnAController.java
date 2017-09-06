package com.wooridoori.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.dto.QnABoardDTO;
import com.wooridoori.service.QnABoardService;

@Controller
public class QnAController {
	@Autowired
	QnABoardService qnaService;

	@RequestMapping("/qna.wd")
	public String qna(Model model, HttpSession session, @RequestParam(value="pageNum",defaultValue="1")	int currentPage){
		Map<String, Object> map = qnaService.getUserQnA(session, currentPage);
		if((Integer)map.get("totalCount")>0){
			model.addAttribute("currentPage", map.get("currentPage"));
			model.addAttribute("startPage", map.get("startPage"));
			model.addAttribute("endPage", map.get("endPage"));
			model.addAttribute("totalPage", map.get("totalPage"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("list", map.get("list"));
			return "/mypage/qnaList";
		}
		return "/mypage/qnaWriteForm";
	}
	@RequestMapping("/qnawrite.wd")
	public String qnaWriter(){
		return "/mypage/qnaWriteForm";
	}
	@RequestMapping("qnaaction.wd")
	public String writerUserQnA(HttpSession session, @ModelAttribute QnABoardDTO qnaDto){
		qnaService.writeUserQnA(session, qnaDto);
		
		return "redirect:/mypage.wd";
	}
}
