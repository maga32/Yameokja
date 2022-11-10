package com.project.yameokja.service.store;

import java.util.List;
import java.util.Map;

import com.project.yameokja.domain.Post;

public interface PostService {

	// 포스트 리스트
	public abstract Map<String, Object> postList(int storeNo,int pageNum, String detailOrderBy);
	
	// 별점댓글 리스트
	public Map<String, Object> postListReply(int storeNo, int pageNum);
		
	// 포스트 상세
	public abstract Post getPost(int postNo);
	
	//  가게 리뷰글 글쓰기
	public void insertPost(Post post);
	
	//  가게 리뷰글 수정
	public void updatePost(Post post);
	
	// 가게 리뷰글 삭제
	public void deletePost(int postNo);
	
	// 가게 별점댓글 작성
	public void addReply(Post post);
	
	// 가게 별점댓글 삭제
	public void deleteReply(int postNo);
	
	//베스트 포스트 리스트
	public Post bestOnePost(int storeNo);
	
	public List<Post> bestTwoPost(int storeNo);
	
	public List<Post> bestThreePost(int storeNo);
	
	public void postReplyAdd(Post post);

	// 포스트 작성
	int postWrite(Post post);
}
