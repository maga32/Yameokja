package com.project.yameokja.service.store;

import java.util.List;

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
	public List<Post> postList(int storeNo) {
		return postDao.postList(storeNo);
	}

	@Override
	public Post getPost(int storeNo, int postNo) {
		return postDao.getPost(storeNo, postNo);
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
	public void deletePost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Post> bestPostList(int storeNo) {
		return postDao.bestPostList(storeNo);
	}

}
