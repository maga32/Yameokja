package com.project.yameokja.dao;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;

// 이 클래스가 데이터 액세스(데이터 저장소) 계층의 컴포넌트(Bean) 임을 선언한다.
@Repository
public class MemberDaoImpl implements MemberDao {
	
	private final String NAME_SPACE = "com.project.yameokja.MemberMapper";
	
	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

//	@Override
//	public Member getMember(String mbId) {
//		return sqlSession.selectOne(MEMBER_NAME_SPACE+".getMember", mbId);
//	}
	
	@Override
	public List<Member> myPostList(String mbId) {
		return sqlSession.selectList(NAME_SPACE+".myPostList", mbId);
	}

}
//@Override
//public List<Post> myPostList(String mbId, int pNo) {
//	Map<String, Object> param = new HashMap<String, Object>();
//	param.put("mbId", mbId);
//	param.put("pNo", pNo);
//	return sqlSession.selectList(POST_NAME_SPACE+".myPostList", param);
//}