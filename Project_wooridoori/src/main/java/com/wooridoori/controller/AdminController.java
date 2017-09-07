package com.wooridoori.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wooridoori.dto.MemberDTO;
import com.wooridoori.dto.QnABoardDTO;
import com.wooridoori.dto.ReferenceDTO;
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
	@RequestMapping("adminQnAList.wd")
	public String goAdminQnAList(Model model){
		HashMap<String, String> kmap = adminService.getQnAKindCount();
		model.addAttribute("r", kmap.get("r"));
		model.addAttribute("m", kmap.get("m"));
		model.addAttribute("n", kmap.get("n"));
		model.addAttribute("list", adminService.getQnAList());
		return "Admin/adminQnAList";
	}
}
