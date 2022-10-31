package com.project.yameokja.service.mypage;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.mypage.MyPageDao;
import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Autowired
	private MyPageDao myPageDao;
	
	public void setMemberDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}

	@Override
	public Member getMember(String userId) {
		return myPageDao.getMember(userId);
	}

	@Override
	public Map<String, Object> myPagePost(int pageNum, String userId) {
		int currentPage = pageNum;		
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = myPageDao.myPagePostCount(userId);
		
		if(listCount > 0) {
			List<Post> postList = myPageDao.myPagePost(userId, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> postMap = new HashMap<String, Object>();
			postMap.put("postList", postList);
			postMap.put("currentPage", currentPage);
			postMap.put("listCount", listCount);
			postMap.put("pageCount", pageCount);
			postMap.put("startPage", startPage);
			postMap.put("endPage", endPage);			
			postMap.put("pageGroup", PAGE_GROUP);
			postMap.put("userId", userId);
			
			return postMap;
		}	
			
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("userId", userId);
			
		return postMap;		
	}

	@Override
	public void deleteMyPagePost(int postNo) {
		myPageDao.deleteMyPagePost(postNo);
	}

	@Override
	public Map<String, Object> myPageCommunity(String userId, int pageNum) {

		int currentPage = pageNum;
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = myPageDao.myPageCommunityCount(userId);
		
		if(listCount > 0) {
			List<Community> communityList = myPageDao.myPageCommunity(userId, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> communityMap = new HashMap<String, Object>();
			communityMap.put("communityList", communityList);
			communityMap.put("currentPage", currentPage);
			communityMap.put("listCount", listCount);
			communityMap.put("pageCount", pageCount);
			communityMap.put("startPage", startPage);
			communityMap.put("endPage", endPage);			
			communityMap.put("pageGroup", PAGE_GROUP);
			
			return communityMap;
		}
		return null;
	}

	@Override
	public void deleteMyPageCommunity(int communityNo) {
		myPageDao.deleteMyPageCommunity(communityNo);
	}

	@Override
	public List<Store> myPageStore(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
