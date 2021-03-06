package com.wooridoori.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.wooridoori.dto.GuideScoreDTO;

public class GuideScoreDAO extends SqlSessionDaoSupport {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void guideScoreInsert(GuideScoreDTO dto){
		sqlSessionTemplate.insert("guideScore.guideScoreInsert",dto);
	}
	public int guideIsRated(GuideScoreDTO dto){
		return sqlSessionTemplate.selectOne("guideScore.isRated",dto);
	}
	public void guideScoreUpdate(GuideScoreDTO dto){
		sqlSessionTemplate.update("guideScore.guideScoreUpdate",dto);
	}
	public float guideScoreAverage(int num){
		return sqlSessionTemplate.selectOne("guideScore.guideScoreAvg", num);
	}
	public void guideRate(GuideScoreDTO dto){
		sqlSessionTemplate.update("guideScore.guideRate",dto);
	}
	
	public String guideRateCount(int num){
		return sqlSessionTemplate.selectOne("guideScore.guideRateCount",num);
	}
	
}
