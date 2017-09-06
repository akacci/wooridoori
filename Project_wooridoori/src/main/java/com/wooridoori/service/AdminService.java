package com.wooridoori.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.AdminDAO;
import com.wooridoori.dto.MemberDTO;
import com.wooridoori.dto.QnABoardDTO;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDao;
	
	/* QnA */
	public List<QnABoardDTO> getQnABoardList_ten(){
		List<QnABoardDTO> list = adminDao.getQnABoardList_ten();
		return list;
	}
	public int getnoncheckcount(){
		return adminDao.getnoncheckcount();
	}
	public HashMap<String, String> getQnAKindCount(){
		List<HashMap<String, String>> list = adminDao.getQnAKindCount();
		HashMap<String, String> map = new HashMap<String, String>();
		for(HashMap<String, String> lmap : list){
			if(lmap.get("KIND").equals("1")&&lmap.get("KIND")!=null){
				map.put("n", String.valueOf(lmap.get("C")));
			}
			if(lmap.get("KIND").equals("2")&&lmap.get("KIND")!=null){
				map.put("m", String.valueOf(lmap.get("C")));
			}
			if(lmap.get("KIND").equals("3")&&lmap.get("KIND")!=null){
				map.put("r", String.valueOf(lmap.get("C")));
			}
		}
		return map;
	}
	
	/* Member */
	public List<MemberDTO> getAllMemberList(){
		return adminDao.getAllMemberList();
	}
}