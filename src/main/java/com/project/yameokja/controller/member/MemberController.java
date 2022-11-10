package com.project.yameokja.controller.member;

import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.yameokja.domain.Member;
import com.project.yameokja.service.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	private static final String DEFAULT_PATH = "/resources/IMG/member";

	// 회원가입 폼
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		
		return "member/memberJoinForm";
	}
	
	// 회원수정 폼
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm(String memberId, Model model) {
		
		Member member = memberService.getMember(memberId);
		
		String[] memberEmail = (member.getMemberEmail()).split("@");
		String email = memberEmail[0];
		String domain = memberEmail[1];
		
		String[] memberMobile = (member.getMemberMobile()).split("-");
		String phone1 = memberMobile[0];
		String phone2 = memberMobile[1];
		String phone3 = memberMobile[2];
		
		String[] memberAddress = (member.getMemberAddress().split(","));
		String largeAddress = memberAddress[0];
		String smallAddress = memberAddress[1];
		
		
		String[] memberFavoriteCategory = member.getMemberFavoriteCategory().split(",");
		String[] categoryList = {"한식", "양식", "중식", "일식", "아시안", "술집", "카페,디저트", "분식", "고기", "채식", "패스트푸드", "기타"};
		
		ArrayList<foodCategories> foodCategoryList = new ArrayList<foodCategories>();
		int index = 1;
		for (String item : categoryList) {
			foodCategories food = new foodCategories(index, item);
			foodCategoryList.add(food);
		    index += 1;
		}
		
		System.out.println("memberFavoriteCategory : " + memberFavoriteCategory[0]);
	
		model.addAttribute("memberFavoriteCategory", memberFavoriteCategory);
		model.addAttribute("foodCategoryList", foodCategoryList);
		model.addAttribute("largeAddress", largeAddress);
		model.addAttribute("smallAddress", smallAddress);
		model.addAttribute("email", email);
		model.addAttribute("domain", domain);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		model.addAttribute("member", member);
		
		return "member/memberUpdateForm";
	}
	
	public static class foodCategories{
		private int index;
		private String value;
		
		public foodCategories(int index, String value) {
			this.index = index;
			this.value = value;
		}

		public int getIndex() {
			return index;
		}
		public String getValue() {
			return value;
		}	
	}
	
	

	// 회원가입 프로세스
	@RequestMapping(value="/memberJoinProcess", method=RequestMethod.POST)
	public String addMember(String memberName, String memberId, String memberNickname,
			String pass1, String pass2, String email, String domain,
			String phone1, String phone2, String phone3,	String address1, String address2,
			@RequestParam(value="memberPhoto", required=false) MultipartFile multipartFile,
			String memberFavoriteCategory, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Member m = new Member();

				
		m.setMemberName(memberName);
		m.setMemberId(memberId);
		m.setMemberNickname(memberNickname);
		m.setMemberPassword(pass1);
		m.setMemberEmail(email + "@" + domain);
		m.setMemberMobile(phone1 + "-" + phone2 + "-" +phone3);
		m.setMemberAddress(address1 + "," + address2);
		m.setMemberFavoriteCategory(memberFavoriteCategory);
		
		if(!multipartFile.isEmpty()) {
		
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());
			
			multipartFile.transferTo(file);
			m.setMemberPhoto(saveName);
		}
		
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.');");
		out.println("</script>");
		
		memberService.addMember(m);
		
		return "redirect:/main";
	};
	
	// 회원 수정 프로세스
	@RequestMapping(value="/memberUpdateProcess", method=RequestMethod.POST)
	public String memberUpdateProcess(String memberId, String memberNickname,
			String email, String domain, String phone1, String phone2, String phone3,
			String address1, String address2, String memberFavoriteCategory, HttpServletResponse response,
			@RequestParam(value="memberPhoto", required=false) MultipartFile multipartFile,
			HttpServletRequest request) throws IOException{
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Member member = new Member();
		
		member.setMemberId(memberId);
		member.setMemberNickname(memberNickname);
		member.setMemberEmail(email + "@" + domain);
		member.setMemberMobile(phone1 + "-" + phone2 + "-" +phone3);
		member.setMemberAddress(address1 + " " + address2);
		member.setMemberFavoriteCategory(memberFavoriteCategory);
		
		if(!multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());
			
			multipartFile.transferTo(file);
			member.setMemberPhoto(saveName);
		}
		
		memberService.updateMember(member);
		
		
		out.println("<script>");
		out.println("alert('회원수정이 완료되었습니다.');");
		out.println("</script>");
		
		return "redirect:/main";
	}

	// 회원 탈퇴
	@RequestMapping("/memberDelete")
	public String memberDelete(HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		session.invalidate();
		memberService.deleteMember(memberId);
		
		return "redirect:/main";
	}
	
	// 아이디 중복확인
	@RequestMapping("/overlapIdCheck")
	public String memberidCheck(Model model, String memberId,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(memberId.length() < 5) {
			out.println("<script>");
			out.println("alert('아이디는 5자 이상 입력해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		boolean overlap = memberService.idOverlapCheck(memberId);

		model.addAttribute("overlap", overlap);
		model.addAttribute("memberId", memberId);

		return "member/overlapIdCheck";
	}
	
	
	
	// 닉네임 중복확인
	@RequestMapping("/overlapNicknameCheck")
	public String memberNicknameCheck(Model model, String memberNickname,
			boolean updateCheck,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(memberNickname.length() < 2) {
			out.println("<script>");
			out.println("alert('닉네임은 2자 이상 입력해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		
		boolean overlap = memberService.nicknameOverlapCheck(memberNickname);
		
		System.out.println("updateCheck" + updateCheck);
		model.addAttribute("updateCheck", updateCheck);
		model.addAttribute("overlap", overlap);
		model.addAttribute("memberNickname", memberNickname);
		
		return "member/overlapNicknameCheck";
	}
	
	// 멤버 차단 ajax
	@RequestMapping("/memberBlock.ajax")
	@ResponseBody
	public Map<String, Integer> memberBlock(HttpSession session, String targetId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberService.isBlockedMe(targetId, memberId)) {
			map.put("result", 0);
		} else {
			memberService.memberBlock(memberId, targetId);
			map.put("result", 1);
		}
		
		System.out.println("차단멤버 : " + memberService.getMember(memberId).getMemberBlockIds());
		return map;
	}

	// 멤버 차단해제 ajax
	@RequestMapping("/memberUnblock.ajax")
	@ResponseBody
	public Map<String, Integer> memberUnblock(HttpSession session, String targetId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberService.isBlockedMe(targetId, memberId)) {
			memberService.memberUnblock(memberId, targetId);
			map.put("result", 1);
		} else {
			map.put("result", 0);
		}
		
		System.out.println("차단멤버 : " + memberService.getMember(memberId).getMemberBlockIds());
		return map;
	}
	
	// 멤버클릭 ajax
	@RequestMapping("/memberInfo.ajax")
	@ResponseBody
	public Map<String, Integer> memberInfo(HttpSession session, String targetId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		Member member = (Member) session.getAttribute("member");
		
		if(memberService.isBlockedMe(targetId, member.getMemberId())) {
			map.put("block", 1);
		} else {
			map.put("block", 0);
		}
		map.put("memberLevel", member.getMemberLevel());
		
		return map;
	}

	// 멤버 주소변경 ajax
	@RequestMapping("/memberChangeAddress.ajax")
	@ResponseBody
	public int memberChangeAddress(HttpSession session, String memberAddress) {
		int result = 0;
		Member member = (Member) session.getAttribute("member");
		
		if(member.getMemberId() != null) {
			member.setMemberAddress(memberAddress);
			memberService.updateMember(member);
			result = 1;
		}
		return result;
	}
}
