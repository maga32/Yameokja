package com.project.yameokja.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.member.MemberDao;
import com.project.yameokja.domain.Member;

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;
	
	// 로그인
	public int login(String memberId, String password) {
		
		return memberDao.login(memberId, password);
	}
	
	// 회원정보 불러오기
	public Member getMember(String memberId) {
		
		return memberDao.getMember(memberId);
	}
	
	// 회원가입
	public void addMember(Member member) {
		
		memberDao.addMember(member);
	};
	
	// 아이디 중복확인
	public Boolean idOverlapCheck(String mbId) {
		
		return memberDao.idOverlapCheck(mbId);
	}

	
	// targetId 가 memberId를 차단했는지 확인
	public boolean isBlockedMe(String memberId, String targetId) {
		boolean isBlockedMe = false;
		
		String memberBlockIds = memberDao.getMember(targetId).getMemberBlockIds();
		if(memberBlockIds == null) return false;

		String[] blockIds = memberBlockIds.split(",");
		for(int i=0; i < blockIds.length; i++) {
			if(blockIds[i].equals(memberId)) isBlockedMe = true;
		}
		
		return isBlockedMe;
	}
	
	// memberId 차단목록에 targetId를 추가
	public void memberBlock(String memberId, String targetId) {
		String memberBlockIds = memberDao.getMember(memberId).getMemberBlockIds();
		if(memberBlockIds != null && !memberBlockIds.equals("")) targetId = memberBlockIds + "," + targetId;
		
		memberDao.memberBlock(memberId, targetId);
	}

	// memberId 차단목록에서 targetId를 차단해제
	public void memberUnblock(String memberId, String targetId) {
		String memberBlockIds = memberDao.getMember(memberId).getMemberBlockIds();
		String[] blockIds = memberBlockIds.split(",");
		
		String newBlockIds = "";
		for(int i=0; i < blockIds.length; i++) {
			if(!blockIds[i].equals(targetId)) {
				newBlockIds += blockIds[i] + ",";
			}
		}
		
		if(newBlockIds.length() != 0) newBlockIds = newBlockIds.substring(0, newBlockIds.length() -1);
		
		memberDao.memberBlock(memberId, newBlockIds);
	}
	
	// 닉네임 중복확인
	public Boolean nicknameOverlapCheck(String mbNickname) {
		
		return memberDao.nicknameOverlapCheck(mbNickname);
	}

	// 모집 글 회원정보 조회(아이디 > 닉네임, 프사)
	public Member getMemberFor102(String memberId) {
		return memberDao.getMemberFor102(memberId);
	}
	
	// 회원정보 수정
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}
	
	// 회원탈퇴
	public void deleteMember(String memberId) {
		memberDao.deleteMember(memberId);
	}
	
	// member가 storeNo에 해당하는 가게를 즐겨찾기 했는지 확인
	public boolean isBookmarks(String memberId, int storeNo) {
		boolean isBookmarks = false;
		
		String memberBookmarks = memberDao.getMember(memberId).getMemberBookmarks();
		if(memberBookmarks == null) return false;
		
		System.out.println("memService - memberBookmarks : " + memberBookmarks);

		String[] bookmarks = memberBookmarks.split(",");
		for(int i=0; i < bookmarks.length; i++) {
			if(bookmarks[i].equals(Integer.toString(storeNo))) isBookmarks = true;
		}
		
		System.out.println("memService - isBookmarks : " + isBookmarks);
		
		return isBookmarks;
	}
	
	// memberBookmarks에 storeNo 추가 or 삭제
	public void updateMemberBookmarks(String memberId, int storeNo, boolean result) {
		
		String memberBookmarks = memberDao.getMember(memberId).getMemberBookmarks();
		String air = "";
		
		if(result) {
			String[] bookmarks = memberBookmarks.split(",");
			memberBookmarks = "";
			
			for(int i=0; i < bookmarks.length; i++) {
				if(!bookmarks[i].equals(Integer.toString(storeNo))) memberBookmarks += bookmarks[i] + ",";
			}
			if(memberBookmarks.length() != 0) memberBookmarks = memberBookmarks.substring(0, memberBookmarks.length() -1);	
		}
		else {
			memberBookmarks = (memberBookmarks != null && !memberBookmarks.equals("")) ? memberBookmarks + "," + storeNo : Integer.toString(storeNo) ;
		}
		
		memberDao.updateMemberBookmarks(memberId, memberBookmarks);
	}	

}
