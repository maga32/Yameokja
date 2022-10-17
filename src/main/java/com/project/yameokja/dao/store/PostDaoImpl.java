package com.project.yameokja.dao.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.yameokja.domain.Post;

public class PostDaoImpl implements PostDao {

	private final String NAME_SPACE = "com.project.mappers.StoreMapper";
	
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Post> postList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post getPost(int postNo) {
		// TODO Auto-generated method stub
		return null;
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

}
