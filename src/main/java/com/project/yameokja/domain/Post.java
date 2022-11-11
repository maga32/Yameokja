package com.project.yameokja.domain;

import java.sql.Timestamp;

public class Post {

	private int postNo;
	private int storeNo;
	private String postTitle;
	private String postContent;
	private int postReadCount; 
	private String postFile1;
	private String postFile2;
	private String postFile3;
	private String postFile4;
	private String postFile5;
	private Timestamp postRegDate;
	private String postIsPost;
	private int postStar;
	private int postUpCount;
	private String postUpList;
	private String memberId;
	private String memberNickname;
	
	public Post() {}

	public Post(int postNo, int storeNo, String postTitle, String postContent, int postReadCount, String postFile1,
			String postFile2, String postFile3, String postFile4, String postFile5, Timestamp postRegDate,
			String postIsPost, int postStar, int postUpCount, String postUpList, String memberId,
			String memberNickname) {
		
		this.postNo = postNo;
		this.storeNo = storeNo;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postReadCount = postReadCount;
		this.postFile1 = postFile1;
		this.postFile2 = postFile2;
		this.postFile3 = postFile3;
		this.postFile4 = postFile4;
		this.postFile5 = postFile5;
		this.postRegDate = postRegDate;
		this.postIsPost = postIsPost;
		this.postStar = postStar;
		this.postUpCount = postUpCount;
		this.postUpList = postUpList;
		this.memberId = memberId;
		this.memberNickname = memberNickname;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostReadCount() {
		return postReadCount;
	}

	public void setPostReadCount(int postReadCount) {
		this.postReadCount = postReadCount;
	}

	public String getPostFile1() {
		return postFile1;
	}

	public void setPostFile1(String postFile1) {
		this.postFile1 = postFile1;
	}

	public String getPostFile2() {
		return postFile2;
	}

	public void setPostFile2(String postFile2) {
		this.postFile2 = postFile2;
	}

	public String getPostFile3() {
		return postFile3;
	}

	public void setPostFile3(String postFile3) {
		this.postFile3 = postFile3;
	}

	public String getPostFile4() {
		return postFile4;
	}

	public void setPostFile4(String postFile4) {
		this.postFile4 = postFile4;
	}

	public String getPostFile5() {
		return postFile5;
	}

	public void setPostFile5(String postFile5) {
		this.postFile5 = postFile5;
	}

	public Timestamp getPostRegDate() {
		return postRegDate;
	}

	public void setPostRegDate(Timestamp postRegDate) {
		this.postRegDate = postRegDate;
	}

	public String getPostIsPost() {
		return postIsPost;
	}

	public void setPostIsPost(String postIsPost) {
		this.postIsPost = postIsPost;
	}

	public int getPostStar() {
		return postStar;
	}

	public void setPostStar(int postStar) {
		this.postStar = postStar;
	}

	public int getPostUpCount() {
		return postUpCount;
	}

	public void setPostUpCount(int postUpCount) {
		this.postUpCount = postUpCount;
	}

	public String getPostUpList() {
		return postUpList;
	}

	public void setPostUpList(String postUpList) {
		this.postUpList = postUpList;
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
	
}
