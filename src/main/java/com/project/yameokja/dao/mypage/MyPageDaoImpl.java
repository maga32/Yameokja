package com.project.yameokja.dao;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;

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
	public Member getMember(String memberId) {
		return sqlSession.selectOne(NAME_SPACE+".getMember", memberId);
	}
	
	@Override
	public List<Post> myPagePost(String memberId) {
		return sqlSession.selectList(NAME_SPACE+".myPostList", memberId);
		
	}

	@Override
	public List<Community> myPageCommunity(String memberId) {
		return sqlSession.selectList(NAME_SPACE+".myPageCommunity", memberId);
	}


}
//@Override
//public List<Post> myPostList(String mbId, int pNo) {
//	Map<String, Object> param = new HashMap<String, Object>();
//	param.put("mbId", mbId);
//	param.put("pNo", pNo);
//	return sqlSession.selectList(POST_NAME_SPACE+".myPostList", param);
//}