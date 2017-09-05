package com.wooridoori.dto;

import java.sql.Timestamp;

public class RecommendAverageDTO {

	private String contentid;
	private String m_id;
	private String pre_score;
	private String pre_review;
	private String visit_yn;
	private Timestamp cre_date;
	private Timestamp upd_date;
	
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getPre_score() {
		return pre_score;
	}
	public void setPre_score(String pre_score) {
		this.pre_score = pre_score;
	}
	public String getPre_review() {
		return pre_review;
	}
	public void setPre_review(String pre_review) {
		this.pre_review = pre_review;
	}
	public String getvisit_yn() {
		return visit_yn;
	}
	public void setvisit_yn(String visit_yn) {
		this.visit_yn = visit_yn;
	}
	public Timestamp getCre_date() {
		return cre_date;
	}
	public void setCre_date(Timestamp cre_date) {
		this.cre_date = cre_date;
	}
	public Timestamp getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(Timestamp upd_date) {
		this.upd_date = upd_date;
	}
	
}
