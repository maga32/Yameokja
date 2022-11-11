package com.project.yameokja.dao.store;

import java.util.List;

import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Report;

public interface PostDao {
	
	// 가게 정보 포스트 리스트
	public abstract List<Post> postList(int storeNo,int num, int startRow, String detailOrderBy);
	
	// 가게 정보 별점리뷰 리스트

	public abstract List<Post> postListReply(int startRow, int storeNo, int num);
	
	public int myPageReplyCount(int storeNo);
	
	// 가게 정보 포스트 상세
	public abstract Post getPost(int postNo);
	
	// 가게 리뷰글 글쓰기
	public void insertPost(Post post);
	
	// 가게 리뷰글 수정
	public void updatePost(Post post);
	
	// 가게 리뷰글 삭제
	public void deletePost(int postNo);
	
	// 가게 별점댓글 작성
	public void addReply(Post post);
	
	// 가게 별점댓글 삭제
	public void deleteReply(int postNo);
	
	// 가게 리뷰글 카운트
	public int getPostCount(int storeNo);
	
	// 가게 별점댓글 카운트
	public int getReplyCount(int storeNo);
	
	//베스트 포스트 리스트
	public Post bestOnePost(int storeNo);
	
	public List<Post> bestTwoPost(int storeNo);
	
	public List<Post> bestThreePost(int storeNo);

	//포스트 작성
	int postWrite(Post post);
	
	public void postReplyAdd(Post post);
	
}
