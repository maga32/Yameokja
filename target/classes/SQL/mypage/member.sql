
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;

-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- 아이디, 이름, 사진, 닉네임, 비밀번호, 이메일, 주소, 핸드폰번호, 찜 목록, 
-- 회원 가입일, 회원 탈퇴일, 선호 음식 종류, 회원 등급, 차단한 회원 id 목록
-- member_id, member_name, member_photo, member_nickname, member_password, 
-- member_email, member_address, member_mobile, member_bookmarks, member_join_date,
-- member_del_date, member_favorite_category, member_level, member_block_ids
DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
  member_id VARCHAR(20) PRIMARY KEY,
  member_name VARCHAR(10) NOT NULL,
  member_photo VARCHAR(100) NULL,  
  member_nickname VARCHAR(20) NOT NULL UNIQUE,
  member_password VARCHAR(100) NOT NULL,
  member_email VARCHAR(20) NOT NULL,
  member_address VARCHAR(20) NOT NULL,
  member_mobile VARCHAR(20) NOT NULL,
  member_bookmarks VARCHAR(1000) NULL default '0',
  member_join_date TIMESTAMP NOT NULL,
  member_del_date TIMESTAMP NULL,
  member_favorite_category VARCHAR(40) NULL,
  member_level INTEGER(5) NOT NULL,
  member_block_ids VARCHAR(1000) NULL
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

desc member;

ALTER TABLE member CHANGE member_photo member_photo VARCHAR(100) NULL;
###############################################################################################################################################################################################member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids

INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('hayoung', '정하영', 'hy.png', '하영이', '1234', 'ha016595@naver.com', '서울,관악구', '010-4998-9579', "1,7", '2017-12-01 05:44:32', null, '1,3,12', 1, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('admin', '정하영', null, '관리자_하영', '1234', 'ha016595@naver.com', '서울,관악구', '010-4998-9579', "1,7", '2017-12-01 05:44:32', null, '1,3,12', 10, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('yejin', '박예진', 'yj.png', '예진이', '1234', 'yejin@naver.com', '서울,관악구', '010-3928-1009', "2,3", '2022-10-03 02:14:02', null, '2,5,8', 1, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('seonghwa', '백승화', 'sh.png', '승화', '1234', 'seonghwa@naver.com', '서울,관악구', '010-9192-3321', "5,11", '2021-11-21 23:04:08', null, '5,6,9', 1, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('sangyong', '이상용', 'sy.png', '상용', '1234', 'map@naver.com', '서울,관악구', '010-6721-8011', "9,10", '2021-07-21 18:02:56', null, '7,9,11', 1, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('hyunjae', '백현제', 'hj.png', '현제', '1234', 'hyunjae@naver.com', '서울,관악구', '010-2091-7391', "1,6", '2022-06-13 01:08:32', null, '5,6,10', 1, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('hansol', '이한솔', 'hs.png', '한솔', '1234', 'hansol@naver.com', '서울,관악구', '010-2801-2099', "2,6", '2017-12-01 11:32:16', null, '7,9,11', 1, null);
 INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
 VALUES ('sangyong', '이상용', 'sy.png', '상용', '1234', 'map@naver.com', '서울,관악구', '010-6721-8011', "9,10", '2017-12-01 11:32:16', null, '7,9,11', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId02', 'name02', null, 'nickname02', '1234', 'email02@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId03', 'name03', null, 'nickname03', '1234', 'email03@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId04', 'name04', null, 'nickname04', '1234', 'email04@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId05', 'name05', null, 'nickname05', '1234', 'email05@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId06', 'name06', null, 'nickname06', '1234', 'email06@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId07', 'name07', null, 'nickname07', '1234', 'email07@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId08', 'name08', null, 'nickname08', '1234', 'email08@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId09', 'name09', null, 'nickname09', '1234', 'email09@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId10', 'name10', null, 'nickname10', '1234', 'email10@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId11', 'name11', null, 'nickname11', '1234', 'email11@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId12', 'name12', null, 'nickname12', '1234', 'email12@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId13', 'name13', null, 'nickname13', '1234', 'email13@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId14', 'name14', null, 'nickname14', '1234', 'email14@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId15', 'name15', null, 'nickname15', '1234', 'email15@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId16', 'name16', null, 'nickname16', '1234', 'email16@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId17', 'name17', null, 'nickname17', '1234', 'email17@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId18', 'name18', null, 'nickname18', '1234', 'email18@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId19', 'name19', null, 'nickname19', '1234', 'email19@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids) VALUES ('memberId20', 'name20', null, 'nickname20', '1234', 'email20@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);

COMMIT;


SELECT * FROM member;
