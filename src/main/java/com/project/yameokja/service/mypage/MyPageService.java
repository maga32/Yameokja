package com.project.yameokja.service.mypage;

import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

public interface MyPageService {
	
	public Map<String, Object> myPagePost(String userId, int pageNum);
	
	void deleteMyPagePost(int postNo);
	
	public Map<String, Object> myPageReply(String userId, int pageNum);
	
	public Map<String, Object> myPageCommunity(String userId, int pageNum);
	
	void deleteMyPageCommunity(int communityNo);
	
	public Store getStore(String storeNo, String userId);

}

