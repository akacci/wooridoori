package com.wooridoori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wooridoori.dto.MemberDTO;
import com.wooridoori.dto.QnABoardDTO;

public class AdminDAO extends SqlSessionDaoSupport{
	/* QnA */
	public List<QnABoardDTO> getQnABoardList_ten(){
		List<QnABoardDTO> list = getSqlSession().selectList("qna_admin.getqnalist_noncheck_top");
		return list;
	}
	public int getnoncheckcount(){
		return getSqlSession().selectOne("qna_admin.getnoncheckcount");
	}
	public List<HashMap<String, String>> getQnAKindCount(){
		List<HashMap<String, String>> list = getSqlSession().selectList("qna_admin.getQnAKindCount");
		System.out.println(list);
		
		return list;
	}
	public List<QnABoardDTO> getQnAList(){
		return getSqlSession().selectList("qna_admin.getAllQnAList");
	}
	public QnABoardDTO getQnABoard(String num){
		return getSqlSession().selectOne("qna_admin.getQnABoard", num);
	}
	public void writeAnswer(QnABoardDTO qnaDto){
		getSqlSession().update("qnaboard.writeAnswer", qnaDto);
	}
	
	/* Member */
	
	public int getWTotalCount(){
		int totalCount = getSqlSession().selectOne("qna_admin.getWTotalCount");
		return totalCount;
	}
	
	public List<MemberDTO> getAllMemberList(){
		List<MemberDTO> list = getSqlSession().selectList("qna_admin.getAllMemberList");
		return list;
	}
	
	public List<MemberDTO> getAllMemberList2(HashMap<String , Object> map){
		
		List<MemberDTO> list = getSqlSession().selectList("qna_admin.getAllMemberList2", map);
		return list;
	}
	
	public String doDeleteMember(String wnum){
		getSqlSession().delete("member.doDeleteMember", wnum);
		String data = "'adminMemberList.wd'";
		return data;
	}
	
	public int doSearchCount(){
		int totalCount = getSqlSession().selectOne("qna_admin.doSearchCount");
		return totalCount;
	}
	
	public List<MemberDTO> doSearchMember(HashMap<String , Object> map){
		List<MemberDTO> list = getSqlSession().selectList("qna_admin.doSearchMember",map);
		return list;
	}
}
