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
	public List<Post> postList(int categoryNo, int storeNo) {
		return postDao.postList(categoryNo, storeNo);
	}

	@Override
	public Post getPost(int storeNo, int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPost(Post post) {
		// TODO Auto-generated method stub

	}

}
