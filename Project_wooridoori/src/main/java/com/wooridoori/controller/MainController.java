package com.wooridoori.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/wtopmenu.wd")
	public String main(){
		return "/layout/wtopmenu";
	}
	@RequestMapping("/wfooter.wd")
	public String wfooter(){
		return "/layout/wfooter";
	}
	@RequestMapping("/wbody.wd")
	public String wbody(){
		return "/layout/wbody";
	}
	@RequestMapping("/wooriMain.wd")

	public String wooriMain(
			HttpServletRequest req,
			Model model
			){
		String url="/"+(String)req.getParameter("wbody_url");
		model.addAttribute("wbody_url", url);
		return "/layout/wooriMain";
	}
	
	@RequestMapping("/london.wd")
	public String london(){
		return "/layout/london";
	}
	
	@RequestMapping("/dokyo.wd")
	public String dokyo(){
		return "/layout/dokyo";
	}
	
	@RequestMapping("/paris.wd")
	public String paris(){
		return "/layout/paris";
	}
	
	@RequestMapping("/slide.wd")
	public String slide()
	{
		return "/view/test1";
	}
}
