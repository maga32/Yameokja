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

	private static final String NAME_SPACE = "com.project.yameokja.mappers.PostMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List<Post> postList(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".postList", storeNo); 
	}
	
	
	@Override
	public List<Post> postListReply(int storeNo, int startRow, int num) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("storeNo", storeNo);
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE + ".postListReply", params); 
	}

	@Override
	public int myPageReplyCount(int storeNo) {
		return sqlSession.selectOne(NAME_SPACE+".myPageReplyCount", storeNo);
		}

	@Override
	public Post getPost(int postNo) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getPost", postNo);
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
	public List<Post> bestOnePost(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".bestOnePost", storeNo);
	}


	@Override
	public List<Post> bestTwoPost(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".bestTwoPost", storeNo);
	}


	@Override
	public List<Post> bestThreePost(int storeNo) {
		return sqlSession.selectList(NAME_SPACE + ".bestThreePost", storeNo);
	}


	@Override
	public void postReplyAdd(Post post) {
		System.out.println("postReplyAdd 앞 : "+post.getPostNo());
		sqlSession.insert(NAME_SPACE + ".postReplyAdd", post);
		System.out.println("postReplyAdd 뒤 : ");
	}


}
