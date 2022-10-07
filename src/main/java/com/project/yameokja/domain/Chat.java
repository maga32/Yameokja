package com.project.yameokja.domain;

import java.sql.Timestamp;

public class Chat {

	private int chatNo;
	private String chatIds;
	private String chatSender;
	private String chatReceiver;
	private String chatContent;
	private Timestamp chatSendDate;
	private String chatReadCheck;
	private int chatLeaveCheck;
	
	public Chat() {}

	public Chat(int chatNo, String chatIds, String chatSender, String chatReceiver, String chatContent,
			Timestamp chatSendDate, String chatReadCheck, int chatLeaveCheck) {
		
		this.chatNo = chatNo;
		this.chatIds = chatIds;
		this.chatSender = chatSender;
		this.chatReceiver = chatReceiver;
		this.chatContent = chatContent;
		this.chatSendDate = chatSendDate;
		this.chatReadCheck = chatReadCheck;
		this.chatLeaveCheck = chatLeaveCheck;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getChatIds() {
		return chatIds;
	}

	public void setChatIds(String chatIds) {
		this.chatIds = chatIds;
	}

	public String getChatSender() {
		return chatSender;
	}

	public void setChatSender(String chatSender) {
		this.chatSender = chatSender;
	}

	public String getChatReceiver() {
		return chatReceiver;
	}

	public void setChatReceiver(String chatReceiver) {
		this.chatReceiver = chatReceiver;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Timestamp getChatSendDate() {
		return chatSendDate;
	}

	public void setChatSendDate(Timestamp chatSendDate) {
		this.chatSendDate = chatSendDate;
	}

	public String getChatReadCheck() {
		return chatReadCheck;
	}

	public void setChatReadCheck(String chatReadCheck) {
		this.chatReadCheck = chatReadCheck;
	}

	public int getChatLeaveCheck() {
		return chatLeaveCheck;
	}

	public void setChatLeaveCheck(int chatLeaveCheck) {
		this.chatLeaveCheck = chatLeaveCheck;
	}



	
}
