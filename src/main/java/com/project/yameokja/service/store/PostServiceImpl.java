package com.project.yameokja.service.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.PostDao;
import com.project.yameokja.domain.Post;

@Service
public class PostServiceImpl implements PostService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private PostDao postDao;
	
	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}

	@Override
	public List<Post> postList(int storeNo) {
		return postDao.postList(storeNo);
	}
	
	@Override
	public Map<String, Object> postListReply(int storeNo, int pageNum) {
		int currentPage = pageNum;		
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = postDao.myPageReplyCount(storeNo);
		
		if(listCount > 0) {
			List<Post> postListReply = postDao.postListReply(storeNo, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> postMap = new HashMap<String, Object>();
			postMap.put("postListReply", postListReply);
			postMap.put("currentPage", currentPage);
			postMap.put("listCount", listCount);
			postMap.put("pageCount", pageCount);
			postMap.put("startPage", startPage);
			postMap.put("endPage", endPage);			
			postMap.put("pageGroup", PAGE_GROUP);
			
			return postMap;
		}	
			
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("storeNo", storeNo);
			
		return postMap;
	}

	@Override
	public Post getPost(int postNo) {
		return postDao.getPost(postNo);
	}

	@Override
	public void insertPost(Post post) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePost(int postNo) {
		postDao.deletePost(postNo);
	}

	@Override
	public void deleteReply(int postNo) {
		postDao.deleteReply(postNo);
	}
	
	@Override
	public List<Post> bestOnePost(int storeNo) {
		return postDao.bestOnePost(storeNo);
	}

	@Override
	public List<Post> bestTwoPost(int storeNo) {
		return postDao.bestTwoPost(storeNo);
	}

	@Override
	public List<Post> bestThreePost(int storeNo) {
		return postDao.bestThreePost(storeNo);
	}

	@Override
	public void postReplyAdd(Post post) {
		postDao.postReplyAdd(post);
	}

}
