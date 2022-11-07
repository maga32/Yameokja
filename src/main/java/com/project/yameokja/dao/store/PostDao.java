package com.project.yameokja.dao.store;

import java.util.List;

import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Report;

public interface PostDao {
	
	// 가게 정보 포스트 리스트
	public abstract List<Post> postList(int storeNo);
	
	// 가게 정보 별점리뷰 리스트
	public abstract List<Post> postListReply(int storeNo, int startRow, int num);
	
	public int myPageReplyCount(int storeNo);
	
	// 가게 정보 포스트 상세
	public abstract Post getPost(int postNo);
	
	// 가게 포스트 글쓰기
	public abstract void insertPost(Post post);
	
	// 가게 포스트 수정
	public abstract void updatePost(Post post);
	
	// 가게 리뷰글 삭제
	public void deletePost(int postNo);
	
	// 가게 별점댓글 삭제
	public void deleteReply(int postNo);
	
	//베스트 포스트 리스트
	public List<Post> bestOnePost(int storeNo);
	
	public List<Post> bestTwoPost(int storeNo);
	
	public List<Post> bestThreePost(int storeNo);

	//포스트 작성
	int postWrite(Post post);
	
	public void postReplyAdd(Post post);
	
}
