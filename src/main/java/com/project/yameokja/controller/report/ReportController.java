package com.project.yameokja.controller.report;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.yameokja.domain.Member;
import com.project.yameokja.domain.Report;
import com.project.yameokja.service.member.MemberService;
import com.project.yameokja.service.report.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;	
	@Autowired
	private MemberService memberService;

	@Autowired
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	// 신고 팝업창
	@RequestMapping(value = "/reportForm")
	public String reportForm(
			Model model, HttpSession session, HttpServletResponse response, String postNo,
			@RequestParam(value="categoryNo", required=false, defaultValue="-7")int categoryNo,
			@RequestParam(value="reportType", required=false, defaultValue="null")String reportType,
			@RequestParam(value="reportTarget", required=false, defaultValue="null")String reportTarget) 
					throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int reportFormCategoryNo = reportService.reportFormCategoryNo(reportTarget, categoryNo, postNo);
		
		//reportType와 userId 차이 알고 넣기
		model.addAttribute("reportType", reportType);
		model.addAttribute("reportTarget", reportTarget);
		model.addAttribute("categoryNo", reportFormCategoryNo);
		
		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId == null) {
			System.out.println("reportCon - memberId null 로그인 안됨");
			out.println("<script>");
			out.println("	history.back();");
			out.println("	alert('reportCon - memberId null 로그인 안됨');");
//			out.println("	window.opener.location.href='main';");
//			out.println("	window.close();");
			out.println("</script>");

			return null;
		}
		if(memberId.equals(reportTarget)) {
			System.out.println("reportCon - memberId ==  신고자와 신고대상자가 같음");
			out.println("<script>");
			out.println("	history.back();");
			out.println("	alert('reportCon - memberId ==  신고자와 신고대상자가 같음');");
//			out.println("	window.opener.location.href='main';");
//			out.println("	window.close();");
			out.println("</script>");

			return null;
		}
		
		return "forward:WEB-INF/views/report/reportForm.jsp";
	}
	
	// 신고 입력
	@RequestMapping(value="/reportAdd", method=RequestMethod.POST)
	public String addReport(Model model, HttpSession session, HttpServletRequest request,
			String reportType, String reportTarget, int categoryNo, String reportContent, String reportTitle,
			@RequestParam(value="reportFile", required=false) MultipartFile multipartFile )
					throws IllegalStateException, IOException 
	{
		
		Report report = new Report();
		String memberId = (String) session.getAttribute("memberId");
		
		report.setMemberId(memberId);
		report.setReportTitle(reportTitle);
		report.setReportType(reportType);
		report.setReportTarget(reportTarget);
		report.setCategoryNo(categoryNo);
		report.setReportContent(reportContent);
		
		if( !multipartFile.isEmpty()) {
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid  = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("file : " + file.getName());
			 
			multipartFile.transferTo(file);
			report.setReportFile(saveName);
		}	
		reportService.addReport(report);
		
		return "report/reportResultForm";
	}
	
	@RequestMapping("/report/reportResultForm")
	public String reportResultForm(){
		return "report/reportResultForm";
		
	}
	
	// 신고 리스트 조회
	@RequestMapping("/reportList")
	public String reportList(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="reportType", required=false, defaultValue="null")String reportType,
			@RequestParam(value="categoryNo", required=false, defaultValue="300")int categoryNo,
			@RequestParam(value="reportPunishCheck", required=false, defaultValue="0")String reportPunishCheck,
			@RequestParam(value="type", required=false, defaultValue="all")String type,
			@RequestParam(value="keyword", required=false, defaultValue="")String keyword,
			@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum,
			@RequestParam(value="userId", required=false, defaultValue="")String userId
			) {
		
		Map<String, Object> reportList = reportService.reportList(userId, categoryNo, reportPunishCheck, type, keyword, pageNum);

		//회원이 작성한 신고글만 가져오기
		model.addAllAttributes(reportList);
		model.addAttribute("reportType", reportType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("userId", userId);

		return "report/reportList";
	}
	

	@RequestMapping("/reportDetail")
	public String reportDetail(
			Model model, 
			@RequestParam(value="reportNo", required=false, defaultValue="1")int reportNo
			) {
		Report report = reportService.getReport(reportNo);
		Member member= memberService.getMember(report.getReportTarget());

		model.addAttribute("report", report);
		model.addAttribute("reportNo", reportNo);
		model.addAttribute("member", member);
		
		return "report/reportDetail";
	}
	
	@RequestMapping("/reportUpdateForm")
	public String reportUpdateForm(
			Model model, 
			@RequestParam(value="reportNo", required=false, defaultValue="1")int reportNo
			) {
		Report report = reportService.getReport(reportNo);
		model.addAttribute("report", report);
		
		return "report/reportUpdateForm";
	}
	
	@RequestMapping(value="/reportUpdate", method=RequestMethod.POST)
	public String reportUpdate(
			Model model, RedirectAttributes reAttrs, HttpSession session,
			@RequestParam(value="reportTitle", required=false, defaultValue="")String reportTitle,
			@RequestParam(value="reportContent", required=false, defaultValue="")String reportContent,
			@RequestParam(value="reportTarget", required=false, defaultValue="")String reportTarget,
			@RequestParam(value="reportType", required=false, defaultValue="")String reportType,
			@RequestParam(value="reportFile", required=false, defaultValue="")String reportFile,
			@RequestParam(value="reportPunishContent", required=false, defaultValue="")String reportPunishContent,
			@RequestParam(value="reportNo", required=false, defaultValue="0")int reportNo
			) {
		String memberId = (String) session.getAttribute("memberId");
		Report report = reportService.getReport(reportNo);
		report.setReportTitle(reportTitle);
		report.setReportContent(reportContent);
		report.setReportTarget(reportTarget);
		report.setReportType(reportType);
		report.setReportFile(reportFile);
		report.setReportPunishContent(reportPunishContent);

		reportService.reportUpdate(report);
		reAttrs.addAttribute("userId", memberId);

		return "redirect:reportList";
	}
	
	@RequestMapping(value="/deleteReport")
	public String deleteReport(
			RedirectAttributes reAttrs, HttpSession session,
			@RequestParam(value="reportNo", required=false, defaultValue="0")int reportNo
			) {
		String memberId = (String) session.getAttribute("memberId");
		reportService.deleteReport(reportNo);
		reAttrs.addAttribute("userId", memberId);
		return "redirect:reportList";
	}
	
	@RequestMapping(value="/memberPermanenSuspension")
	public String memberPermanenSuspension(
			RedirectAttributes reAttrs,
			@RequestParam(value="reportNo", required=false, defaultValue="")int reportNo,
			@RequestParam(value="reportTarget", required=false, defaultValue="")String memberId) {
		
		reportService.memberPermanenSuspension(memberId);
		
		reAttrs.addAttribute("reportNo", reportNo);
		return "redirect:reportDetail";
	}

}

