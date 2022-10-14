package com.project.yameokja.dao.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.yameokja.domain.Member;

@Repository
public class MemberJoinDaoImpl implements MemberJoinDao {

	@Autowired
	SqlSession sqlSession;
	 
	private static final String NAME_SPACE = "com.project.yameokja.mappers.MemberJoinMapper";
	
	
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
