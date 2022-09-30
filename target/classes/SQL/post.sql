
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- p_no, p_content, p_file1, p_file2, p_file3, p_file4, p_file5, 
-- p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname
DROP TABLE IF EXISTS post;
CREATE TABLE IF NOT EXISTS post(
  p_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  p_content VARCHAR(2000) NOT NULL,
  p_file1 VARCHAR(100) NOT NULL,  
  p_file2 VARCHAR(100) NULL,
  p_file3 VARCHAR(100) NULL,
  p_file4 VARCHAR(100) NULL,
  p_file5 VARCHAR(100) NULL,
  p_reg_date TIMESTAMP NOT NULL,
  p_is_post VARCHAR(10) NOT NULL,
  p_star INTEGER(10) NULL,
  p_up_count INTEGER(10) NULL,
  p_up_list VARCHAR(2000) NULL,
  st_no INTEGER(50) NOT NULL,
  mb_id VARCHAR(20) NOT NULL,
  mb_nickname VARCHAR(20) NOT NULL,
  CONSTRAINT post_store_fk FOREIGN KEY(st_no) REFERENCES store(st_no),
  CONSTRAINT post_member_fk FOREIGN KEY(mb_id) REFERENCES member(mb_id),
  CONSTRAINT post_member_fk2 FOREIGN KEY(mb_nickname) REFERENCES member(mb_nickname)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM post;
SELECT * FROM member;
####################################################################################################################################################################p_no, p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content01', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list01', '1', 'memberId01', 'nickname01');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content02', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list02', '1', 'memberId02', 'nickname02');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content03', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list03', '1', 'memberId03', 'nickname03');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content04', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list04', '1', 'memberId04', 'nickname04');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content05', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list05', '1', 'memberId05', 'nickname05');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content06', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list06', '1', 'memberId06', 'nickname06');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content07', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list07', '1', 'memberId07', 'nickname07');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content08', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list08', '1', 'memberId08', 'nickname08');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content09', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list09', '1', 'memberId09', 'nickname09');
INSERT INTO post (p_content, p_file1, p_file2, p_file3, p_file4, p_file5, p_reg_date, p_is_post, p_star, p_up_count, p_up_list, st_no, mb_id, mb_nickname) VALUES ('p_content10', 'p_file1', null, null, null, null, '2017-12-01 05:44:32', 'p_is_post', '1', '1', 'p_up_list10', '1', 'memberId10', 'nickname10');



COMMIT;

SELECT * FROM post;
