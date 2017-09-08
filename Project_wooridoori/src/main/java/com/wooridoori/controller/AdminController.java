package com.wooridoori.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooridoori.dto.MemberDTO;
import com.wooridoori.dto.QnABoardDTO;
import com.wooridoori.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("admin.wd")
	public String goAdminPage(Model model){
		List<QnABoardDTO> qlist = adminService.getQnABoardList_ten();
		List<MemberDTO> mlist = adminService.getAllMemberList();
		HashMap<String, String> kmap = adminService.getQnAKindCount();
		model.addAttribute("r", kmap.get("r"));
		model.addAttribute("m", kmap.get("m"));
		model.addAttribute("n", kmap.get("n"));
		model.addAttribute("qlist", qlist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("noncheckCount", adminService.getnoncheckcount());
		return "Admin/adminPage";
	}


	@RequestMapping("adminGuideList.wd")
	public String goAdminGuideList(Model model){
		return "Admin/adminGuideList";
	}
	@RequestMapping("adminMemberList.wd")
	public String goAdminMemberList(Model model){
		List<MemberDTO> mlist = adminService.getAllMemberList();
		
		model.addAttribute("mlist", mlist);
		return "Admin/adminMemberList";
	}
	
	@RequestMapping("deleteMember.wd")
	public String doDeleteMember(Model model, @RequestParam(value="wnum", defaultValue="") String wnum ){
		
		
		String data1 = adminService.doDeleteMember(wnum);
		model.addAttribute("data1", data1);
		return "redirect:mypage.wd";
	}
	
	@RequestMapping("adminQnAList.wd")
	public String goAdminQnAList(Model model){
		HashMap<String, String> kmap = adminService.getQnAKindCount();
		model.addAttribute("r", kmap.get("r"));
		model.addAttribute("m", kmap.get("m"));
		model.addAttribute("n", kmap.get("n"));
		model.addAttribute("list", adminService.getQnAList());
		return "Admin/adminQnAList";
	}
	@RequestMapping("answer_qnawrite.wd")
	public @ResponseBody String goAdminQnAWrite(Model model, HttpServletRequest request, @ModelAttribute QnABoardDTO qnaDto, @RequestParam String content_qna){
		System.out.println(qnaDto.getNum());
		adminService.writeAnswer(qnaDto, content_qna);
		return "adminQnAList.wd";
	}

	@RequestMapping("answerqna.wd")
	public String goAdminQnAWrite(Model model, @RequestParam String num){
		
		model.addAttribute("data",adminService.getQnABoard(num));
		return "Admin/adminQnAwrite";
	}
}
