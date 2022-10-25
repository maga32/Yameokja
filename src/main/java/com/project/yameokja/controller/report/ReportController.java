package com.project.yameokja.controller.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.yameokja.service.report.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	// 신고 팝업창
	@RequestMapping("/reportForm")
	public String reportForm() {
		
		return "report/reportForm";
	}
	
}
