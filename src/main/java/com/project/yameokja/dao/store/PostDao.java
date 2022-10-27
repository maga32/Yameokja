package com.project.yameokja.dao.store;

import java.util.List;

import com.project.yameokja.domain.Post;

public interface PostDao {
	
	// 가게 정보 포스트 리스트
	public abstract List<Post> postList(int storeNo);
	
	// 가게 정보 포스트 상세
	public abstract Post getPost(int storeNo, int postNo);
	
	// 가게 포스트 글 갯수
	public int getPostCount(String Type, String keyword, int postNo);
	
	// 가게 포스트 글쓰기
	public abstract void insertPost(Post post);
	
	// 가게 포스트 수정
	public abstract void updatePost(Post post);
	
	// 가게 포스트 삭제
	public abstract void deletePost(Post post);
	
	//베스트 포스트 리스트
	public abstract List<Post> bestPostList(int storeNo);
	
}
