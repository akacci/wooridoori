package com.wooridoori.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
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
	public String asgd(HttpServletRequest req){
		return "/layout/wooriMain";
	}
	@RequestMapping("/test.wd")
	public String asgdd(HttpServletRequest req){
		System.out.println("test");
		return "/layout/test";
	}

}
