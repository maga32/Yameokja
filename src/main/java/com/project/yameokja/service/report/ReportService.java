package com.project.yameokja.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.yameokja.dao.report.ReportDao;

@Service
public class ReportService {
	
	@Autowired
	ReportDao reportDao;
}
