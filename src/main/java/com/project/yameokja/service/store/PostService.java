package com.project.yameokja.service.store;

import java.util.List;

import com.project.yameokja.domain.Post;

public interface PostService {

	// 포스트 리스트
	public abstract List<Post> postList(int storeNo, String detailOrderBy);
	
	// 별점 리스트
	public abstract List<Post> postListReply(int storeNo);
		
	// 포스트 상세
	public abstract Post getPost(int postNo);
	
	//  가게 리뷰글 글쓰기
	public void insertPost(Post post);
	
	//  가게 리뷰글 수정
	public void updatePost(Post post);
	
	// 가게 리뷰글 삭제
	public void deletePost(int postNo);
	
	// 가게 별점댓글 작성
	public void addReply(int postNo);
	
	// 가게 별점댓글 삭제
	public void deleteReply(int postNo);
	
	//베스트 포스트 리스트
	public List<Post> bestOnePost(int storeNo);
	
	public List<Post> bestTwoPost(int storeNo);
	
	public List<Post> bestThreePost(int storeNo);

}
