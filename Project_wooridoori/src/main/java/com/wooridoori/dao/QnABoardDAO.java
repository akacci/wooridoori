package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.QnABoardDTO;

public class QnABoardDAO extends SqlSessionDaoSupport{
	
	//	유저글쓰기
	public void writeUserQnA(QnABoardDTO qnaDto){
		getSqlSession().insert("qnaboard.writerUserQnABoard", qnaDto);
	}
	//	특정유저글찾기
	public List<QnABoardDTO> getUserQnA(String id,  int startNum, int endNum){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<QnABoardDTO> list = getSqlSession().selectList("qnaboard.getUserQnA", map);
		return list;
	}
	//	특정유저글수
	public int getTotalCount(String id){
		return getSqlSession().selectOne("qnaboard.getTotalCount", id);
	}
}
