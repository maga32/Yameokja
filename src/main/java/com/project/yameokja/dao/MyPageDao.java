package com.project.yameokja.dao;

import java.util.List;   

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

public interface MyPageDao {
	//회원의 정보
	public abstract Member getMember(String memberId);
	//작성글 리스트
	public List<Post> myPagePost(String memberId);
	//동네글 리스트 겸 별점 댓글 리스트
	public List<Community> myPageCommunity(String memberId);
//	//찜 리스트
//	public List<Store> myPage(String memberId);
	
}