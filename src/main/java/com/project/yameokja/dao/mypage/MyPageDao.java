package com.project.yameokja.dao.mypage;

import java.util.List;   

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

public interface MyPageDao {

	//포스트(post) 리스트
	public List<Post> myPagePost(String userId, int startRow, int num);
	//작성글 갯수
	public int myPagePostCount(String userId);
	//작성글 삭제
	void deleteMyPagePost(int postNo);
	//별점댓글(reply)  리스트
	public List<Post> myPageReply(String userId, int startRow, int num);
	//별점댓글 갯수
	public int myPageReplyCount(String userId);
	//동네글 리스트
	public List<Community> myPageCommunity(String userId, int startRow, int num);
	//작성글 갯수
	public int myPageCommunityCount(String userId);
	//동네글 삭제
	void deleteMyPageCommunity(int communityNo);
	
	int sumPostUpCount(String userId);
	
	public Store getStore(String storeNo, String userId);
	
}