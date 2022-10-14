package com.project.yameokja.dao.member;

import com.project.yameokja.domain.Member;

public interface MemberLoginDao {

	// 로그인
	public int login(String memberId, String password);
	
	// 회원정보 불러오기
	public Member getMember(String memberId);
	
}
