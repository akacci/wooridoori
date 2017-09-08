package com.wooridoori.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooridoori.dto.MemberDTO;
import com.wooridoori.dto.QnABoardDTO;
import com.wooridoori.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("admin.wd")
	public String goAdminPage(Model model){
		List<QnABoardDTO> qlist = adminService.getQnABoardList_ten();
		List<MemberDTO> mlist = adminService.getAllMemberList();
		HashMap<String, String> kmap = adminService.getQnAKindCount();
		model.addAttribute("r", kmap.get("r"));
		model.addAttribute("m", kmap.get("m"));
		model.addAttribute("n", kmap.get("n"));
		model.addAttribute("qlist", qlist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("noncheckCount", adminService.getnoncheckcount());
		return "Admin/adminPage";
	}


	@RequestMapping("adminGuideList.wd")
	public String goAdminGuideList(Model model){
		return "Admin/adminGuideList";
	}
	@RequestMapping("adminMemberList.wd")
	public String goAdminMemberList(Model model, 
			@RequestParam(value="pageNum",defaultValue="1")int currentPage){
		
		int totalCount=adminService.getWTotalCount();
		//페이징 처리에 필요한 변수들	
		int perPage=20; //한페이지당 보여지는 글의 갯수
		int perBlock=10; //한블럭당 보여지는 페이지번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호
		//총 페이지수
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
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

		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no=totalCount-((currentPage-1)*perPage);
		
		List<MemberDTO> mlist = adminService.getAllMemberList2(startNum, endNum);
		String depth="0";
		model.addAttribute("depth", depth);
		model.addAttribute("no", no);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("mlist", mlist);
		return "Admin/adminMemberList";
	}
	
	@RequestMapping("deleteMember.wd")
	public String doDeleteMember(Model model, @RequestParam(value="wnum", defaultValue="") String wnum ){
		String data1 = adminService.doDeleteMember(wnum);
		model.addAttribute("data1", data1);
		return "redirect:mypage.wd";
	}
	
	@RequestMapping("wSearch.wd")
	public String doSearchMember(Model model, 
			@RequestParam(value="searchkey", defaultValue="") String searchkey,
			@RequestParam(value="pageNum",defaultValue="1")int currentPage){
		
		String data2 = "'adminSearchList.wd?searchkey='";
		
		model.addAttribute("searchkey", searchkey);
		model.addAttribute("data2", data2);
		return "redirect:mypage.wd";
	}
	
	@RequestMapping("adminSearchList.wd")
	public String doSearchMember2(Model model,
			@RequestParam(value="searchkey", defaultValue="") String searchkey,
			@RequestParam(value="pageNum",defaultValue="1")int currentPage){
		int totalCount=adminService.doSearchCount();
		//페이징 처리에 필요한 변수들	
		int perPage=20; //한페이지당 보여지는 글의 갯수
		int perBlock=10; //한블럭당 보여지는 페이지번호의 수
		int totalPage; //총 페이지의 갯수
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호
		//총 페이지수
		totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
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

		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		no=totalCount-((currentPage-1)*perPage);
		List<MemberDTO> mlist = adminService.doSearchMember(searchkey, startNum, endNum);
		model.addAttribute("no", no);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("searchkey", searchkey);
		model.addAttribute("mlist", mlist);
		
		return "Admin/adminMemberList";
	}
	@RequestMapping("adminQnAList.wd")
	public String goAdminQnAList(Model model){
		HashMap<String, String> kmap = adminService.getQnAKindCount();
		model.addAttribute("r", kmap.get("r"));
		model.addAttribute("m", kmap.get("m"));
		model.addAttribute("n", kmap.get("n"));
		model.addAttribute("list", adminService.getQnAList());
		return "Admin/adminQnAList";
	}
	@RequestMapping("answer_qnawrite.wd")



	public @ResponseBody String goAdminQnAWrite(Model model, HttpServletRequest request, @ModelAttribute QnABoardDTO qnaDto, @RequestParam String content_qna){
		System.out.println(qnaDto.getNum());
		adminService.writeAnswer(qnaDto, content_qna);
		return "adminQnAList.wd";
	}


	@RequestMapping("answerqna.wd")
	public String goAdminQnAWrite(Model model, @RequestParam String num){
		
		model.addAttribute("data",adminService.getQnABoard(num));
		return "Admin/adminQnAwrite";
	}
}
