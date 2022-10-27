package com.project.yameokja.dao.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Post;

@Repository
public class PostDaoImpl implements PostDao {

	private final String NAME_SPACE = "com.project.yameokja.mappers.PostMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List<Post> postList(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".storeDetail", storeNo); 
	}

	@Override
	public Post getPost(int storeNo, int postNo) {
		
		Map<String, Object> param = new HashMap <String, Object>();
		
		param.put("storeNo", storeNo);
		param.put("postNo", postNo);
		
		return sqlSession.selectOne(NAME_SPACE + ".storeDetail", param);
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
	public int getPostCount(String Type, String keyword, int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Post> bestPostList(int storeNo) {
		return sqlSession.selectList(NAME_SPACE+".bestPostList", storeNo);
	}

}
