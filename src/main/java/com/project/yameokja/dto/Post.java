package com.project.yameokja.dto;

import java.sql.Timestamp;

public class Post {

	private int pNo;
	private String pContent;
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
	
	public Post() {}
	
	public Post(int pNo, String pContent, String pFile1, String pFile2, String pFile3, String pFile4, String pFile5,
			Timestamp pRegDate, String pIsPost, int pStar, int pUpCount, String pUpList) {
		this.pNo = pNo;
		this.pContent = pContent;
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
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
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
	
}
