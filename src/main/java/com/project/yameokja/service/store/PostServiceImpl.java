package com.project.yameokja.service.store;

import java.util.HashMap;  
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.PostDao;
import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;

@Service
public class PostServiceImpl implements PostService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private PostDao postDao;
	
	@Override
	public Map<String, Object> postList(int storeNo, int pageNum, String detailOrderBy) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
			
		listCount = postDao.getPostCount(storeNo);
		
		System.out.println("리뷰글 리스트 확인용 storeNo : "  + storeNo);
		System.out.println("리뷰 listCount : " + listCount);
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		if(listCount > 0) {
			
			List<Post> pList = postDao.postList(storeNo,PAGE_SIZE, startRow, detailOrderBy);

			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP - 
					(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0) + 1;
			
			
			int endPage = startPage + 9;
			
				if(endPage > pageCount) endPage = pageCount;
				
				pMap.put("pList", pList);
				
				pMap.put("storeNo", storeNo);
				pMap.put("pageCount", pageCount);
				pMap.put("startPage", startPage);
				pMap.put("endPage", endPage);
				
				pMap.put("currentPage", currentPage);
				pMap.put("listCount", listCount);
				pMap.put("pageGroup", PAGE_GROUP);
				
				System.out.println("가게의 시작페이지 - 가게 번호 - 현재 페이지 : " + startPage +" - " + storeNo + " - " + currentPage);
				
				return pMap;
		}
		return pMap;
	}
	
	@Override
	public Map<String, Object> postListReply(int storeNo, int pageNum) {
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
		
		listCount = postDao.getReplyCount(storeNo);
		
		System.out.println("댓글갯수 확인용 storeNo : "  + storeNo);
		System.out.println("listCount : " + listCount);
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		if(listCount > 0) {
			
			List<Post> rList = postDao.postListReply(startRow, storeNo, PAGE_SIZE);
			
			System.out.println("rList : " + rList.get(0).getPostContent());
			
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			
			int startPage = currentPage / PAGE_GROUP * PAGE_GROUP - 
					(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0) + 1;
			
			
			int endPage = startPage + 9;
			
				if(endPage > pageCount) endPage = pageCount;
				
				rMap.put("rList", rList);
				
				rMap.put("storeNo", storeNo);
				rMap.put("pageCount", pageCount);
				rMap.put("startPage", startPage);
				rMap.put("endPage", endPage);
				
				rMap.put("currentPage", currentPage);
				rMap.put("listCount", listCount);
				rMap.put("pageGroup", PAGE_GROUP);
				
				return rMap;
		}
		
		return rMap;
	}

	@Override
	public Post getPost(int postNo) {
		return postDao.getPost(postNo);
	}

	@Override
	public void insertPost(Post post) {
		postDao.insertPost(post);
	}

	@Override
	public void updatePost(Post post) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deletePost(int postNo) {
		postDao.deletePost(postNo);
	}
	
	// 별점댓글 작성
	@Override
	public void addReply(Post post) {
		postDao.addReply(post);
	}
	
	// 별점댓글 삭제
	@Override
	public void deleteReply(int postNo) {
		postDao.deleteReply(postNo);
	}
	
	@Override
	public Post bestOnePost(int storeNo) {
		return postDao.bestOnePost(storeNo);
	}

	@Override
	public List<Post> bestTwoPost(int storeNo) {
		return postDao.bestTwoPost(storeNo);
	}

	@Override
	public List<Post> bestThreePost(int storeNo) {
		return postDao.bestThreePost(storeNo);
	}

	@Override
	public void postReplyAdd(Post post) {
		postDao.postReplyAdd(post);
	}
		
	//포스트 작성
	@Override
	public int postWrite(Post post) {
		String file[] = new String[5];
		int matchNum = 0;
		Pattern src = Pattern.compile("(<img[^>]*src\\s*=\\s*[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>)");
		Matcher match = src.matcher(post.getPostContent());
		
		while(match.find()) {
			file[matchNum] = match.group(2).trim().split("/IMG/post/")[1];
    		matchNum++;
    		if(matchNum == 4) break;
		}

		post.setPostFile1(file[0]);
		post.setPostFile2(file[1]);
		post.setPostFile3(file[2]);
		post.setPostFile4(file[3]);
		post.setPostFile5(file[4]);
		
		return postDao.postWrite(post);
	}


	// 포스트 업데이트
	@Override
	public void postUpdate(Post post) {
		String file[] = new String[5];
		int matchNum = 0;
		Pattern src = Pattern.compile("(<img[^>]*src\\s*=\\s*[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>)");
		Matcher match = src.matcher(post.getPostContent());
		
		while(match.find()) {
			file[matchNum] = match.group(2).trim().split("/IMG/post/")[1];
    		matchNum++;
    		if(matchNum == 4) break;
		}

		post.setPostFile1(file[0]);
		post.setPostFile2(file[1]);
		post.setPostFile3(file[2]);
		post.setPostFile4(file[3]);
		post.setPostFile5(file[4]);
		
		postDao.postUpdate(post);
	}

	@Override
	public void postDelete(int postNo) {
		postDao.postDelete(postNo);
	}

} 
