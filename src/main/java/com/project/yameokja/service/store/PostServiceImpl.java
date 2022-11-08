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
	
	@Autowired
	private PostDao postDao;
	
	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}

	@Override
	public List<Post> postList(int storeNo, String detailOrderBy) {
		return postDao.postList(storeNo, detailOrderBy);
	}
	
	@Override
	public List<Post> postListReply(int storeNo) {
		return postDao.postListReply(storeNo);
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

	

}
