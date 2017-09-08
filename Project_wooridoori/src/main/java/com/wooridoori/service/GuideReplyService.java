package com.wooridoori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.GuideReplyDAO;
import com.wooridoori.dto.GuideReplyDTO;

@Service
public class GuideReplyService {
	@Autowired
	GuideReplyDAO grDAO;
	
	public void insertReply(GuideReplyDTO dto){
		grDAO.insertReply(dto);
	}
	public List<GuideReplyDTO> getReplyList(int num){
		return grDAO.getReplyList(num);
	}
	public int getReplyCount(int num){
		return grDAO.getReplyCount(num);
	}
}
