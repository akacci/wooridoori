package com.wooridoori.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.dto.ContentDTO;
import com.wooridoori.service.ContentService;

@Controller
public class ContentController {
	@Autowired
	ContentService cService;
	

}