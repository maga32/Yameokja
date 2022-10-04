package com.project.yameokja.service;

import java.util.List;

import com.project.yameokja.domain.Member;

public interface MemberService {
	
//	public abstract Member getMember(String mbId);
	
	public List<Member> myPostList(String mbId);

}
//public List<Post> myPostList(String mbId, int pNo);
