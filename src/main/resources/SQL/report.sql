
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- rp_no, rp_type, rp_target, rp_content, rp_date, rp_file, 
-- rp_punish_check, rp_punish_content, mb_id, c_no

DROP TABLE IF EXISTS report;
CREATE TABLE IF NOT EXISTS report(
  rp_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  rp_type VARCHAR(20) NOT NULL,
  rp_target VARCHAR(20) NOT NULL,  
  rp_content VARCHAR(1000) NOT NULL,
  rp_date TIMESTAMP NOT NULL,
  rp_file INTEGER(5) NULL,
  rp_punish_check VARCHAR(100) NOT NULL,
  rp_punish_content VARCHAR(1000) NULL,
  
  mb_id VARCHAR(20) NOT NULL,
  c_no INTEGER(10) NOT NULL,
  CONSTRAINT report_member_fk FOREIGN KEY(mb_id) REFERENCES member(mb_id),
  CONSTRAINT report_category_fk FOREIGN KEY(c_no) REFERENCES category(c_no)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

##################################################################################################################rp_no, rp_type, rp_target, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type01', 'rp_target', 'rp_content01', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId01', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type02', 'rp_target', 'rp_content02', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId02', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type03', 'rp_target', 'rp_content03', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId03', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type04', 'rp_target', 'rp_content04', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId04', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type05', 'rp_target', 'rp_content05', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId05', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type06', 'rp_target', 'rp_content06', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId06', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type07', 'rp_target', 'rp_content07', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId07', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type08', 'rp_target', 'rp_content08', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId08', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type09', 'rp_target', 'rp_content09', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId09', '1');
INSERT INTO report (rp_type, rp_target, rp_content, rp_date, rp_file, rp_punish_check, rp_punish_content, mb_id, c_no) VALUES ('rp_type10', 'rp_target', 'rp_content10', '2017-12-01 05:44:32', NULL, 'rp_punish_check', NULL, 'memberId10', '1');

COMMIT;

SELECT * FROM report;

