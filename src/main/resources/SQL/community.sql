
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- co_no, co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no,
-- co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname
DROP TABLE IF EXISTS community;
CREATE TABLE IF NOT EXISTS community(
  co_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  co_title VARCHAR(10) NULL,
  co_reg_date TIMESTAMP NOT NULL,  
  co_reply_count INTEGER(10) NULL,
  co_read_count INTEGER(10) NULL,
  co_content VARCHAR(1000) NOT NULL,
  co_file VARCHAR(40) NULL,
  co_parent_no INTEGER(10) NOT NULL,
  co_re_reply INTEGER(10) NOT NULL,
  co_reply_target VARCHAR(20) NULL,
  party_members INTEGER(5) NULL,
  party_mb_ids VARCHAR(300) NULL,
  party_d_day TIMESTAMP NULL,
  party_place VARCHAR(40) NULL,
  c_no INTEGER(10) NOT NULL,
  mb_id VARCHAR(10) NOT NULL,
  mb_nickname VARCHAR(20) NOT NULL,
  
  CONSTRAINT community_category_fk FOREIGN KEY(c_no) REFERENCES category(c_no),
  CONSTRAINT community_member_fk FOREIGN KEY(mb_id) REFERENCES member(mb_id),
  CONSTRAINT community_member_fk2 FOREIGN KEY(mb_nickname) REFERENCES member(mb_nickname)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#######################################################################################################################################################################################################################################co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname

INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId02', 'nickname02');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content03', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId03', 'nickname03');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content04', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId04', 'nickname04');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content05', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId05', 'nickname05');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content06', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId06', 'nickname06');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content07', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId07', 'nickname07');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content08', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId08', 'nickname08');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content09', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId09', 'nickname09');
INSERT INTO community (co_title, co_reg_date, co_reply_count, co_read_count, co_content, co_file, co_parent_no, co_re_reply, co_reply_target, party_members, party_mb_ids, party_d_day, party_place, c_no, mb_id, mb_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'co_content10', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId10', 'nickname10');



COMMIT;

SELECT * FROM community;
