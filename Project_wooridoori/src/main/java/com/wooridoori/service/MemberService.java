package com.wooridoori.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.GuideDAO;
import com.wooridoori.dao.MemberDAO;
import com.wooridoori.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mDao;
	@Autowired
	GuideDAO gDao;

	
	public MemberDTO getMemberInfo(String id){
		return mDao.getMemberInfo(id);
	}
	public void updateMemberPic(MemberDTO dto){
		mDao.updateMemberPic(dto);
	}
	
	/////////////////////////////////////////////////////////
	public List<String> getNation(){
		List<String> list = mDao.getNation();		
		return list;
	}
	
	public String beforeAddress(HttpServletRequest request){
		String referrer = request.getHeader("Referer");
		
		request.getSession().setAttribute("prevPage", referrer);
	    String addr = "";
	    if(referrer.indexOf("?")!=-1){
	    	addr = referrer.substring(referrer.indexOf("=")+1);
	    }
	    System.out.println(addr);
	    return addr;
	}

	public void memberInsert(MemberDTO mdto){
		mDao.memberInsert(mdto);
	}
	
	public boolean idCheck(String id){
		return mDao.idCheck(id);
	}
	
	public boolean loginCheck(MemberDTO mdto){
		return mDao.loginCheck(mdto);
	}
}