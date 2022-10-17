package com.project.yameokja.controller.community;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.yameokja.domain.Community;
import com.project.yameokja.service.community.CommunityListService;


@Controller
public class CommunityListController {
	
	@Autowired
	CommunityListService communityListService;
	
	private final static String DEFAULT_PATH = "/resources/upload/";

	// 커뮤니티 리스트 출력
	@RequestMapping("/communityList")
	public String communityList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="categoryNo", required=false, defaultValue="all") String categoryNo,
			@RequestParam(value="communitySearchType", required=false, defaultValue="null") String type,			
			@RequestParam(value="communitySearchKeyword", required=false, defaultValue="null") String keyword,
			HttpServletResponse response, HttpServletRequest request) {
	
		Map<String, Object> coMap = communityListService.getCommunity(type, keyword, pageNum, categoryNo); 
		
		model.addAllAttributes(coMap);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		
		System.out.println("controller - categoryNo : " + categoryNo);


		return "community/communityList";
	}
	
	// 수다글 작성폼
	@RequestMapping("community101WriteForm")
	public String community101WriteForm(HttpSession session,
			HttpServletResponse respones, PrintWriter out) {
		
		respones.setContentType("text/html; charset=utf-8");
		
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null) {
			
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다.')");
			out.println("history.back();");
			out.println("</script>");
				
			return null;
		}
		
		
		return "community/community101WriteForm";
	}
	
	
	// 모집글 작성폼 - communityWriteController 
	@RequestMapping("community102WriteForm")
	public String community102WriteForm() {
		
		return "community/community101WriteForm";
	}
	
	// 수다글 작성 프로세스
	@RequestMapping(value="community101WriteProcess", method=RequestMethod.POST)
	public String community101WriteProcess(String co101Id, String co101Nickname,
			String co101Title, String co101Content, HttpServletRequest request,
			@RequestParam(value="co101File", required=false) MultipartFile multipartFile ) throws IllegalStateException, IOException {
		
		Community co = new Community();
		
		co.setCommunityContent(co101Content);
		co.setCommunityTitle(co101Title);
		co.setMemberId(co101Id);
		co.setMemberNickname(co101Nickname);
		co.setCategoryNo(101);
		
		if( !multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());
			
	 
			multipartFile.transferTo(file);
			co.setCommunityFile(saveName);
		}
		
		communityListService.addCommunity101(co);
		
		return "redirect:/communityList";
	}
	
	// 커뮤니티 글 상세보기
	@RequestMapping("/communityDetail")
	public String communityDetail(Model model, int communityNo,
			HttpServletRequest request, HttpSession session) {

		
		String readCommunityPost = (String) session.getAttribute("readCommunityPost");
				
		if(readCommunityPost == null) {
			
			readCommunityPost = Integer.toString(communityNo);
			session.setAttribute("readCommunityPost", readCommunityPost);
			communityListService.addReadCount(communityNo);

		}else if(readCommunityPost != null){
			
			System.out.println("controllerSession3 : " + readCommunityPost);
			
			boolean sessionCheck = readCommunityPost.contains(Integer.toString(communityNo));
			System.out.println("controllerSessionCheck : " + sessionCheck );
			
			if(!sessionCheck) {
				communityListService.addReadCount(communityNo);
				readCommunityPost += ", " + Integer.toString(communityNo);
				session.setAttribute("readCommunityPost", readCommunityPost);
			}
		}
		
		Community co = communityListService.getCommunityOne(communityNo);
		model.addAttribute("co", co);
		
		if( co != null) {
			co.setCommunityParentNo(co.getCommunityNo());
			List<Community> coReplyList = communityListService.getCommunityReply(co);
			model.addAttribute("coReplyList", coReplyList);
		}
		
		return "community/communityDetail";
	}
	
	// 커뮤니티 댓글 작성
	@RequestMapping(value="/replyWrite.ajax", method=RequestMethod.POST)
	@ResponseBody
	public List<Community> replyWriteAjax(Community community, HttpSession session) throws IOException {

		// 답글의 경우 session에 있는 작성자 정보를 못가져와서, if문으로 제어
		if( community != null) {
			if(community.getMemberId() == null) {
				community.setMemberId((String) session.getAttribute("memberId"));
				community.setMemberNickname((String) session.getAttribute("memberNickname"));
			}
		}
		
		communityListService.addCommunityReply(community);
		
		return communityListService.getCommunityReply(community);
	}
	
	// 커뮤니티 댓글 삭제
	@RequestMapping(value="/replyDelete.ajax", method=RequestMethod.POST)
	@ResponseBody
	public List<Community> replyDeleteAjax(
			int replyCommunityNo, int replyCommunityParentNo) {
		
		communityListService.delCommunityReply(replyCommunityNo);
		
		Community co = new Community();
		co.setCommunityParentNo(replyCommunityParentNo);
	
		return communityListService.getCommunityReply(co);
	} 
}
