package com.project.yameokja.dao;

import com.project.yameokja.domain.Member;

public interface MemberDao {
	
	// 회원정보 불러오기
	public Member getMember(String mbId);
	
}
