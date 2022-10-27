
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;

-- 아이디, 이름, 사진, 닉네임, 비밀번호, 이메일, 주소, 핸드폰번호, 찜 목록, 
-- 회원 가입일, 회원 탈퇴일, 선호 음식 종류, 회원 등급, 차단한 회원 id 목록
-- post_no, post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, 
-- post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname
DROP TABLE IF EXISTS post;
CREATE TABLE IF NOT EXISTS post(
  post_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  post_title VARCHAR(40) NULL,
  post_content VARCHAR(2000) NOT NULL,
  post_read_count INTEGER(10) NULL,
  post_file1 VARCHAR(100) NOT NULL,  
  post_file2 VARCHAR(100) NULL,
  post_file3 VARCHAR(100) NULL,
  post_file4 VARCHAR(100) NULL,
  post_file5 VARCHAR(100) NULL,
  post_reg_date TIMESTAMP NOT NULL,
  post_is_post VARCHAR(5) NOT NULL,
  post_star INTEGER(10) NULL,
  post_up_count INTEGER(10) NULL,
  post_up_list VARCHAR(2000) NULL,
  store_no INTEGER(50) NOT NULL,
  member_id VARCHAR(20) NOT NULL,
  member_nickname VARCHAR(20) NOT NULL,
  CONSTRAINT post_store_fk FOREIGN KEY(store_no) REFERENCES store(store_no),
  CONSTRAINT post_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT post_member_fk2 FOREIGN KEY(member_nickname) REFERENCES member(member_nickname)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

##########################################################################################################################################################################################################################################post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title01', 'post_content01', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '1', 'memberId01', 'nickname01');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title02', 'post_content02', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '2', 'memberId02', 'nickname02');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title03', 'post_content03', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '3', 'memberId03', 'nickname03');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title04', 'post_content04', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '4', 'memberId04', 'nickname04');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title05', 'post_content05', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '5', 'memberId05', 'nickname05');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title06', 'post_content06', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '6', 'memberId06', 'nickname06');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title07', 'post_content07', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '7', 'memberId07', 'nickname07');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title08', 'post_content08', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '8', 'memberId08', 'nickname08');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title09', 'post_content09', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '9', 'memberId09', 'nickname09');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title10', 'post_content10', null, 'mainImg', null, null, null, null, sysdate(), '1', '1', '1', 'post_upost_list', '10', 'memberId10', 'nickname10');


COMMIT;

SELECT * FROM post order by post_no DESC;
SELECT count(post_no) FROM post;

INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title11', 'post_content01', null, 'mainImg', null, null, null, null, sysdate(), '1231', '1', '1', 'post_upost_list', '1', 'memberId01', 'nickname01');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_titl112', 'post_content01', null, 'mainImg', null, null, null, null, sysdate(), '1234', '1', '1', 'post_upost_list', '1', 'memberId01', 'nickname01');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title13', 'post_content01', null, 'mainImg', null, null, null, null, sysdate(), '45616', '1', '1', 'post_upost_list', '1', 'memberId01', 'nickname01');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title14', 'post_content01', null, 'mainImg', null, null, null, null, sysdate(), '6124', '1', '1', 'post_upost_list', '1', 'memberId01', 'nickname01');
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('post_title15', 'post_content01', null, 'mainImg', null, null, null, null, sysdate(), '4163', '1', '1', 'post_upost_list', '1', 'memberId01', 'nickname01');

SELECT
					post_no as postNo,
					post_title as postTitle,
					post_content as postContent,
					post_read_count as postReadCount,
					post_file1 as postFile1,
					post_file2 as postFile2,
					post_file3 as postFile3,
					post_file4 as postFile4,
					post_file5 as postFile5,
					post_reg_date as postRegDate,
					post_is_post as postIsPost,
					post_star as postStar,
					post_up_count as postUpCount,
					post_up_list as postUpList,
					member_id as memberId
		FROM post
		WHERE member_id = "memberId01"
		ORDER BY post_no DESC
		LIMIT 0, 10;
        
        SELECT count(post_no) FROM post WHERE member_id = "memberId01";
        
INSERT INTO post (post_title, post_content, post_read_count, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES 
	('post_title10', 'post_content10', null, 'mainImg', null, null, null, null, sysdate(), '0', '1', '0', 'post_up_list', '10', 'memberId10', 'nickname10');