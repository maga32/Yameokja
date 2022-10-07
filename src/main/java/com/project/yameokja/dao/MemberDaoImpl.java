package com.project.yameokja.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAME_SPACE = "com.project.yameokja.mappers.MemberMapper";
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 회원정보 불러오기
	@Override
	public Member getMember(String mbId) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", mbId);
	}
}