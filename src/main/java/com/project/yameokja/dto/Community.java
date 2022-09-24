package com.project.yameokja.dto;

import java.sql.Timestamp;

public class Community {
	
	private int coNo;
	private String coTitle;
	private Timestamp coRegDate;
	private int coReplyCount;
	private int coReadCount;
	private String coContent;
	private String coFile;
	private int coParentNo;
	private int coReReply;
	private String coReplyTarget;
	private int partyMembers;
	private String partyMbIds;
	private Timestamp partyDDay;
	private String partyPlace;
	
		
	public Community() {}

	public Community(int coNo, String coTitle, Timestamp coRegDate, int coReplyCount, int coReadCount, String coContent,
			String coFile, int coParentNo, int coReReply, String coReplyTarget, int partyMembers, String partyMbIds,
			Timestamp partyDDay, String partyPlace) {
		this.coNo = coNo;
		this.coTitle = coTitle;
		this.coRegDate = coRegDate;
		this.coReplyCount = coReplyCount;
		this.coReadCount = coReadCount;
		this.coContent = coContent;
		this.coFile = coFile;
		this.coParentNo = coParentNo;
		this.coReReply = coReReply;
		this.coReplyTarget = coReplyTarget;
		this.partyMembers = partyMembers;
		this.partyMbIds = partyMbIds;
		this.partyDDay = partyDDay;
		this.partyPlace = partyPlace;
	}

	public int getCoNo() {
		return coNo;
	}

	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}

	public String getCoTitle() {
		return coTitle;
	}

	public void setCoTitle(String coTitle) {
		this.coTitle = coTitle;
	}

	public Timestamp getCoRegDate() {
		return coRegDate;
	}

	public void setCoRegDate(Timestamp coRegDate) {
		this.coRegDate = coRegDate;
	}

	public int getCoReplyCount() {
		return coReplyCount;
	}

	public void setCoReplyCount(int coReplyCount) {
		this.coReplyCount = coReplyCount;
	}

	public int getCoReadCount() {
		return coReadCount;
	}

	public void setCoReadCount(int coReadCount) {
		this.coReadCount = coReadCount;
	}

	public String getCoContent() {
		return coContent;
	}

	public void setCoContent(String coContent) {
		this.coContent = coContent;
	}

	public String getCoFile() {
		return coFile;
	}

	public void setCoFile(String coFile) {
		this.coFile = coFile;
	}

	public int getCoParentNo() {
		return coParentNo;
	}

	public void setCoParentNo(int coParentNo) {
		this.coParentNo = coParentNo;
	}

	public int getCoReReply() {
		return coReReply;
	}

	public void setCoReReply(int coReReply) {
		this.coReReply = coReReply;
	}

	public String getCoReplyTarget() {
		return coReplyTarget;
	}

	public void setCoReplyTarget(String coReplyTarget) {
		this.coReplyTarget = coReplyTarget;
	}

	public int getPartyMembers() {
		return partyMembers;
	}

	public void setPartyMembers(int partyMembers) {
		this.partyMembers = partyMembers;
	}

	public String getPartyMbIds() {
		return partyMbIds;
	}

	public void setPartyMbIds(String partyMbIds) {
		this.partyMbIds = partyMbIds;
	}

	public Timestamp getPartyDDay() {
		return partyDDay;
	}

	public void setPartyDDay(Timestamp partyDDay) {
		this.partyDDay = partyDDay;
	}

	public String getPartyPlace() {
		return partyPlace;
	}

	public void setPartyPlace(String partyPlace) {
		this.partyPlace = partyPlace;
	}
	
}
