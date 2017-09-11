package com.wooridoori.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.GuideReservationDTO;

public class GuideReservationDAO extends SqlSessionDaoSupport {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//로그인 유져 정보 데이터
	public Map<String, String> SelectLoginUserData(String id){
		Map<String, String> map = sqlSessionTemplate.selectOne("guideReservation.selectLoginUserData", id);
		return map;
	}
	
	//예약 정보 추가
	public void insertGuideReservation(GuideReservationDTO grdto){
		sqlSessionTemplate.insert("guideReservation.insertGuideReservation", grdto);
	}
	
	//total count
	public int selectTotalReservation(String m_id){
		int cnt = sqlSessionTemplate.selectOne("selectTotalReservation",m_id);
		return cnt;
	}
	
	//예약 리스트
	public List<GuideReservationDTO> selectReservationList(Map<String, String> map){
		List<GuideReservationDTO> list = sqlSessionTemplate.selectList("selectReservationList", map);
		return list;
	}
	
	//가이드 예약 확인 파트
	//total count
	public int selectGuideTotalReservation(String m_id){
		int cnt = sqlSessionTemplate.selectOne("selectGuideTotalReservation",m_id);
		return cnt;
	}
	
	//예약 리스트
	public List<GuideReservationDTO> selectGuideReservationList(Map<String, String> map){
		List<GuideReservationDTO> list = sqlSessionTemplate.selectList("selectGuideReservationList", map);
		return list;
	}

	
	
}
