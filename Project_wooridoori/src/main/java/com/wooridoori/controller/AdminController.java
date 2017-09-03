package com.wooridoori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("admin.wd")
	public String goAdminPage(){
		return "Admin/adminPage";
	}
}
