package com.project.yameokja.service.mypage;

import java.util.ArrayList;
import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.mypage.MyPageDao;
import com.project.yameokja.domain.Community;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;
import com.project.yameokja.service.member.MemberService;
import com.project.yameokja.service.store.StoreService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Autowired
	private MyPageDao myPageDao;
	@Autowired
	private StoreService storeService;
	@Autowired
	private MemberService memberService;
	
	public void setMemberDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}

	@Override
	public Map<String, Object> myPagePost(String userId, int pageNum) {
		int currentPage = pageNum;		
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = myPageDao.myPagePostCount(userId);
		
		if(listCount > 0) {
			List<Post> myPagePost = myPageDao.myPagePost(userId, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> postMap = new HashMap<String, Object>();
			postMap.put("myPagePost", myPagePost);
			postMap.put("currentPage", currentPage);
			postMap.put("listCount", listCount);
			postMap.put("pageCount", pageCount);
			postMap.put("startPage", startPage);
			postMap.put("endPage", endPage);			
			postMap.put("pageGroup", PAGE_GROUP);
			
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
	public Map<String, Object> myPageReply(String userId, int pageNum) {
		int currentPage = pageNum;		
		int startRow = (currentPage -1) * PAGE_SIZE;
		int listCount = myPageDao.myPageReplyCount(userId);
		
		if(listCount > 0) {
			List<Post> myPageReply = myPageDao.myPageReply(userId, startRow, PAGE_SIZE);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP
									- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
			int endPage = startPage + PAGE_GROUP - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> replyMap = new HashMap<String, Object>();
			replyMap.put("myPageReply", myPageReply);
			replyMap.put("currentPage", currentPage);
			replyMap.put("listCount", listCount);
			replyMap.put("pageCount", pageCount);
			replyMap.put("startPage", startPage);
			replyMap.put("endPage", endPage);			
			replyMap.put("pageGroup", PAGE_GROUP);
			replyMap.put("userId", userId);
			
			return replyMap;
		}	
			
		Map<String, Object> replyMap = new HashMap<String, Object>();
		replyMap.put("userId", userId);
			
		return replyMap;
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
		Map<String, Object> communityMap = new HashMap<String, Object>();
		communityMap.put("userId", userId);
			
		return communityMap;
	}

	@Override
	public void deleteMyPageCommunity(int communityNo) {
		myPageDao.deleteMyPageCommunity(communityNo);
	}

	@Override
	public Map<String, Object> myPageLike(String userId, int pageNum) {
		
		String memberBookmarks = memberService.getMember(userId).getMemberBookmarks();
		if( !memberBookmarks.equals("") && memberBookmarks != null ) {
			String[] memberBookmarksList = memberBookmarks.split(",");
			//1 0~9
			//2 10~19
			int currentPage = pageNum;	
			int listCount = memberBookmarksList.length;
			
			if(listCount > 0) {
				int pageCount = (int) (memberBookmarksList.length / PAGE_SIZE)+(memberBookmarksList.length%10 == 0 ? 0: 1);
				int startPage = pageNum / PAGE_GROUP * PAGE_GROUP
										- (pageNum % PAGE_GROUP == 0 ? PAGE_GROUP : 0) + 1;
				int endPage = startPage + PAGE_GROUP - 1;
				if(endPage > pageCount) endPage = pageCount;

				int lastNum = pageNum*10 > (memberBookmarksList.length) ? (memberBookmarksList.length) : pageNum*10;
				
				ArrayList<Store> storeList = new ArrayList<Store>();
				for (int i = (pageNum-1)*10; i < lastNum; i++) {
					storeList.add(storeService.getStore(Integer.parseInt(memberBookmarksList[i])));				 
				
				}
				Map<String, Object> LikeMap = new HashMap<String, Object>();
				LikeMap.put("storeList", storeList);
				LikeMap.put("pageNum", pageNum);
				LikeMap.put("listCount", listCount);
				LikeMap.put("pageCount", pageCount);
				LikeMap.put("startPage", startPage);
				LikeMap.put("endPage", endPage);			
				LikeMap.put("pageGroup", PAGE_GROUP);
				LikeMap.put("lastNum", lastNum);
				LikeMap.put("currentPage", currentPage);
			
				return LikeMap;
			}
		}
		
			Map<String, Object> LikeMap = new HashMap<String, Object>();
			LikeMap.put("userId", userId);
		
		return LikeMap;
	}
}
