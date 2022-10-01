package com.springstudy.bbs.service;

import java.util.List;

import com.springstudy.bbs.domain.Board;
import com.springstudy.bbs.domain.Community;
import com.springstudy.bbs.domain.Member;
import com.springstudy.bbs.domain.Post;

public interface MemberService {
	
//	public abstract Member getMember(String mbId);
	
	public List<Member> myPostList(String mbId);

}
//public List<Post> myPostList(String mbId, int pNo);
