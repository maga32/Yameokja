package com.project.yameokja.dao.report;

import java.util.List;

import com.project.yameokja.domain.Report;


public interface ReportDao {

	// 신고 입력
	public void addReport(Report report);
	
	// 신고목록 조회
	public List<Report> getReportList(String reportType, int reportPunishCheck, String type, String keyword);
	
	// 신고 목록 수 조회
	public int reportCount(String reportType, int reportPunishCheck, String type, String keyword);
}
