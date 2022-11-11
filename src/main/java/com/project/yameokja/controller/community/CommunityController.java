package com.project.yameokja.controller.community;

import java.io.File;  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.project.yameokja.domain.Member;
import com.project.yameokja.service.community.CommunityService;
import com.project.yameokja.service.member.MemberService;


@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityListService;
	
	@Autowired
	MemberService memberService;
	
	private final static String DEFAULT_PATH = "/resources/IMG/community";

	// 커뮤니티 리스트 출력
	@RequestMapping("/communityList")
	public String communityList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="categoryNo", required=false, defaultValue="all") String categoryNo,
			@RequestParam(value="communitySearchType", required=false, defaultValue="null") String type,			
			@RequestParam(value="communitySearchKeyword", required=false, defaultValue="null") String keyword,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) {
	
		String location = memberService.getMember((String)session.getAttribute("memberId")).getMemberAddress(); 
		
		Map<String, Object> coMap = communityListService.getCommunity(type, keyword, pageNum, categoryNo, location); 
		
		model.addAllAttributes(coMap);
		model.addAttribute("location", location);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		
		System.out.println("controller - categoryNo : " + categoryNo);


		return "community/communityList";
	}
	
	// 수다글 작성폼
	@RequestMapping("/community101WriteForm")
	public String community101WriteForm(HttpSession session,
			HttpServletResponse respones, PrintWriter out) {
		
		respones.setContentType("text/html; charset=utf-8");
		
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null) {
			
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();				
			
			return null;
		}

		return "community/community101WriteForm";
	}
	
	// 수다글 수정폼
	@RequestMapping("/community101UpdateForm")
	public String community101UpdateForm(HttpSession session, Model model,
			HttpServletResponse respones, PrintWriter out, int communityNo) {
		
		respones.setContentType("text/html; charset=utf-8");
		
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null) {
			
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();				
			
			return null;
		}
		
		Community co = communityListService.getCommunityOne(communityNo);
		model.addAttribute("co", co);
		
		return "community/community101UpdateForm";
	}											
	
	// 수다글 작성 프로세스
	@RequestMapping(value="/community101WriteProcess", method=RequestMethod.POST)
	public String community101WriteProcess(String co101Id, String co101Nickname,
			String co101Title, String co101Content, HttpServletRequest request,  HttpSession session,
			@RequestParam(value="co101File", required=false) MultipartFile multipartFile ) throws IllegalStateException, IOException {
		
		Community co = new Community();
		
		co.setCommunityContent(co101Content);
		co.setCommunityTitle(co101Title);
		co.setMemberId(co101Id);
		co.setMemberNickname(co101Nickname);
		co.setCategoryNo(101);
		co.setMemberAddress(memberService.getMember((String) session.getAttribute("memberId")).getMemberAddress());
		
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
	
	// 수다글 수정 프로세스
	@RequestMapping(value="community101UpdateProcess", method=RequestMethod.POST)
	public String community102UpdateProcess(String co101Id, String co101Nickname,  int communityNo,
			String co101Title, String co101Content, HttpServletRequest request,
			@RequestParam(value="co101File", required=false) MultipartFile multipartFile ) throws IllegalStateException, IOException {
		
		Community co = new Community();
		
		co.setCommunityNo(communityNo);
		co.setCommunityContent(co101Content);
		co.setCommunityTitle(co101Title);
		
		if( !multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());
			
	 
			multipartFile.transferTo(file);
			co.setCommunityFile(saveName);
		}
		
		communityListService.updateCommunity101(co);
		return "redirect:/communityList";
	}
	
	// 모집글 작성폼
	@RequestMapping("/community102WriteForm")
	public String community102WriteForm() {

		return "community/community102WriteForm";
	}
	
	// 모집글 수정 폼
	@RequestMapping(value="community102UpdateForm", method=RequestMethod.POST)
	public String community102WriteForm(HttpSession session, Model model,
			HttpServletResponse respones, PrintWriter out, int communityNo) {
		
		respones.setContentType("text/html; charset=utf-8");
		
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null) {
			
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();				
			
			return null;
		}
		
		Community co = communityListService.getCommunityOne(communityNo);
		model.addAttribute("co", co);
		
		return "community/community102UpdateForm";
	}
	
	// 모집글 작성 프로세스
	@RequestMapping(value="community102WriteProcess", method=RequestMethod.POST)
	public String community102WriteProcess(String co102Id, String co102Nickname,
			String co102Title, String co102Content, String co102PartyDDay,
			String co102PartyPlace, int co102PartyMembers, HttpServletRequest request, HttpSession session,
			@RequestParam(value="co102File", required=false) MultipartFile multipartFile ) throws IllegalStateException, IOException {
		
		String[] splitDDay = co102PartyDDay.split("T");
		String sumDDay = splitDDay[0] + " " +splitDDay[1] + ":00";
		Timestamp co102PartyDDayResult = Timestamp.valueOf(sumDDay); 
		
		Community co = new Community();
		
		co.setCommunityContent(co102Content);
		co.setCommunityTitle(co102Title);
		co.setMemberId(co102Id);
		co.setMemberNickname(co102Nickname);
		co.setCategoryNo(102);
		co.setPartyMembers(co102PartyMembers);
		co.setPartyPlace(co102PartyPlace);
		co.setPartyDDay(co102PartyDDayResult);
		co.setpartyMemberIds(co102Id);
		co.setMemberAddress(memberService.getMember((String) session.getAttribute("memberId")).getMemberAddress());

	
		if( !multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());

			multipartFile.transferTo(file);
			co.setCommunityFile(saveName);
		}
	
		communityListService.addCommunity102(co);
		
		return "redirect:/communityList";
	}
	
	// 모집글 수정 프로세스
	@RequestMapping(value="community102UpdateProcess", method=RequestMethod.POST)
	public String community102UpdateProcess(String co102Id, String co102Nickname,
			String co102Title, String co102Content, int communityNo, String co102PartyDDay,
			String co102PartyPlace, int co102PartyMembers, HttpServletRequest request,
			@RequestParam(value="co102File", required=false) MultipartFile multipartFile ) throws IllegalStateException, IOException {
		
		String[] splitDDay = co102PartyDDay.split("T");
		String sumDDay = splitDDay[0] + " " +splitDDay[1] + ":00";
		Timestamp co102PartyDDayResult = Timestamp.valueOf(sumDDay);
		
		Community co = new Community();
		
		co.setCommunityNo(communityNo);
		co.setCommunityContent(co102Content);
		co.setCommunityTitle(co102Title);
		co.setPartyMembers(co102PartyMembers);
		co.setPartyPlace(co102PartyPlace);
		co.setPartyDDay(co102PartyDDayResult);

	
		if( !multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());

			multipartFile.transferTo(file);
			co.setCommunityFile(saveName);
		}
	
		communityListService.updateCommunity102(co);
		
		return "redirect:/communityList";
	}
	
	
	// 모집 참여 및 참여취소
	@RequestMapping("/btn102PartyJoin")
	public String partyJoin(int communityNo, HttpSession session, Model model,
				HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 해당 동네글 정보 조회
		Community co = communityListService.getCommunityOne(communityNo);
		String loginId = (String) session.getAttribute("memberId");
		
		if(co == null || (loginId == null) ) {
			System.out.println("co가 비었거나, 로그인 상태가 아닙니다.");
			return "redirect:communityDetail?communityNo="+communityNo;
		}
		
		boolean joinCheck = false;
		String allMembers = co.getpartyMemberIds();
		String[] members = allMembers.split(",");
		
		
		// 모집 참여 - timestamp 확인 및 비교 메서드(partyDDayCheck)사용
		boolean result = partyDDayCheck(co);
		model.addAttribute("result", result);
		
		if(!result) {
			out.println("<script>");
			out.println("alert('모집기간이 초과되었습니다.');");
			out.println("</script>");
			
			return "redirect:communityDetail?communityNo="+communityNo;
		}
		// 모집참여 - timestamp 확인 및 비교 종료
		
		
		// 참여 인원 비교 및 참여 승인 여부 
		int countPartyMembers = 0;
		
		for(int i =0; i < members.length; i++) {
			countPartyMembers += 1;		
			if(loginId.equals(members[i])) {
				joinCheck = true;
			}
		}

		System.out.println("joinCheck : " + joinCheck + "allMembers : " + allMembers);
		
		if( joinCheck ) {
			allMembers = allMembers.replace("," + loginId, "");
			communityListService.update102PartyMemberIds(allMembers, co.getCommunityNo());
			System.out.println("참여 실행 취소");
		}else {
			if(countPartyMembers >= co.getPartyMembers()) {
				System.out.println("참여인원 초과");
				return "redirect:communityDetail?communityNo="+communityNo;
			}
			allMembers += ","+ loginId;	
			communityListService.update102PartyMemberIds(allMembers, co.getCommunityNo());
			System.out.println("참여 실행");	
		}
		
		return "redirect:communityDetail?communityNo="+communityNo;
	}	
	
	// 커뮤니티 글 삭제
	@RequestMapping("/communityDelete")
	public String communityDelete(int communityNo, HttpSession session) {
		
		String memberId = (String) session.getAttribute("memberId");
		Community co = communityListService.getCommunityOne(communityNo);
		
		if(memberId.equals(co.getMemberId())) {
			communityListService.deleteCommunity(communityNo);
		}else {
			System.out.println("con-communityDelete : 작성자가 아님");
		}
		
		return "redirect:communityList";
	}
	
	// 커뮤니티 글 상세보기
	@RequestMapping("/communityDetail")
	public String communityDetail(Model model, int communityNo,
			HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("codetail start");
		
		// 조회수. readCommunityPost - 현재 세션에 담겨있는 조회한 글들을 불러오고, 없다면 새로 저장
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
		// 조회수 end
		
		Community co = communityListService.getCommunityOne(communityNo);
		model.addAttribute("co", co);
		System.out.println("con-coMemberPhoto : " + co.getMemberPhoto() );	
		
		// 댓글 출력. 불러온 글의 coNo를 부모글 번호로 가지는 댓글들을 불러옴.
		if( co != null) {
			co.setCommunityParentNo(co.getCommunityNo());
			List<Community> coReplyList = communityListService.getCommunityReply(co);
			model.addAttribute("coReplyList", coReplyList);
		}
		// 댓글 출력 end
		
		// mid
		System.out.println("codetail mid");
		
		// 모집글.
		// 모집 참여 - timestamp 확인 및 비교 메서드(partyDDayCheck)사용
		if(co.getPartyDDay() != null) {
			boolean result = partyDDayCheck(co);
			model.addAttribute("result", result);
			
			if(!result) {
				out.println("<script>");
				out.println("alert('모집기간이 초과되었습니다.');");
				out.println("</script>");
				
				return "redirect:communityDetail?communityNo="+communityNo;
			}
		}
		
		// 해당 글 모집 참가인원 조회
		int countPartyMembers = 0;
		List<Member> memberPhotoList = new ArrayList<Member>();
		if(co.getpartyMemberIds() == null) {
			System.out.println("this.categoryNo = 101");
			return "community/communityDetail";
		}
		String[] members = co.getpartyMemberIds().split(",");
		
		System.out.println("con members : " + members[0]);
		
		for(int i = 0; i<members.length; i++) {
			countPartyMembers += 1;
			Member memberPhoto = memberService.getMemberFor102(members[i]);
			memberPhotoList.add(memberPhoto);
		}
		model.addAttribute("memberPhotoList", memberPhotoList);
		model.addAttribute("countPartyMembers", countPartyMembers);
		
		
		System.out.println("codetail end");
		// 모집글 end
		
		return "community/communityDetail";
	}
	
	
	// 커뮤니티 댓글 작성 및 수정
	@ResponseBody
	@RequestMapping(value="/replyWrite.ajax", method=RequestMethod.POST)
	public List<Community> replyWriteAjax(Community community, HttpSession session) throws IOException {
		
		// 답글의 경우 session에 있는 작성자 정보를 못가져와서, if문으로 제어
		if( community != null) {
			if(community.getMemberId() == null) {
				community.setMemberId(((Member) session.getAttribute("member")).getMemberId());
				community.setMemberNickname(((Member) session.getAttribute("member")).getMemberNickname());
			}
		}
		
		System.out.println("contorller - communtiyNo : " + community.getCommunityNo());
		if(community.getCommunityNo() == 0) {
			communityListService.addCommunityReply(community);
			System.out.println("커뮤번호0, 멤버아이디 조회 : " + community.getMemberId() );
		}else {
			communityListService.updateCommunityReply(community);
		}
		
		System.out.println("rewrite end");
		return communityListService.getCommunityReply(community);
	}
	
	
	// 커뮤니티 댓글 삭제
	@RequestMapping(value="/replyDelete.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Object replyDeleteAjax(HttpServletResponse response, HttpSession session,
			int replyCommunityNo, int replyCommunityParentNo) throws IOException {
		
		String memberId = communityListService.getCommunityReplyMemberId(replyCommunityNo);
		
		if( memberId.equals(session.getAttribute("memberId"))){
			communityListService.delCommunityReply(replyCommunityNo, replyCommunityParentNo);
			
			System.out.println("controller - memberId : " + memberId + " / sessionId : " + session.getAttribute("memberId"));
			
		}else {
			boolean communityReplyIdCheck = false;
			return communityReplyIdCheck;
		}
		
		Community co = new Community();
		co.setCommunityParentNo(replyCommunityParentNo);
	
		return communityListService.getCommunityReply(co);
	} 
	
	// 모집글에 저장된 dday와 현재 시간을 비교해 boolean을 반환해주는 함수
	public boolean partyDDayCheck(Community co) {
		
			Timestamp dDay = co.getPartyDDay();
			Timestamp today = new Timestamp(System.currentTimeMillis());
			
			boolean result = today.before(dDay);
			
		System.out.println("controller - dDay: " + dDay + " today : " + today + " result : " + result);
		return result;
	}
}
