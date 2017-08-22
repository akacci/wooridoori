package com.wooridoori.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooridoori.dto.MemberDTO;

@Controller
public class MemberController {
	
	@RequestMapping("/loginform.wd")
		public String loginform(HttpServletRequest req, Model model){
		return "/member/loginform";
	}
	@RequestMapping("/loginaction.wd")
	public String loginAction(HttpServletRequest req, Model model, @ModelAttribute MemberDTO dto){
		String referrer = req.getHeader("Referer");
		System.out.println(referrer);
	    req.getSession().setAttribute("prevPage", referrer);
	    //http://localhost:8999/Project_wooridoori/wooriMain.wd?wbody_url=wbody.wd
	    String addr = referrer.substring(referrer.indexOf("=")+1);
	    System.out.println(addr);
	    model.addAttribute("wbody_url", addr);
		return "redirect:wooriMain.wd";
	}
//	@RequestMapping("/membercheck.wd")
//	public String memberCheck(Model m){
//		
		//m.addAttribute("");
	
//		return false;
//	}
}