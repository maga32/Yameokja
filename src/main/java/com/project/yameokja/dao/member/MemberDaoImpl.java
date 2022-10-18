package com.project.yameokja.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAME_SPACE = "com.project.yameokja.mappers.MemberMapper";
	
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
	
	// 회원가입
	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	
	// 아이디 중복확인
	@Override
	public boolean idOverlapCheck(String mbId) {
		
		boolean overlap = false;
				
		String checkId = sqlSession.selectOne(NAME_SPACE + ".idOverlapCheck", mbId);
		
		System.out.println("MemberJoinDao - mbId : " + mbId);
		System.out.println("MemberJoinDao - checkId : " + checkId);
		
		if(checkId != null) {
			overlap = true;
		}
		
		System.out.println("MemberJoinDao - overlap : " + overlap);
		
		return  overlap;
	}
	
	// 아이디 중복확인
	@Override
	public boolean nicknameOverlapCheck(String mbNickname) {
		
		boolean overlap = false;
						String checkNickname = sqlSession.selectOne(NAME_SPACE + ".nicknameOverlapCheck", mbNickname);
		
		System.out.println("MemberJoinDao - mbNickname : " + mbNickname);
		System.out.println("MemberJoinDao - checkNickname : " + checkNickname);
		
		if(checkNickname != null) {
			overlap = true;
		}
		
		System.out.println("MemberJoinDao - overlap : " + overlap);
		
		return  overlap;
	}
}