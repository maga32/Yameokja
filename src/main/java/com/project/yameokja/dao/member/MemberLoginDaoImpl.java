package com.project.yameokja.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;

@Repository
public class MemberLoginDaoImpl implements MemberLoginDao {

	private static final String NAME_SPACE = "com.project.yameokja.mappers.MemberLoginMapper";
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//로그인
	@Override
	public int login(String memberId, String password) {
	
		Member m = sqlSession.selectOne(NAME_SPACE + ".login", memberId);
		int result = 2;
		
		if(m == null) {
			return result;
		}
		
		if(m.getMemberPassword().equals(password)) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	// 회원정보 불러오기
	@Override
	public Member getMember(String memberId) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", memberId);
	}
}