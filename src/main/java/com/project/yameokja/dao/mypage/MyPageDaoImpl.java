package com.project.yameokja.dao.mypage;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

// 이 클래스가 데이터 액세스(데이터 저장소) 계층의 컴포넌트(Bean) 임을 선언한다.
@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	private static final String NAME_SPACE = "com.project.yameokja.MyPageMapper";
	
	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public Member getMember(String userId) {
		return sqlSession.selectOne(NAME_SPACE+".getMember", userId);
	}
	
	@Override
	public List<Post> myPagePost(String userId, int startRow, int num) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("startRow", startRow);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE+".myPostList", params);
		
	}

	@Override
	public List<Store> myPageStore(String memberId) {
		return sqlSession.selectList(NAME_SPACE+".myPageStore", memberId);
	}

	@Override
	public List<Community> myPageCommunity(String memberId, int startRow, int num, String status) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("status", status);
		
		return sqlSession.selectList(NAME_SPACE+".myPageCommunity", params);
	}

	@Override
	public int getPostListCount(String memberId) {
		return sqlSession.selectOne(NAME_SPACE+".getPostListCount", memberId);
	}

	@Override
	public int getCommunityListCount(String memberId) {
		return sqlSession.selectOne(NAME_SPACE+".getCommunityListCount", memberId);
	}


}
