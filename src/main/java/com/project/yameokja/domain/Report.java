package com.project.yameokja.domain;

import java.sql.Timestamp;

public class Report {

	private int reportNo;
	private String reportTitle;
	private String memberId;
	private String reportType;
	private int categoryNo;
	private String reportTarget;
	private String reportContent;
	private Timestamp reportDate;
	private String reportFile;
	private int reportPunishCheck;
	private String reportPunishContent;
	
	public Report() {}

	public Report(int reportNo, String reportTitle, String memberId, String reportType, int categoryNo, String reportTarget,
			String reportContent, Timestamp reportDate, String reportFile, int reportPunishCheck,
			String reportPunishContent) {
		
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.memberId = memberId;
		this.reportType = reportType;
		this.categoryNo = categoryNo;
		this.reportTarget = reportTarget;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportFile = reportFile;
		this.reportPunishCheck = reportPunishCheck;
		this.reportPunishContent = reportPunishContent;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getReportTarget() {
		return reportTarget;
	}

	public void setReportTarget(String reportTarget) {
		this.reportTarget = reportTarget;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Timestamp getReportDate() {
		return reportDate;
	}

	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportFile() {
		return reportFile;
	}

	public void setReportFile(String reportFile) {
		this.reportFile = reportFile;
	}

	public int getReportPunishCheck() {
		return reportPunishCheck;
	}

	public void setReportPunishCheck(int reportPunishCheck) {
		this.reportPunishCheck = reportPunishCheck;
	}

	public String getReportPunishContent() {
		return reportPunishContent;
	}

	public void setReportPunishContent(String reportPunishContent) {
		this.reportPunishContent = reportPunishContent;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	
}
