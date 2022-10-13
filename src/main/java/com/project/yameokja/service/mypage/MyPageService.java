package com.project.yameokja.service.mypage;

import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

public interface MyPageService {
	
	public Member getMember(String memberId);
	
	public List<Post> myPagePost();
	
	public Map<String, Object> myPagePost(String memberId, int pageNum);
	
	public Map<String, Object> myPageCommunity(String memberId, int pageNum, String status);
	
	public List<Store> myPageStore(String memberId);

}

