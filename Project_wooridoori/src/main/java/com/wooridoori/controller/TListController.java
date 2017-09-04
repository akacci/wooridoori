package com.wooridoori.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.dao.guanDao;
import com.wooridoori.dto.ContentDTO;
import com.wooridoori.dto.guanDto;
import com.wooridoori.service.ContentService;

@Controller
public class TListController {
	@Autowired
	guanDao gdao;
	@Autowired
	ContentService cService;
	
	
	@RequestMapping("/tlist.wd")
	public String tlist(Model model,
						@RequestParam(value="areaname", defaultValue="") String areaname,
						@RequestParam(value="sigungu", defaultValue="") String sigungu,
						@RequestParam(value="depth", defaultValue="0") String depth){
		List<String> list = null;
		
		if(areaname.equals("")&&sigungu.equals("")){
			list = gdao.selectList1();
		
			model.addAttribute("depth", depth);
			model.addAttribute("list", list);
			return "/layout/tlist";
		}else if(!areaname.equals("")&&sigungu.equals("")){
			
			list = gdao.selectList2(areaname);
			
			String areacode = gdao.getAreaCode(areaname);
			
			
			List<guanDto> imglist = gdao.getSigunguInfo(areacode);
			
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
	
	@RequestMapping("/category.wd")
	public String cat(Model model,
			@RequestParam String sigungu,
			@RequestParam String areaname,
			@RequestParam String depth){
		
		guanDto gdto = gdao.getCode(areaname, sigungu);
		String areacode = gdto.getAreacode();
		String  sigungucode = gdto.getSigungucode();
		//String sigungucode = gdao.getSigunguCode(sigungu);
		
		List<guanDto> tlist = gdao.listView(areacode, sigungucode);
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("areaname", areaname);
		model.addAttribute("sigungu", sigungu);
		model.addAttribute("depth", depth);
		return "/layout/tlist";
	}
	
	@RequestMapping("/tarrange.wd")
	public String arrange(Model model,
			@RequestParam String standard,
			@RequestParam String sigungu,
			@RequestParam String areaname,
			@RequestParam String depth){
		guanDto gdto = gdao.getCode(areaname, sigungu);
		String areacode = gdto.getAreacode();
		String  sigungucode = gdto.getSigungucode();
		
		List<guanDto> tlist = new ArrayList<guanDto>();
		
		if(standard.equals("1")){
			tlist = gdao.listViewWithName(areacode, sigungucode);
			System.out.println("스탠1도코드"+areacode+"시군구코드"+sigungucode);
		}else if(standard.equals("2")){
			tlist = gdao.listViewWithCat(areacode, sigungucode);
			System.out.println("스탠2도코드"+areacode+"시군구코드"+sigungucode);
		}else if(standard.equals("3")){
			tlist = gdao.listViewWithAvg(areacode, sigungucode);
		}else{
			tlist = gdao.listViewWithCount(areacode, sigungucode);
		}
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("areaname", areaname);
		model.addAttribute("sigungu", sigungu);
		model.addAttribute("depth", depth);
		
		return "/layout/tlist";
	}
	
	@RequestMapping("/detail.wd")
	public String detail(Model model, @RequestParam String contentid,
						@RequestParam String areaname,
						@RequestParam String sigungu,
						@RequestParam String depth){
		
		HashMap<String, Object> map = cService.getContentData(contentid);
		model.addAttribute("cdata", (ContentDTO)map.get("CDATA"));
		model.addAttribute("areaname", areaname);
		model.addAttribute("sigungu", sigungu);
		model.addAttribute("depth", depth);
		model.addAttribute("contentid", contentid);
		return "/layout/detail";
	}
	
}
