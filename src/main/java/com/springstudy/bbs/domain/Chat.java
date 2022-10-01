package com.springstudy.bbs.domain;

import java.sql.Timestamp;

public class Chat {

	private int chNo;
	private String chIds;
	private String chSender;
	private String chReceiver;
	private String chContent;
	private Timestamp chSendDate;
	private String chReadCheck;
	private int chLeaveCheck;
	
	
	public Chat() {}

	
	public Chat(int chNo, String chIds, String chSender, String chReceiver, String chContent, Timestamp chSendDate,
			String chReadCheck, int chLeaveCheck) {
		this.chNo = chNo;
		this.chIds = chIds;
		this.chSender = chSender;
		this.chReceiver = chReceiver;
		this.chContent = chContent;
		this.chSendDate = chSendDate;
		this.chReadCheck = chReadCheck;
		this.chLeaveCheck = chLeaveCheck;
	}


	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public String getChIds() {
		return chIds;
	}

	public void setChIds(String chIds) {
		this.chIds = chIds;
	}

	public String getChSender() {
		return chSender;
	}

	public void setChSender(String chSender) {
		this.chSender = chSender;
	}

	public String getChReceiver() {
		return chReceiver;
	}

	public void setChReceiver(String chReceiver) {
		this.chReceiver = chReceiver;
	}

	public String getChContent() {
		return chContent;
	}

	public void setChContent(String chContent) {
		this.chContent = chContent;
	}

	public Timestamp getChSendDate() {
		return chSendDate;
	}

	public void setChSendDate(Timestamp chSendDate) {
		this.chSendDate = chSendDate;
	}

	public String getChReadCheck() {
		return chReadCheck;
	}

	public void setChReadCheck(String chReadCheck) {
		this.chReadCheck = chReadCheck;
	}

	public int getChLeaveCheck() {
		return chLeaveCheck;
	}

	public void setChLeaveCheck(int chLeaveCheck) {
		this.chLeaveCheck = chLeaveCheck;
	}
	
	
}
