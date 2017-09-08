package com.wooridoori.dto;
import java.sql.Timestamp;

public class GuideReservationDTO {
 
	private String seq_reservation;
   private String seq_guide; 
   private String m_id;
   private String gr_thema;
   private String gr_name;
   private String gr_tel;
   private String gr_day;
   private String gr_price;
   private String gr_addr;
   private String gr_meet_addr;
   private String gr_meet_time;
   private Timestamp cre_date;
   private Timestamp upd_date;
   
   
   
 public String getGr_addr() {
	return gr_addr;
}
public void setGr_addr(String gr_addr) {
	this.gr_addr = gr_addr;
}
public String getSeq_reservation() {
	return seq_reservation;
}
public void setSeq_reservation(String seq_reservation) {
	this.seq_reservation = seq_reservation;
}

 public String getSeq_guide() {
	return seq_guide;
}
public void setSeq_guide(String seq_guide) {
	this.seq_guide = seq_guide;
}
public String getM_id() {
  return m_id;
 }
 public void setM_id(String m_id) {
  this.m_id = m_id;
 }
 public String getGr_thema() {
  return gr_thema;
 }
 public void setGr_thema(String gr_thema) {
  this.gr_thema = gr_thema;
 }
 public String getGr_name() {
  return gr_name;
 }
 public void setGr_name(String gr_name) {
  this.gr_name = gr_name;
 }
 public String getGr_tel() {
  return gr_tel;
 }
 public void setGr_tel(String gr_tel) {
  this.gr_tel = gr_tel;
 }
 public String getGr_day() {
  return gr_day;
 }
 public void setGr_day(String gr_day) {
  this.gr_day = gr_day;
 }
 public String getGr_price() {
  return gr_price;
 }
 public void setGr_price(String gr_price) {
  this.gr_price = gr_price;
 }
 public String getGr_meet_addr() {
  return gr_meet_addr;
 }
 public void setGr_meet_addr(String gr_meet_addr) {
  this.gr_meet_addr = gr_meet_addr;
 }
 public String getGr_meet_time() {
  return gr_meet_time;
 }
 public void setGr_meet_time(String gr_meet_time) {
  this.gr_meet_time = gr_meet_time;
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
