package com.wooridoori.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.dao.GuanDAO;
import com.wooridoori.dto.GuanDTO;

@Controller
public class TcatController {
	@Autowired
	GuanDAO gdao;
	
	@RequestMapping("/tlist.wd")
	public String tlist(Model model,
						@RequestParam(value="areaname", defaultValue="") String areaname,
						@RequestParam(value="sigungu", defaultValue="") String sigungu,
						@RequestParam(value="depth", defaultValue="0") String depth,
						@RequestParam(value="pageNum",defaultValue="1")	int currentPage){
		List<String> list = null;
		
		if(areaname.equals("")&&sigungu.equals("")){
			list = gdao.selectList1();
		
			model.addAttribute("depth", depth);
			model.addAttribute("list", list);
			return "/layout/tlist";
		}else if(!areaname.equals("")&&sigungu.equals("")){
			
			list = gdao.selectList2(areaname);
			
			String areacode = gdao.getAreaCode(areaname);
			
			
			List<GuanDTO> imglist = gdao.getSigunguInfo(areacode);
			
			depth = "1";
			model.addAttribute("areaname", areaname);
			model.addAttribute("depth", depth);
			model.addAttribute("imglist", imglist);
			//model.addAttribute("list", list);
			return "/layout/tlist";
		}else{
			
			depth = "2";
			model.addAttribute("depth", depth);
			model.addAttribute("sigungu", sigungu);
			return "forward:/category.wd?depth="+depth;
		}
	}
	
	
}
	

