package com.wooridoori.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class GuideDAO extends SqlSessionDaoSupport{
	public void test(){
		System.out.println("dao에 들어온다.");
	}
}
