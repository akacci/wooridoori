package com.wooridoori.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooridoori.dao.GuanDAO;
import com.wooridoori.dto.ContentDTO;
import com.wooridoori.dto.GuanDTO;
import com.wooridoori.service.ContentService;

@Controller
public class TListController {
	@Autowired
	GuanDAO gdao;
	@Autowired
	ContentService cService;
		
	@RequestMapping("/category.wd")
	public String cat(Model model,
			@RequestParam(value="standard", defaultValue="") String standard,
			@RequestParam(value="sigungu", defaultValue="") String sigungu,
			@RequestParam(value="areaname", defaultValue="") String areaname,
			@RequestParam(value="depth", defaultValue="") String depth,
			@RequestParam(value="pageNum",defaultValue="1")	int currentPage,
			@RequestParam(value="searchkey", defaultValue="") String searchkey,
			@RequestParam(value="cat2_name", defaultValue="") String cat2_name){
		
		GuanDTO gdto = new GuanDTO();
		int totalCount= 0;
		String areacode ="";
		String sigungucode ="";
		String cat2 ="";
		//페이징 처리
		int perPage=10; //한페이지당 보여지는 글의 갯수
		int perBlock=5; //한블럭당 보여지는 페이지번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호
		
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
		
		//선택으로 넘어왔을 때 필요한 값 추출
		if(!areaname.equals("")&&!sigungu.equals("")){
			gdto = gdao.getCode(areaname, sigungu);
			areacode = gdto.getAreacode();
			sigungucode = gdto.getSigungucode();
			totalCount= gdao.getTotalCount(areacode, sigungucode);
		}else if(!searchkey.equals("")){
			totalCount= gdao.getTotalSCount(searchkey);
			
		}else if(!cat2_name.equals("")){
			cat2=gdao.getCat2Name(cat2_name);
			totalCount= gdao.getTotalCCount(cat2);
		}else{
			
		}
		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no=totalCount-((currentPage-1)*perPage);
		//총 페이지수
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
		//예를 들어 모두 45개의 글이 있을경우
		//마지막 페이지는 endnum 이 45 가 되야함
		if(endNum>totalCount)
			endNum=totalCount;
		//각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
		startPage= (currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//예를 들어 총 34페이지일경우
		//마지막 블럭은 30-34 만 보여야함
		if(endPage>totalPage)
			endPage=totalPage;
		
		List<GuanDTO> tlist = new ArrayList<GuanDTO>();
		if(!areaname.equals("")&&!sigungu.equals("")){
			if(standard.equals("")){
				tlist = gdao.listView(areacode, sigungucode, startNum, endNum);
			}else if(standard.equals("1")){
				tlist = gdao.listViewWithName(areacode, sigungucode, startNum, endNum);
			}else if(standard.equals("2")){
				tlist = gdao.listViewWithCat(areacode, sigungucode, startNum, endNum);
			}else if(standard.equals("3")){
				tlist = gdao.listViewWithAvg(areacode, sigungucode, startNum, endNum);
			}else{
				tlist = gdao.listViewWithCount(areacode, sigungucode, startNum, endNum);
			}
		}else if(!searchkey.equals("")){
				tlist = gdao.tSearchList(searchkey, startNum, endNum);
				depth="2";
		}else if(!cat2_name.equals("")){
				System.out.println();
				tlist = gdao.ListofCat2(cat2, startNum, endNum);
				depth="2";
		}else{
			
		}
		model.addAttribute("no", no);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("tlist", tlist);
		model.addAttribute("areaname", areaname);
		model.addAttribute("sigungu", sigungu);
		model.addAttribute("depth", depth);
		model.addAttribute("searchkey", searchkey);
		model.addAttribute("cat2_name", cat2_name);
		return "/layout/tlist";
	}
	
	@RequestMapping("/detail.wd")
	public String detail(Model model, @RequestParam String contentid,
						@RequestParam (value="areaname", defaultValue="") String areaname,
						@RequestParam (value="sigungu", defaultValue="") String sigungu,
						@RequestParam (value="depth", defaultValue="") String depth,
						@RequestParam (value="pageNum", defaultValue="1") int currentPage){
		
		if(!contentid.equals("")&&!areaname.equals("")&&!sigungu.equals("")&&depth.equals("2")){
			gdao.updateReadCountofTlist(contentid);
		}
		
		HashMap<String, Object> map = cService.getContentData(contentid);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("cdata", (ContentDTO)map.get("CDATA"));
		model.addAttribute("areaname", areaname);
		model.addAttribute("sigungu", sigungu);
		model.addAttribute("depth", depth);
		model.addAttribute("contentid", contentid);
		return "/layout/detail";
	}
	
	@RequestMapping("/tsearch.wd")
	public String tsearch(Model model,
						@RequestParam (value="depth", defaultValue="") String depth,
						@RequestParam(value="searchkey", defaultValue="") String searchkey){
		depth = "2";
		if(!searchkey.equals("")){
			return "forward:/category.wd?depth="+depth+"&searchkey="+searchkey;
		}else{
			return "redirect:/index";
		}
	}
	
	@RequestMapping("/goguide.wd")
	public String goguide(Model model ,@RequestParam (value="areaname", defaultValue="") String areaname){
		String addr = "";
		
		if(areaname.equals("제주도")){
			addr = "제주";
		}else{
			addr = areaname;
		}
		
		model.addAttribute("addr", addr);
		return "redirect:guideList.wd";
	}
	
}
