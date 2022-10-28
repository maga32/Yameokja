
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- report_no, report_type, report_target, report_content, report_date, report_file, 
-- report_punish_check, report_punish_content, member_id, category_no

DROP TABLE IF EXISTS report;
CREATE TABLE IF NOT EXISTS report(
  report_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  report_title VARCHAR(1000) NOT NULL,
  report_type VARCHAR(20) NOT NULL,
  report_target VARCHAR(20) NOT NULL,  
  report_content VARCHAR(1000) NOT NULL,
  report_date TIMESTAMP NOT NULL,
  report_file INTEGER(5) NULL,
  report_punish_check VARCHAR(100) NOT NULL default 0,
  report_punish_content VARCHAR(1000) NULL,
  
  member_id VARCHAR(20) NOT NULL,
  category_no INTEGER(10) NOT NULL,
  CONSTRAINT report_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT report_category_fk FOREIGN KEY(category_no) REFERENCES category(category_no)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


##################################################################################################################report_no, report_type, report_target, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no
INSERT INTO report (report_type, report_title, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type01', 'title1', 'report_target', 'report_content01', '2017-12-01 05:44:32', NULL, '1', NULL, 'memberId01', '1');
INSERT INTO report (report_type, report_title, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type01', 'title1', 'report_target', 'report_content01', '2017-12-01 05:44:32', NULL, '0', NULL, 'memberId02', '1');
INSERT INTO report (report_type, report_title, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type01', 'title1', 'report_target', 'report_content01', '2017-12-01 05:44:32', NULL, '1', NULL, 'memberId03', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type02', 'report_target', 'report_content02', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId02', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type03', 'report_target', 'report_content03', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId03', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type04', 'report_target', 'report_content04', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId04', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type05', 'report_target', 'report_content05', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId05', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type06', 'report_target', 'report_content06', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId06', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type07', 'report_target', 'report_content07', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId07', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type08', 'report_target', 'report_content08', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId08', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type09', 'report_target', 'report_content09', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId09', '1');
INSERT INTO report (report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('report_type10', 'report_target', 'report_content10', '2017-12-01 05:44:32', NULL, 'report_punish_check', NULL, 'memberId10', '1');

COMMIT;

SELECT * FROM report;

