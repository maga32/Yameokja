package com.project.yameokja.dao.member;

import com.project.yameokja.domain.Member;

public interface MemberJoinDao {

	// 회원가입
	public void addMember(Member member);
	
	// 아이디 중복확인
	public boolean idOverlapCheck(String memberId);
	
	// 닉네임 중복확인
	public boolean nicknameOverlapCheck(String memberNickname);
}
