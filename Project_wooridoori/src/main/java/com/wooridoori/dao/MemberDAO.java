package com.wooridoori.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.MemberDTO;

public class MemberDAO extends SqlSessionDaoSupport{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//Member Info
	public MemberDTO getMemberInfo(String id){
		return sqlSessionTemplate.selectOne("member.selectInfoOfMember", id);
	}

	//Member pic
	public void updateMemberPic(MemberDTO dto){
		sqlSessionTemplate.insert("member.updatePicOfMember",dto);
	}



	public void memberInsert(MemberDTO mdto){
		sqlSessionTemplate.update("member.memberInsert", mdto);
	}

	public boolean idCheck(String id){
		int result = sqlSessionTemplate.selectOne("member.idCheck", id);
		return result==0?false:true;
	}

	public boolean loginCheck(MemberDTO mdto){
		int result = sqlSessionTemplate.selectOne("member.loginCheck", mdto);
		return result==0?false:true;
	}
	public List<String> getNation(){
			List<String> list = sqlSessionTemplate.selectList("member.getNation");
			return list;
	}
}
