package com.project.yameokja.domain;

import java.sql.Timestamp;

public class Community {
	
	private String memberId;
	private String memberNickname;
	private int communityNo;
	private int categoryNo;
	private String communityTitle;
	private Timestamp communityRegDate;
	private int communityReplyCount;
	private int communityReadCount;
	private String communityContent;
	private String communityFile;
	private int communityParentNo;
	private int communityReReply;
	private String communityReplyTarget;
	private int partyMembers;
	private String partyMemberIds;
	private Timestamp partyDDay;
	private String partyPlace;
	
	public Community() {}

	public Community(String memberId, String memberNickname, int communityNo, int categoryNo, String communityTitle,
			Timestamp communityRegDate, int communityReplyCount, int communityReadCount, String communityContent,
			String communityFile, int communityParentNo, int communityReReply, String communityReplyTarget,
			int partyMembers, String partyMemberIds, Timestamp partyDDay, String partyPlace) {
	
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.communityNo = communityNo;
		this.categoryNo = categoryNo;
		this.communityTitle = communityTitle;
		this.communityRegDate = communityRegDate;
		this.communityReplyCount = communityReplyCount;
		this.communityReadCount = communityReadCount;
		this.communityContent = communityContent;
		this.communityFile = communityFile;
		this.communityParentNo = communityParentNo;
		this.communityReReply = communityReReply;
		this.communityReplyTarget = communityReplyTarget;
		this.partyMembers = partyMembers;
		this.partyMemberIds = partyMemberIds;
		this.partyDDay = partyDDay;
		this.partyPlace = partyPlace;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCommunityTitle() {
		return communityTitle;
	}

	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}

	public Timestamp getCommunityRegDate() {
		return communityRegDate;
	}

	public void setCommunityRegDate(Timestamp communityRegDate) {
		this.communityRegDate = communityRegDate;
	}

	public int getCommunityReplyCount() {
		return communityReplyCount;
	}

	public void setCommunityReplyCount(int communityReplyCount) {
		this.communityReplyCount = communityReplyCount;
	}

	public int getCommunityReadCount() {
		return communityReadCount;
	}

	public void setCommunityReadCount(int communityReadCount) {
		this.communityReadCount = communityReadCount;
	}

	public String getCommunityContent() {
		return communityContent;
	}

	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public String getCommunityFile() {
		return communityFile;
	}

	public void setCommunityFile(String communityFile) {
		this.communityFile = communityFile;
	}

	public int getCommunityParentNo() {
		return communityParentNo;
	}

	public void setCommunityParentNo(int communityParentNo) {
		this.communityParentNo = communityParentNo;
	}

	public int getCommunityReReply() {
		return communityReReply;
	}

	public void setCommunityReReply(int communityReReply) {
		this.communityReReply = communityReReply;
	}

	public String getCommunityReplyTarget() {
		return communityReplyTarget;
	}

	public void setCommunityReplyTarget(String communityReplyTarget) {
		this.communityReplyTarget = communityReplyTarget;
	}

	public int getPartyMembers() {
		return partyMembers;
	}

	public void setPartyMembers(int partyMembers) {
		this.partyMembers = partyMembers;
	}

	public String getpartyMemberIds() {
		return partyMemberIds;
	}

	public void setpartyMemberIds(String partyMemberIds) {
		this.partyMemberIds = partyMemberIds;
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
