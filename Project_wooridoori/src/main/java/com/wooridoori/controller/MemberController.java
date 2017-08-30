package com.wooridoori.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooridoori.dto.MemberDTO;
import com.wooridoori.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	@RequestMapping("/loginform.wd")
	public String loginform(Model model){
		model.addAttribute("Clist", mService.loginform());
		return "/member/loginform";
	}
	
	
	@RequestMapping("/loginaction.wd")
	public String loginAction(
			HttpServletRequest req,
			HttpSession session,
			Model model,
			@ModelAttribute MemberDTO dto
			){
		req.getSession().setAttribute("prevPage", req.getHeader("Referer"));
	    session.setAttribute("LOGIN", "YES");
	    session.setAttribute("ID", dto.getId());
		return "/member/login";
	}
	
	
	@RequestMapping("/logoutaction.wd")
	public String logoutAction(HttpSession session){
	    session.setAttribute("ID", null);
	    session.setAttribute("LOGIN", "NO");
		return "redirect:wooriMain.wd";
	}
	
	
	@RequestMapping("/membercheck.wd")
	public @ResponseBody String memberCheck(HttpServletRequest req, HttpSession session, Model model, @ModelAttribute MemberDTO mdto){
		return mService.loginCheck(mdto)?"yes":"no";
	}
	
	@RequestMapping("/logoutform.wd")
	public String logoutform(){
		return "/member/logoutform";
	}
	
	@RequestMapping("/idcheck.wd")
	public @ResponseBody String idCheck(@RequestParam String id){
		return mService.idCheck(id)?"Y":"N";
	}
	
	@RequestMapping("/signupaction.wd")
	public String signupAction(Model model, HttpServletRequest req, @ModelAttribute MemberDTO mdto){
		mService.memberInsert(mdto);
		model.addAttribute("wbody_url", mService.beforeAddress(req));
		return "redirect:wooriMain.wd";
	}
}