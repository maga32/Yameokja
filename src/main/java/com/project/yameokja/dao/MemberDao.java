package com.project.yameokja.dao;

import java.util.List; 
import java.util.Map;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;

public interface MemberDao {
	
	/* 한 페이지에 보여 질 게시 글 리스트 요청 시 호출되는 메소드
	 * 현재 페이지에 해당하는 게시 글 리스트를 DB에서 읽어와 반환 하는 메소드
	 **/
	public abstract Member getMember(String mbId);
	
	public List<Post> myPostList(String mbId);

}
//public List<Post> myPostList(String mbId, int pNo);