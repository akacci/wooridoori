package com.wooridoori.dto;

import java.sql.Timestamp;

public class GuideReplyDTO {
	private int seq_reply;
	private int num;
	private String m_id;
	private String name;
	private String gr_content;
	private Timestamp cre_date;
	private Timestamp upd_date;
	public int getSeq_reply() {
		return seq_reply;
	}
	public void setSeq_reply(int seq_reply) {
		this.seq_reply = seq_reply;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getGr_content() {
		return gr_content;
	}
	public void setGr_content(String gr_content) {
		this.gr_content = gr_content;
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
