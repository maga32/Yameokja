package com.project.yameokja.dto;

import java.sql.Timestamp;

public class Member {
	private String mbName;
	private String mbPhoto;
	private String mbId;
	private String mbNickname;
	private String mbPassword;
	private String mbEmail;
	private String mbAddress;
	private String mbMobile;
	private String mbBookmarks;
	private Timestamp mbJoinDate;
	private Timestamp mbDelDate;
	private String mbFavoriteCategory;
	private int mbLevel;
	private String mbBlockIds;
	
	
	public Member() {	}
	
	
	public Member(String mbName, String mbPhoto, String mbId, String mbNickname, String mbPassword, String mbEmail,
			String mbAddress, String mbMobile, String mbBookmarks, Timestamp mbJoinDate, Timestamp mbDelDate,
			String mbFavoriteCategory, int mbLevel, String mbBlockIds) {

		this.mbName = mbName;
		this.mbPhoto = mbPhoto;
		this.mbId = mbId;
		this.mbNickname = mbNickname;
		this.mbPassword = mbPassword;
		this.mbEmail = mbEmail;
		this.mbAddress = mbAddress;
		this.mbMobile = mbMobile;
		this.mbBookmarks = mbBookmarks;
		this.mbJoinDate = mbJoinDate;
		this.mbDelDate = mbDelDate;
		this.mbFavoriteCategory = mbFavoriteCategory;
		this.mbLevel = mbLevel;
		this.mbBlockIds = mbBlockIds;
	}
	public String getMbName() {
		return mbName;
	}
	public void setMbName(String mbName) {
		this.mbName = mbName;
	}
	public String getMbPhoto() {
		return mbPhoto;
	}
	public void setMbPhoto(String mbPhoto) {
		this.mbPhoto = mbPhoto;
	}
	public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public String getMbNickname() {
		return mbNickname;
	}
	public void setMbNickname(String mbNickname) {
		this.mbNickname = mbNickname;
	}
	public String getMbPassword() {
		return mbPassword;
	}
	public void setMbPassword(String mbPassword) {
		this.mbPassword = mbPassword;
	}
	public String getMbEmail() {
		return mbEmail;
	}
	public void setMbEmail(String mbEmail) {
		this.mbEmail = mbEmail;
	}
	public String getMbAddress() {
		return mbAddress;
	}
	public void setMbAddress(String mbAddress) {
		this.mbAddress = mbAddress;
	}
	public String getMbMobile() {
		return mbMobile;
	}
	public void setMbMobile(String mbMobile) {
		this.mbMobile = mbMobile;
	}
	public String getmbBookmarks() {
		return mbBookmarks;
	}
	public void setmbBookmarks(String mbBookmarks) {
		this.mbBookmarks = mbBookmarks;
	}
	public Timestamp getMbJoinDate() {
		return mbJoinDate;
	}
	public void setMbJoinDate(Timestamp mbJoinDate) {
		this.mbJoinDate = mbJoinDate;
	}
	public Timestamp getMbDelDate() {
		return mbDelDate;
	}
	public void setMbDelDate(Timestamp mbDelDate) {
		this.mbDelDate = mbDelDate;
	}
	public String getMbFavoriteCategory() {
		return mbFavoriteCategory;
	}
	public void setMbFavoriteCategory(String mbFavoriteCategory) {
		this.mbFavoriteCategory = mbFavoriteCategory;
	}
	public int getMbLevel() {
		return mbLevel;
	}
	public void setMbLevel(int mbLevel) {
		this.mbLevel = mbLevel;
	}
	public String getMbBlockIds() {
		return mbBlockIds;
	}
	public void setMbBlockIds(String mbBlockIds) {
		this.mbBlockIds = mbBlockIds;
	}
	
}
