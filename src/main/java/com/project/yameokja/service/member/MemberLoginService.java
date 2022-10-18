package com.project.yameokja.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.member.MemberLoginDao;
import com.project.yameokja.domain.Member;

@Service
public class MemberLoginService {

	@Autowired
	MemberLoginDao memberLoginDao;
	
	// 로그인
	public int login(String memberId, String password) {
		
		return memberLoginDao.login(memberId, password);
	}
	
	// 회원정보 불러오기
	public Member getMember(String memberId) {
		
		return memberLoginDao.getMember(memberId);
	}
	
	// targetId 가 memberId를 차단했는지 확인
	public boolean isBlockedMe(String memberId, String targetId) {
		boolean isBlockedMe = false;
		
		String memberBlockIds = memberLoginDao.getMember(targetId).getMemberBlockIds();
		if(memberBlockIds == null) return false;

		String[] blockIds = memberBlockIds.split(",");
		for(int i=0; i < blockIds.length; i++) {
			if(blockIds[i].equals(memberId)) isBlockedMe = true;
		}
		
		return isBlockedMe;
	}

}
