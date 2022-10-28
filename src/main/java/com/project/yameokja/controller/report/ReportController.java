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

import com.project.yameokja.domain.Report;
import com.project.yameokja.service.report.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	// 신고 팝업창
	@RequestMapping("/reportForm")
	public String reportForm(Model model, HttpSession session, HttpServletResponse response,
			@RequestParam(value="categoryNo", required=false, defaultValue="-7") int categoryNo,
			@RequestParam(value="userId", required=false, defaultValue="null")String userId,
			@RequestParam(value="reportType", required=false, defaultValue="null")String reportType,
			String reportTarget) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		// 카테고리 번호로 분류 나누기
//		String reportType = "";
//		if(categoryNo >= 101 && categoryNo <= 102) {
//			reportType = "community";
//		}else if(categoryNo >=1 && categoryNo <=12) {
//			reportType = "store";
//		}
		
		model.addAttribute("reportType", reportType);
		model.addAttribute("reportTarget", reportTarget);
		model.addAttribute("categoryNo", categoryNo);	
		
		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId == null) {
			System.out.println("reportCon - memberId null 로그인 안됨");
			out.println("<script>");
			out.println("	window.opener.location.href='main';");
			out.println("	window.close();");
			out.println("</script>");

			return null;
		}
		if(memberId.equals(reportTarget)) {
			System.out.println("reportCon - memberId ==  신고자와 신고대상자가 같음");
			out.println("<script>");
			out.println("	window.opener.location.href='main';");
			out.println("	window.close();");
			out.println("</script>");

			return null;
		}
		
		return "report/reportForm";
	}
	
	// 신고 입력
	@RequestMapping(value="/addReport", method=RequestMethod.POST)
	public String addReport(Model model, HttpSession session, HttpServletRequest request,
			String reportType, String reportTarget, int categoryNo, String reportContent, String reportTitle,
			@RequestParam(value="reportFile", required=false) MultipartFile multipartFile ) throws IllegalStateException, IOException {
		
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
	
	// 신고 리스트 조회
	@RequestMapping("/reportList")
	public String reportList(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="reportType", required=false, defaultValue="")String reportType,
			@RequestParam(value="categoryNo", required=false, defaultValue="300")String categoryNo,
			@RequestParam(value="reportPusichCheck", required=false, defaultValue="0")int reportPunishCheck,
			@RequestParam(value="type", required=false)String type,
			@RequestParam(value="keyword", required=false)String keyword
			//@RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum
			) {
		
		List<Report> reportList = reportService.getReportList(reportType, reportPunishCheck, type, keyword);
		model.addAttribute("reportList", reportList);
		model.addAttribute("reportType", reportType);
		System.out.println(reportType);
		System.out.println(categoryNo);
		
		return "report/reportList";
	}
}

