package com.project.yameokja.dao.member;

import com.project.yameokja.domain.Member;

public interface MemberDao {

	// 로그인
	public int login(String memberId, String password);
	
	// 회원정보 불러오기
	public Member getMember(String memberId);
	
	// 회원가입
	public void addMember(Member member);
	
	// 아이디 중복확인
	public boolean idOverlapCheck(String memberId);
	
	// 닉네임 중복확인
	public boolean nicknameOverlapCheck(String memberNickname);
	
	// 회원정보 조회(아이디 > 닉네임, 프사)
	Member getMemberFor102(String memberId);
}
