package com.wooridoori.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.GuideReservationDAO;
import com.wooridoori.dto.GuideReservationDTO;


@Service
public class GuideReservationService {
	@Autowired
	GuideReservationDAO grDAO;
	//로그인 유져 정보 데이터
		public Map<String, String> SelectLoginUserData(String id){
			Map<String, String> map = grDAO.SelectLoginUserData(id);
			return map;
		}
		
		//예약 정보 추가
		public void insertGuideReservation(GuideReservationDTO grdto){
			grDAO.insertGuideReservation(grdto);
		}
		//total count
		public int selectTotalReservation(String m_id){
			int cnt = grDAO.selectTotalReservation(m_id);
			return cnt;
		}
		
		//예약 리스트
		public List<GuideReservationDTO> selectReservationList(String m_id,int start, int end){
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_id", m_id);
			map.put("start", Integer.toString(start));
			map.put("end", Integer.toString(end));
			List<GuideReservationDTO> list = grDAO.selectReservationList(map);
			return list;
		}
		
		
		
		//가이드 예약 확인 파트
		//total count
		public int selectGuideTotalReservation(String m_id){
			int cnt = grDAO.selectGuideTotalReservation(m_id);
			return cnt;
		}
		
		//예약 리스트
		public List<GuideReservationDTO> selectGuideReservationList(String m_id,int start, int end){
			Map<String, String> map = new HashMap<String, String>();
			map.put("m_id", m_id);
			map.put("start", Integer.toString(start));
			map.put("end", Integer.toString(end));
			List<GuideReservationDTO> list = grDAO.selectGuideReservationList(map);
			return list;
		}
		
}
