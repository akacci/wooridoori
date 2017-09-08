package com.wooridoori.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.QnABoardDAO;
import com.wooridoori.dto.QnABoardDTO;

@Service
public class QnABoardService {
	@Autowired
	QnABoardDAO qnaDao;
	/* 유저 QnA 글쓰기 */
	public void writeUserQnA(HttpSession session, QnABoardDTO qnaDto){
		qnaDto.setWriter((String)session.getAttribute("ID"));
		qnaDao.writeUserQnA(qnaDto);
	}

	/* 특정유저QnA찾기 */
	public Map<String, Object> getUserQnA(HttpSession session, int currentPage){
		String id = (String)session.getAttribute("ID");
		String id_num = (String)session.getAttribute("ID_NUM");
		//페이징 처리해봅시다
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

		//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
		int totalCount= qnaDao.getTotalCount(id_num);
		System.out.println("글 몇개 출력할꺼니"+totalCount);
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
		List<QnABoardDTO> list = qnaDao.getUserQnA(id, startNum, endNum, id_num);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("currentPage", currentPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalPage", totalPage);
		map.put("totalCount", totalCount);
		return map;
	}
}
