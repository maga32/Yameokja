package com.project.yameokja.service;

import java.util.List;

import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;

public interface MemberService {
	
	public Member getMember(String mbId);
	
	public List<Post> myPostList(String mbId);

}
//public List<Post> myPostList(String mbId, int pNo);
