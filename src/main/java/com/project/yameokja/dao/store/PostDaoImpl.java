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

	private final String NAME_SPACE = "com.project.yameokja.mappers.StoreMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List<Post> postList(int categoryNo, int storeNo) {
		
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("categoryNo", categoryNo);
		params.put("storeNo", storeNo);
		
		return sqlSession.selectList(NAME_SPACE + ".storeDetail", params); 
	}

	@Override
	public Post getPost(int postNo) {
		return sqlSession.selectOne(NAME_SPACE + ".storeDetail");
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
