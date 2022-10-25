package com.project.yameokja.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.report.ReportDao;
import com.project.yameokja.domain.Report;

@Service
public class ReportService {
	
	@Autowired
	ReportDao reportDao;
	
	// 신고 입력
	public void addReport(Report report) {
		reportDao.addReport(report);
	}
	
	// 신고 목록 조회
	public List<Report> getReportList(){
		return reportDao.getReportList();
	}
}
