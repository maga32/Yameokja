package com.project.yameokja.dto;

import java.sql.Timestamp;

public class Report {

	private int rpNo;
	private String rpType;
	private String rpTarget;
	private String rpContent;
	private Timestamp rpDate;
	private String rpFile;
	private int rpPunishCheck;
	private String rpPunishContent;
	
	public Report() {}

	public Report(int rpNo, String rpType, String rpTarget, String rpContent, Timestamp rpDate, String rpFile,
			int rpPunishCheck, String rpPunishContent) {
		this.rpNo = rpNo;
		this.rpType = rpType;
		this.rpTarget = rpTarget;
		this.rpContent = rpContent;
		this.rpDate = rpDate;
		this.rpFile = rpFile;
		this.rpPunishCheck = rpPunishCheck;
		this.rpPunishContent = rpPunishContent;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public String getRpType() {
		return rpType;
	}

	public void setRpType(String rpType) {
		this.rpType = rpType;
	}

	public String getRpTarget() {
		return rpTarget;
	}

	public void setRpTarget(String rpTarget) {
		this.rpTarget = rpTarget;
	}

	public String getRpContent() {
		return rpContent;
	}

	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}

	public Timestamp getRpDate() {
		return rpDate;
	}

	public void setRpDate(Timestamp rpDate) {
		this.rpDate = rpDate;
	}

	public String getRpFile() {
		return rpFile;
	}

	public void setRpFile(String rpFile) {
		this.rpFile = rpFile;
	}

	public int getRpPunishCheck() {
		return rpPunishCheck;
	}

	public void setRpPunishCheck(int rpPunishCheck) {
		this.rpPunishCheck = rpPunishCheck;
	}

	public String getRpPunishContent() {
		return rpPunishContent;
	}

	public void setRpPunishContent(String rpPunishContent) {
		this.rpPunishContent = rpPunishContent;
	}
	
	
}
