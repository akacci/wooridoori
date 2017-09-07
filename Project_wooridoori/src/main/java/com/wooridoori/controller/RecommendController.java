package com.wooridoori.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wooridoori.dto.AreaCodeDTO;
import com.wooridoori.dto.ContentCodeDTO;
import com.wooridoori.dto.ReferenceDTO;
import com.wooridoori.dto.TourInquiryDTO;
import com.wooridoori.service.RecommendService;

@Controller
public class RecommendController {

	@Autowired
	RecommendService service;
	
	@RequestMapping("/recommend.wd")
	public String recommendTest(){
		return "Recommend/Recommend";
	}
	
	@RequestMapping(value="/re_body_area.wd", method=RequestMethod.POST)
	@ResponseBody
	public void recommendBodyArea(Model model,
								 HttpServletResponse response,
								 HttpSession session){			
		
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		response.setContentType("text/html;charset=UTF-8"); // 한글
		ObjectMapper mapper = new ObjectMapper();
		List<TourInquiryDTO> list = new ArrayList<TourInquiryDTO>();
		
		
		if(login.equals("YES")){
			list = service.selectLoginRecommendArea(id);
		}else{
			list = service.selectFirstRecommendArea();
		}
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/re_body_thema.wd", method=RequestMethod.POST)
	@ResponseBody
	public void recommendBodyThema(Model model,
								 HttpServletResponse response,
								 HttpSession session){		
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		response.setContentType("text/html;charset=UTF-8"); // 한글
		ObjectMapper mapper = new ObjectMapper();
		List<TourInquiryDTO> list = new ArrayList<TourInquiryDTO>();
		
		if(login.equals("YES")){
			list = service.selectLoginRecommendThema(id);
		}else{
			list = service.selectFirstRecommendThema();
		}
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/re_body_nonfavorite.wd", method=RequestMethod.POST)
	@ResponseBody
	public void recommendBodyNonFavorite(Model model,
								 		 HttpServletResponse response,
										 HttpSession session){	
		String login = (String)session.getAttribute("LOGIN") == null?"NO":(String)session.getAttribute("LOGIN");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		response.setContentType("text/html;charset=UTF-8"); // 한글
		ObjectMapper mapper = new ObjectMapper();
		List<TourInquiryDTO> list = new ArrayList<TourInquiryDTO>(); 
		
		if(login.equals("YES")){
			list = service.selectLoginRecommendNonFavorite(id);
		}else{
			list = service.selectFirstRecommendNonFavorite();
		}
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectareacode.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectAreaCode(Model model,
							   HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		List<AreaCodeDTO> list = service.selectAreaCode();

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectcodeoftourlist.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectCodeOfTourList(Model model,
										 @RequestParam(value="areacode[]", defaultValue="") List<String> areacode,
										 @RequestParam(value="themacode[]", defaultValue="") List<String> themacode,
										 @RequestParam(value="end") int end,
										 HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i = 0; i < areacode.size(); i++){
			if(areacode.get(i).equals("") || areacode.get(i) == null){
				areacode.remove(i);
			}
		}
		
		for(int i = 0; i < themacode.size(); i++){
			if(themacode.get(i).equals("") || themacode.get(i) == null){
				themacode.remove(i);
			}
		}
		
		map.put("areacode", areacode);
		map.put("themacode", themacode);
		map.put("end", end);
		
		List<TourInquiryDTO> list = service.selectCodeOfTourlist(map);

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*@RequestMapping(value="selectareacodeoftourlist.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectAreaCodeOfTourList(Model model,
										 @RequestParam(value="areacode[]") List<String> areacode,
							             HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("areacode", areacode);
		List<TourInquiryDTO> list = service.selectAreaCodeOfTourList(map);

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectcat2oftourlist.wd", method=RequestMethod.POST)
	@ResponseBody
	public void selectCat2OfTourlist(Model model,
										 @RequestParam(value="cat2[]") List<String> cat2,
							             HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat2", cat2);
		List<TourInquiryDTO> list = service.selectCat2OfTourlist(map);

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
	
	@RequestMapping(value="selectcontentcodename.wd", method=RequestMethod.POST)
	public void selectContentCode(Model model,
							      HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		List<ContentCodeDTO> list = service.selectContentCodeName();

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="tourinquiry_one.wd", method=RequestMethod.POST)
	public void selectTourInquiryOne(Model model,
									   @RequestParam(value="contentid") String contentid,
									   HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");//json 한글 깨짐때문에
		ObjectMapper mapper = new ObjectMapper();
		TourInquiryDTO tdto = service.selectTourInquiryOne(contentid);

		try {
			response.getWriter().print(mapper.writeValueAsString(tdto));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/select_data.wd", method=RequestMethod.POST)
	@ResponseBody
	public void select_data(@RequestParam(value="grade_point") Float grade_point, 
				@RequestParam(value="firsttrip", defaultValue="x") char firsttrip, 
				@RequestParam(value="bookmark", defaultValue="x") char bookmark,
				@RequestParam(value="contentid", defaultValue="x") String contentid,
				@RequestParam(value="pre_rence", defaultValue="x") char pre_rence,
				@RequestParam(value="grouptrip",defaultValue="x")String grouptrip,
				@RequestParam(value="age",defaultValue="0")String age,
				@RequestParam(value="purpose_code", defaultValue="no_code")String purpose_code,
				@RequestParam(value="stay_code", defaultValue="no_code")String stay_code,
				ReferenceDTO refdto,
				HttpSession session)
	{	
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		String m_id = id;		
		/*session.setAttribute("m_id", "adimn");*/
				
		refdto.setM_id(m_id);
		refdto.setContent_id(contentid);		
		refdto.setFirsttrip(firsttrip);
		refdto.setBookmark(bookmark);
		refdto.setPre_rence(pre_rence);
		refdto.setGrade_point(grade_point);
		refdto.setAge(age);
		refdto.setGrouptrip(grouptrip);
		refdto.setPurpose_code(purpose_code);
		refdto.setStay_code(stay_code);	
		
		System.out.println("------++++++++++++++++++------------"+refdto.getGrade_point());
		
		service.insertOrUpdateFirsttrip(refdto);
	}
	
	/*recommedn mypage*/
	
	@RequestMapping(value="re_mypage.wd")
	public String recommend_mypage()
	{
		return "mypage/Recommend_Mypage";
	}
	
	@RequestMapping(value="bubble_Data.wd", method=RequestMethod.POST)
	public void bubble_data(/*@RequestParam(value="currentPage", defaultValue="1") int currentPage,*/
							HttpSession session,
							HttpServletResponse response)
	{
		response.setContentType("text/html;charset=UTF-8");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		
		List<HashMap<String, Object>> list = service.bubble_Data(id);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
	@RequestMapping(value="paging_mypage.wd", method=RequestMethod.POST)
	public void paging_mypage(
							@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
							HttpServletResponse response,
							HttpSession session)
	{
			response.setContentType("text/html;charset=UTF-8");
			String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
			
			HashMap<String, Object> list = service.paging_Data(id,currentPage);
			ObjectMapper mapper = new ObjectMapper();
			
			try {
				response.getWriter().print(mapper.writeValueAsString(list));
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
	}
	
	@RequestMapping(value="barChartData.wd", method=RequestMethod.POST)
	public void barChart_Data(HttpSession session, HttpServletResponse response)
	{
		response.setContentType("text/html;charset=UTF-8");
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		List<HashMap<String, Object>> list = service.barCharts_Data(id);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="chart_BubbleData.wd", method=RequestMethod.POST)
	public void chart_Bubble(HttpSession session, HttpServletResponse response)
	{
		String id = (String)session.getAttribute("ID") == null?"GUEST":(String)session.getAttribute("ID");
		response.setContentType("text/html;charset=UTF-8");
		List<ReferenceDTO> list = service.bubble_Count(id);		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*@RequestMapping(value="openBoardList.wd")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/sample/boardList");
	     
	    return mv;
	}
	 
	@RequestMapping(value="/sample/selectBoardList.do")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	     
	    List<Map<String,Object>> list = sampleService.selectBoardList(commandMap.getMap());
	    mv.addObject("list", list);
	    if(list.size() > 0){
	        mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    }
	    else{
	        mv.addObject("TOTAL", 0);
	    }
	     
	    return mv;
	}*/

}
