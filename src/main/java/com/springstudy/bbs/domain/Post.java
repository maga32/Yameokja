package com.springstudy.bbs.domain;

import java.sql.Timestamp;

public class Post {

	private int pNo;
	private int stNo;
	private String pTitle;
	private String pContent;
	private int pReadCount; 
	private String pFile1;
	private String pFile2;
	private String pFile3;
	private String pFile4;
	private String pFile5;
	private Timestamp pRegDate;
	private String pIsPost;
	private int pStar;
	private int pUpCount;
	private String pUpList;
	private String mbId;
	private String mbNickname;
	
	public Post() {}

	public Post(int pNo, int stNo, String pTitle, String pContent, int pReadCount, String pFile1, String pFile2,
			String pFile3, String pFile4, String pFile5, Timestamp pRegDate, String pIsPost, int pStar, int pUpCount,
			String pUpList, String mbId, String mbNickname) {
		this.pNo = pNo;
		this.stNo = stNo;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pReadCount = pReadCount;
		this.pFile1 = pFile1;
		this.pFile2 = pFile2;
		this.pFile3 = pFile3;
		this.pFile4 = pFile4;
		this.pFile5 = pFile5;
		this.pRegDate = pRegDate;
		this.pIsPost = pIsPost;
		this.pStar = pStar;
		this.pUpCount = pUpCount;
		this.pUpList = pUpList;
		this.mbId = mbId;
		this.mbNickname = mbNickname;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getStNo() {
		return stNo;
	}

	public void setStNo(int stNo) {
		this.stNo = stNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getpReadCount() {
		return pReadCount;
	}

	public void setpReadCount(int pReadCount) {
		this.pReadCount = pReadCount;
	}

	public String getpFile1() {
		return pFile1;
	}

	public void setpFile1(String pFile1) {
		this.pFile1 = pFile1;
	}

	public String getpFile2() {
		return pFile2;
	}

	public void setpFile2(String pFile2) {
		this.pFile2 = pFile2;
	}

	public String getpFile3() {
		return pFile3;
	}

	public void setpFile3(String pFile3) {
		this.pFile3 = pFile3;
	}

	public String getpFile4() {
		return pFile4;
	}

	public void setpFile4(String pFile4) {
		this.pFile4 = pFile4;
	}

	public String getpFile5() {
		return pFile5;
	}

	public void setpFile5(String pFile5) {
		this.pFile5 = pFile5;
	}

	public Timestamp getpRegDate() {
		return pRegDate;
	}

	public void setpRegDate(Timestamp pRegDate) {
		this.pRegDate = pRegDate;
	}

	public String getpIsPost() {
		return pIsPost;
	}

	public void setpIsPost(String pIsPost) {
		this.pIsPost = pIsPost;
	}

	public int getpStar() {
		return pStar;
	}

	public void setpStar(int pStar) {
		this.pStar = pStar;
	}

	public int getpUpCount() {
		return pUpCount;
	}

	public void setpUpCount(int pUpCount) {
		this.pUpCount = pUpCount;
	}

	public String getpUpList() {
		return pUpList;
	}

	public void setpUpList(String pUpList) {
		this.pUpList = pUpList;
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
	
	
	
	
	
}
