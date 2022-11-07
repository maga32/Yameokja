
## DATABASE 생성 및 선택
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
  community_reply_count INTEGER(10) NULL default '0',
  community_read_count integer(10) default '0',
  community_content VARCHAR(1000) NOT NULL,
  community_file VARCHAR(1000) NULL,
  community_parent_no INTEGER(10) NOT NULL default '0',
  community_re_reply INTEGER(10) NOT NULL default '0',
  community_reply_target VARCHAR(20) NULL,
  party_members INTEGER(5) NULL,
  party_member_ids VARCHAR(300) NULL,
  party_d_day TIMESTAMP NULL,
  party_place VARCHAR(40) NULL,
  category_no INTEGER(10) NOT NULL default '0',
  member_id VARCHAR(10) NOT NULL,
  member_nickname VARCHAR(20) NOT NULL,
  member_photo VARCHAR(1000) null,
  
  CONSTRAINT community_category_fk FOREIGN KEY(category_no) REFERENCES category(category_no),
  CONSTRAINT community_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT community_member_fk2 FOREIGN KEY(member_nickname) REFERENCES member(member_nickname)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE community CHANGE community_parent_no community_parent_no integer(10) NOT NULL default '0';
ALTER TABLE community CHANGE community_re_reply community_re_reply integer(10) NOT NULL default '0';
ALTER TABLE community CHANGE community_read_count community_read_count integer(10) default '0';
ALTER TABLE community CHANGE community_file community_file VARCHAR(1000) NULL;
ALTER TABLE community CHANGE member_photo member_photo varchar(100) NULL ;
ALTER TABLE community CHANGE community_reply_count community_reply_count INTEGER(10) NULL default '0' ;

ALTER TABLE community ADD member_photo VARCHAR(1000) null;
ALTER TABLE community ADD CONSTRAINT community_member_fk3 FOREIGN KEY(member_photo) REFERENCES member(member_photo)  ON UPDATE CASCADE;

desc community;



#######################################################################################################################################################################################################################################community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname

INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) 
	VALUES ("관악구 맛집 추천해주세요!!", '2022-11-03 013:42:32', 0, 10, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '101', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하2", '2017-12-01 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '102', 'memberId02', 'nickname02');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하1", '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '101', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하2", '2017-12-01 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '102', 'memberId02', 'nickname02');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하1", '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '101', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하2", '2017-12-01 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '102', 'memberId02', 'nickname02');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하1", '2017-12-01 05:44:32', NULL, NULL, 'community_content01', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '101', 'memberId01', 'nickname01');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하2", '2017-12-01 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '102', 'memberId02', 'nickname02');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하날짜확인", '2007-1-21 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '102', 'memberId02', 'nickname02');
INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname) VALUES ("하하날짜확인", '2007-1-21 05:44:32', NULL, NULL, 'community_content02', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, '102', 'memberId02', 'nickname02');

INSERT INTO community (community_title, community_reg_date, community_content, community_file, category_no, member_id, member_nickname, community_reply_count) VALUES ("dd", sysdate(), "222", null, '101', "memberId01", "nickname01", (SELECT * FROM community WHERE category_no = '0' AND community_parent_no = '287'));

INSERT INTO community
			(community_reg_date, community_content, community_parent_no, community_re_reply,
			 community_reply_target, category_no, member_id, member_nickname)
			 VALUES (SYSDATE(), "22", '23', '0',
				  "MEM", "101", 'memberId02', 'nickname02');
COMMIT;

SELECT * FROM community order by community_no DESC;
SELECT * FROM community where community_no = 1 AND category_no > '100' order by community_no DESC;
UPDATE community
			SET community_read_count = IF (community_read_count = "0", '1', community_read_count + '1')
		WHERE community_no = 278;      
select community_read_count FROM community where community_no = 278;
select * from community order by community_no DESC;


SELECT * FROM community
WHERE community_parent_no = 287 AND category_no = '0';

DELETE FRom community WHERE community_no = 291;

SELECT * FROM community WHERE community_no = 287;
SELECT * FROM community WHERE category_no = 0 AND community_parent_no = 287;

UPDATE community
			SET community_reply_count = community_reply_count + 1
			WHERE community_no = 287;
