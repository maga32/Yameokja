package com.project.yameokja.dao.member;

import java.util.List;

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
	
	// 차단회원 추가/해제
	public void memberBlock(String memberId, String memberBlockIds);

	// 회원정보 조회(아이디 > 닉네임, 프사)
	Member getMemberFor102(String memberId);
	
	// 회원 리스트 조회
	public List<Member> getMemberList(int startMember, int limit, String sort, String order, String searchBy, String keyword);

	// 총 회원수 조회
	public int getMemberCount(String searchBy, String keyword);
	
	// 회원 레벨 수정
	public void updateMemberLevel(String memberId, int memberLevel);
	
	// 회원 수정
	public void updateMember(Member member);
	
	// 회원 탈퇴
	public void deleteMember(String memberId);
	
	// 회원 즐겨찾기 가게 추가
	public void updateMemberBookmarks(String memberId, String strStoreNo);
	
}
