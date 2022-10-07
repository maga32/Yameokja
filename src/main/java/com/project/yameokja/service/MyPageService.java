package com.project.yameokja.service;

import java.util.List;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;

public interface MyPageService {
	
	public Member getMember(String memberId);
	
	public List<Post> myPagePost(String memberId);
	
	public List<Community> myPageCommunity(String memberId);

}

