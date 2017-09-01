package com.wooridoori.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/membernation.wd")
	public void wtlPipeLmListXml( 
		      Model model, HttpServletRequest request, HttpServletResponse response)
		            throws Exception {
		     
		     URL url = new URL("http://apis.data.go.kr/1262000/CountryBasicService/getCountryBasicList?numOfRows=197&ServiceKey=ohelTML%2FebWtWdtXdLCnZdIG7KRH8mN7N%2BwAiIv1%2BWmyR5RcCtksbUK3aYiYbsbTxrQ7BpvdMRRBBtiIVLaJZQ%3D%3D");
		     HttpURLConnection request1 = (HttpURLConnection) url.openConnection();
		     request1.setRequestMethod("GET");
		     request1.connect();
		     InputStream is = request1.getInputStream();
		     BufferedReader bf_reader = new BufferedReader(new InputStreamReader(is));
		     String responseData = IOUtils.toString(bf_reader);
		     //System.out.println(responseData);
		     
		        response.setContentType("application/xml");
		        response.setCharacterEncoding("utf-8");
		        response.setHeader("Cache-Control", "no-cache");
		        response.getWriter().print( responseData );
		    }
}