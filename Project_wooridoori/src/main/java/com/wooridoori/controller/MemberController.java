package com.wooridoori.controller;

import java.io.Console;
import java.io.IOException;
import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.wooridoori.dao.MemberDAO;
import com.wooridoori.dto.MemberDTO;
import com.wooridoori.service.GuideService;
import com.wooridoori.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	@Autowired
	MemberDAO mdao;
	
	@RequestMapping("/loginform.wd")
	public String loginform(Model model){
		model.addAttribute("Clist", mService.loginform());
		return "/member/loginform";
	}
	
	
	@RequestMapping("/loginaction.wd")
	public String loginAction(
			HttpServletRequest req,
			HttpSession session,
			Model m,
			@ModelAttribute MemberDTO mdto,
			@RequestParam(defaultValue="서울특별시")String addr
			){
		req.getSession().setAttribute("prevPage", req.getHeader("Referer"));
	    session.setAttribute("LOGIN", "YES");
	    session.setAttribute("ID", mdto.getM_id());
	   
	    boolean log=mdao.loginCheck(mdto);
	    if(log){	    
			//User info 
			mdto=mService.getMemberInfo(mdto.getM_id());
			session.setAttribute("id", mdto.getM_id());
			session.setAttribute("name", mdto.getName());
			session.setAttribute("guide", mdto.getGuide());			
			int f=mdto.getE_mail().indexOf("@");						
			session.setAttribute("email1", mdto.getE_mail().substring(0,f));
			session.setAttribute("email2", mdto.getE_mail().substring(f+1, mdto.getE_mail().length()));
			m.addAttribute("addr",addr);
	    }
		return "/member/login";
	}
	
	
	@RequestMapping("/logoutaction.wd")
	public String logoutAction(HttpSession session){
	    session.setAttribute("ID", null);
	    session.setAttribute("LOGIN", "NO");
	    session.setAttribute("id", null);
	    session.setAttribute("name", null);
	    session.setAttribute("guide", null);
	    session.setAttribute("email1", null);
	    session.setAttribute("email2", null);
	    
		return "redirect:wooriMain.wd";
	}
	
	@RequestMapping("/mypage.wd")
	public String mypageAction()
	{
		return "/mypage/MyPageFrame";
	}
	
	@RequestMapping(value="ajax_mypage.wd", method=RequestMethod.GET)
	@ResponseBody
	public void ajax_mypageAction(
			HttpSession session
			,HttpServletResponse response
			)
	{
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐
		ObjectMapper mapper = new ObjectMapper();
		List<String> list = new ArrayList<String>();
		
		String id = session.getAttribute("id").toString();
		MemberDTO dto = mService.getMemberInfo(id);
		
		
		try {
			response.getWriter().print(mapper.writeValueAsString(dto));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	
	@RequestMapping("/userInfo.wd")
	public String userInfo(HttpSession session, Model model){

		String login = session.getAttribute("LOGIN").toString();
		if(login.equals("YES"))
		{
			System.out.println("로그인 상태");
			String id = session.getAttribute("id").toString();
			MemberDTO dto = mService.getMemberInfo(id);
			model.addAttribute("dto",dto);
		}
		
		return "/mypage/UserInfo";
	}
}