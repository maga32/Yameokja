package com.project.yameokja.controller.store;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.yameokja.domain.Post;
import com.project.yameokja.domain.Store;
import com.project.yameokja.service.store.PostService;
import com.project.yameokja.service.store.StoreService;

@Controller
public class PostController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private PostService postService;
	 
	// 포스트 글쓰기
	@RequestMapping("/postWriteForm")
	public String postWriteForm(Model model, int storeNo) {
		Store store = storeService.getStore(storeNo);
		
		model.addAttribute("store", store);

		return "store/postWriteForm";
	}
	
	
	// 이미지경로
	private final static String DEFAULT_PATH = "/resources/IMG/post";
	
	// 포스트 이미지업로드
	@RequestMapping("postIMGUpload")
	public void postIMGUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IllegalStateException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		//파일경로 지정
		String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);

		//uuid만들기
		UUID uid = UUID.randomUUID();
		//파일명
		String saveName = uid.toString() + "." + FilenameUtils.getExtension(upload.getOriginalFilename());

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		OutputStream out = new FileOutputStream(new File(filePath, saveName));

		out.write(bytes);

		// 클라이언트에 결과 표시
		String callback = request.getParameter("CKEditorFuncNum");

		// 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();
		String fileUrl = "/yameokja/resources/IMG/post/" + saveName;
		
		printWriter.println("<script>" 
							+ "window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.');"
							+ "</script>");
		printWriter.flush();
		
	}
	
	// 포스트 업로드
	@RequestMapping("/postWriteProcess")
	public String postWriteProcess(HttpSession session, Post post) {
		post.setMemberId((String) session.getAttribute("memberId"));
		post.setMemberNickname((String) session.getAttribute("memberNickname"));
		postService.postWrite(post);
		
		return "redirect:storeDetailContent?storeNo="+ post.getStoreNo() + "&postNo=" + post.getPostNo();
	}
	
}
