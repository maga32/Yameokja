package com.project.yameokja.service.store;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.store.PostDao;
import com.project.yameokja.domain.Post;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostDao postDao;
	
	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}

	@Override
	public List<Post> postList(int storeNo) {
		return postDao.postList(storeNo);
	}
	
	@Override
	public List<Post> postListReply(int storeNo) {
		return postDao.postListReply(storeNo);
	}

	@Override
	public Post getPost(int postNo) {
		return postDao.getPost(postNo);
	}

	@Override
	public void insertPost(Post post) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePost(Post post) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Post> bestOnePost(int storeNo) {
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

}
