package com.project.yameokja.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.community.CommunityDao;
import com.project.yameokja.domain.Community;

@Service
public class CommunityService {

	@Autowired
	CommunityDao communityListDao;
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	// 커뮤니티 글 목록
	public Map<String, Object> getCommunity(String type, String keyword, int pageNum, String categoryNo){
		
		int currentPage = pageNum;
		
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = 0;
		
		listCount = communityListDao.getCommunityCount(type, keyword, categoryNo);
		
		System.out.println("listCount : " + listCount + ", type : " 
				+ type + ", keyword : " + keyword);
		
		if(listCount > 0) {
			
			List<Community> coList = communityListDao.getCommunity(startRow, PAGE_SIZE, type, keyword, categoryNo);
			
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			
			int endPage = startPage + 9;
			
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> coMap = new HashMap<String, Object>();
			coMap.put("coList", coList);
			coMap.put("pageCount", pageCount);
			coMap.put("startPage", startPage);
			coMap.put("endPage", endPage);
			coMap.put("currentPage", currentPage);
			coMap.put("listCount", listCount);
			coMap.put("pageGroup", PAGE_GROUP);
			
			System.out.println("communityService - startPage" + startPage + ", categoryNo : " + categoryNo + ", currentPage : " + currentPage);
			
			return coMap;
			
		}
	
		return null;
	} 
	
	// 커뮤니티 수다글 등록
	public void addCommunity101(Community co) {
		communityListDao.addCommunity101(co);
	}
	
	// 커뮤니티 모집글 등록
	public void addCommunity102(Community co) {
		communityListDao.addCommunity102(co);
	}
	
	// 커뮤니티 글 상세보기
	public Community getCommunityOne(int coNo) {
		return communityListDao.getCommunityOne(coNo);
	}
	
	// 커뮤니티 글 조회수 증가
	public void addReadCount(int coNo) {
		communityListDao.addReadCount(coNo);
	}
	
	// 커뮤니티 댓글 작성
	public void addCommunityReply(Community co){
		communityListDao.addCommunityReply(co);
	}
	
	// 커뮤니티 댓글 수정
	public void updateCommunityReply(Community co) {
		communityListDao.updateCommunityReply(co);
	}
	
	// 커뮤니티 댓글 출력
	public List<Community> getCommunityReply(Community co){
		return communityListDao.getCommunityReply(co);
	}
	
	// 커뮤니티 댓글 삭제
	public void delCommunityReply(int no) {
		communityListDao.delCommunityReply(no);
	}
	
	// 커뮤니티 댓글 작성자 출력
	public String getCommunityReplyMemberId(int no) {
		return communityListDao.getCommunityReplyMemberId(no);
	}
	
	// 모집글 참여 여부 수정
	public void update102PartyMemberIds(String partyMemberIds, int communityNo) {
		communityListDao.update102PartyMemberIds(partyMemberIds, communityNo);
	}

	

	

}
