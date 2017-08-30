package com.wooridoori.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String num;
	private String m_id;
	private String name;
	private String password;
	private String e_mail;
	private String nation;
	private String tel;
	private String guide;
	private String imagepath;
	private Timestamp cre_date;
	private Timestamp upd_date;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
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
