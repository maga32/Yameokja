
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- community_no, community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no,
-- community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname
DROP TABLE IF EXISTS community;
CREATE TABLE IF NOT EXISTS community(
  community_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  community_title VARCHAR(10) NULL,
  community_reg_date TIMESTAMP NOT NULL,  
  community_reply_count INTEGER(10) NULL,
  community_read_count INTEGER(10) NULL,
  community_content VARCHAR(1000) NOT NULL,
  community_file VARCHAR(40) NULL,
  community_parent_no INTEGER(10) NOT NULL,
  community_re_reply INTEGER(10) NOT NULL,
  community_reply_target VARCHAR(20) NULL,
  party_members INTEGER(5) NULL,
  party_member_ids VARCHAR(300) NULL,
  party_d_day TIMESTAMP NULL,
  party_place VARCHAR(40) NULL,
  category_no INTEGER(10) NOT NULL,
  member_id VARCHAR(10) NOT NULL,
  member_nickname VARCHAR(20) NOT NULL,
  
  CONSTRAINT community_category_fk FOREIGN KEY(category_no) REFERENCES category(category_no),
  CONSTRAINT community_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT community_member_fk2 FOREIGN KEY(member_nickname) REFERENCES member(member_nickname)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#######################################################################################################################################################################################################################################community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname

INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId02', 'nickname02');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content03', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId03', 'nickname03');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content04', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId04', 'nickname04');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content05', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId05', 'nickname05');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content06', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId06', 'nickname06');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content07', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId07', 'nickname07');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content08', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId08', 'nickname08');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content09', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId09', 'nickname09');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES (NULL, '2017-12-01 05:44:32', NULL, NULL, 'community_content10', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId10', 'nickname10');



COMMIT;

SELECT * FROM community;

INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ('제목 자리', '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '1', 'memberId01', 'nickname01');
