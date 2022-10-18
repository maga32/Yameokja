package com.project.yameokja.service.store;

import java.util.List;

import com.project.yameokja.domain.Post;

public interface PostService {

	// 리뷰 리스트
	public abstract List<Post> postList(int categoryNo, int storeNo);
		
	// 리뷰 상세
	public abstract Post getPost(int storeNo, int postNo);
	
	// 리뷰 글쓰기
	public abstract void insertPost(Post post);
	
	// 리뷰 수정
	
	// 리뷰 삭제
	
}
