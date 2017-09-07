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
	
	/* Member */
	public List<MemberDTO> getAllMemberList(){
		List<MemberDTO> list = getSqlSession().selectList("qna_admin.getAllMemberList");
		return list;
	}
	
	public String doDeleteMember(String wnum){
		getSqlSession().delete("member.doDeleteMember", wnum);
		String data = "'adminMemberList.wd'";
		return data;
	}
}
