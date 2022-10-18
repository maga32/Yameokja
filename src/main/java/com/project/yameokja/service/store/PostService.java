package com.project.yameokja.service.store;

import java.util.List;

import com.project.yameokja.domain.Post;

public interface PostService {

	// 리뷰리스트
	public abstract List<Post> postList(int storeNo);
		
	// 리뷰상세
	
}
