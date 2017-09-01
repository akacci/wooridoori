package com.wooridoori.dto;

import java.sql.Timestamp;

public class RecommendAverageDTO {

	private String contentid;
	private String seq_member;
	private String m_id;
	/*private String category_1;
	private String category_2;
	private String category_3;
	private String contenttypeid;
	private String areacode;
	private String sigungucode;*/
	private String pre_score;
	private String pre_review;
	/*private Character firsttrip_yn;*/
	private Timestamp cre_date;
	private Timestamp upd_date;
	
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getSeq_member() {
		return seq_member;
	}
	public void setSeq_member(String seq_member) {
		this.seq_member = seq_member;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	/*public String getCategory_1() {
		return category_1;
	}
	public void setCategory_1(String category_1) {
		this.category_1 = category_1;
	}
	public String getCategory_2() {
		return category_2;
	}
	public void setCategory_2(String category_2) {
		this.category_2 = category_2;
	}
	public String getCategory_3() {
		return category_3;
	}
	public void setCategory_3(String category_3) {
		this.category_3 = category_3;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getAreacode() {
		return areacode;
	}
	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}
	public String getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(String sigungucode) {
		this.sigungucode = sigungucode;
	}*/
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
	/*public Character getFirsttrip_yn() {
		return firsttrip_yn;
	}
	public void setFirsttrip_yn(Character firsttrip_yn) {
		this.firsttrip_yn = firsttrip_yn;
	}*/
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
