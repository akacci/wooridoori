package com.wooridoori.dto;

import java.util.Date;

public class QnABoardDTO {
	private String num;
	private String title;
	private String content;
	private String writer;
	private Date wdate;
	private String acheck;
	private String anum;
	private String kind;
	private String deleteboard;
	public String getNum() {
		return num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public String getAcheck() {
		return acheck;
	}
	public void setAcheck(String acheck) {
		this.acheck = acheck;
	}
	public String getAnum() {
		return anum;
	}
	public void setAnum(String anum) {
		this.anum = anum;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getDeleteboard() {
		return deleteboard;
	}
	public void setDeleteboard(String deleteboard) {
		this.deleteboard = deleteboard;
	}
	@Override
	public String toString() {
		return "QnABoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", wdate=" + wdate + ", acheck=" + acheck + ", anum=" + anum + ", kind=" + kind + ", deleteboard="
				+ deleteboard + "]";
	}
}
