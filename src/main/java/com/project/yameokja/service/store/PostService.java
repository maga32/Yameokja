package com.project.yameokja.service.store;

import java.util.List;

import com.project.yameokja.domain.Post;

public interface PostService {

	// 포스트 리스트
	public abstract List<Post> postList(int storeNo);
	
	// 별점 리스트
	public abstract List<Post> postListReply(int storeNo);
		
	// 포스트 상세
	public abstract Post getPost(int postNo);
	
	// 포스트 글쓰기
	public abstract void insertPost(Post post);
	
	// 포스트 수정
	public abstract void updatePost(Post post);
	
	// 포스트 삭제
	public abstract void deletePost(Post post);
	
	//베스트 포스트 리스트
	public List<Post> bestOnePost(int storeNo);
	
	public List<Post> bestTwoPost(int storeNo);
	
	public List<Post> bestThreePost(int storeNo);
	
	// 포스트 작성
	int postWrite(Post post);

}
