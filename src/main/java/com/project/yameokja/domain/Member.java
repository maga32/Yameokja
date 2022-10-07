package com.project.yameokja.domain;

import java.sql.Timestamp;

public class Member {
	private String memberName;
	private String memberPhoto;
	private String memberId;
	private String memberNickname;
	private String memberPassword;
	private String memberEmail;
	private String memberAddress;
	private String memberMobile;
	private String memberBookmarks;
	private Timestamp memberJoinDate;
	private Timestamp memberDelDate;
	private String memberFavoriteCategory;
	private int memberLevel;
	private String memberBlockIds;
	
	
	public Member() {	}


	public Member(String memberName, String memberPhoto, String memberId, String memberNickname, String memberPassword,
			String memberEmail, String memberAddress, String memberMobile, String memberBookmarks,
			Timestamp memberJoinDate, Timestamp memberDelDate, String memberFavoriteCategory, int memberLevel,
			String memberBlockIds) {
		
		this.memberName = memberName;
		this.memberPhoto = memberPhoto;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.memberPassword = memberPassword;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberMobile = memberMobile;
		this.memberBookmarks = memberBookmarks;
		this.memberJoinDate = memberJoinDate;
		this.memberDelDate = memberDelDate;
		this.memberFavoriteCategory = memberFavoriteCategory;
		this.memberLevel = memberLevel;
		this.memberBlockIds = memberBlockIds;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberPhoto() {
		return memberPhoto;
	}


	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
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


	public String getMemberPassword() {
		return memberPassword;
	}


	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberAddress() {
		return memberAddress;
	}


	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}


	public String getMemberMobile() {
		return memberMobile;
	}


	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}


	public String getMemberBookmarks() {
		return memberBookmarks;
	}


	public void setMemberBookmarks(String memberBookmarks) {
		this.memberBookmarks = memberBookmarks;
	}


	public Timestamp getMemberJoinDate() {
		return memberJoinDate;
	}


	public void setMemberJoinDate(Timestamp memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}


	public Timestamp getMemberDelDate() {
		return memberDelDate;
	}


	public void setMemberDelDate(Timestamp memberDelDate) {
		this.memberDelDate = memberDelDate;
	}


	public String getMemberFavoriteCategory() {
		return memberFavoriteCategory;
	}


	public void setMemberFavoriteCategory(String memberFavoriteCategory) {
		this.memberFavoriteCategory = memberFavoriteCategory;
	}


	public int getMemberLevel() {
		return memberLevel;
	}


	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}


	public String getMemberBlockIds() {
		return memberBlockIds;
	}


	public void setMemberBlockIds(String memberBlockIds) {
		this.memberBlockIds = memberBlockIds;
	}

	
}
