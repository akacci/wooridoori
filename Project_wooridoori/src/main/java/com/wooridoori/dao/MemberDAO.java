package com.wooridoori.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.MemberDTO;

public class MemberDAO extends SqlSessionDaoSupport{
	
	public void memberInsert(MemberDTO mdto){
		getSqlSession().update("memberInsert", mdto);
	}
	
	public boolean idCheck(String id){
		int result = getSqlSession().selectOne("idCheck", id);
		return result==0?false:true;
	}
	
	public boolean loginCheck(MemberDTO mdto){
		int result = getSqlSession().selectOne("loginCheck", mdto);
		return result==0?false:true;
	}
	
}
