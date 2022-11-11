
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
  member_photo VARCHAR(100) NULL default 'img01.png',  
  member_nickname VARCHAR(20) NOT NULL UNIQUE,
  member_password VARCHAR(100) NOT NULL,
  member_email VARCHAR(20) NOT NULL,
  member_address VARCHAR(20) NOT NULL,
  member_mobile VARCHAR(20) NOT NULL,
  member_bookmarks VARCHAR(1000) NULL default '9999.',
  member_join_date TIMESTAMP NOT NULL,
  member_del_date TIMESTAMP NULL,
  member_favorite_category VARCHAR(40) NULL,
  member_level INTEGER(5) NOT NULL,
  member_block_ids VARCHAR(1000) NULL
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

desc member;

TRUNCATE member;
###############################################################################################################################################################################################member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids

INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('hayoung', '정하영', 'hy.png', '하영이', '1234', 'ha016595@naver.com', '서울,관악구', '010-4998-9579', "9999.,2.,7.", '2017-12-01 05:44:32', null, '1,3,12', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('admin', '정하영', 'img01.png' , '관리자_하영', '1234', 'ha016595@naver.com', '서울,관악구', '010-4998-9579', "9999.,2.,7.", '2017-12-01 05:44:32', null, '1,3,12', 10, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('yejin', '박예진', 'yj.png', '예진이', '1234', 'yejin@naver.com', '서울,관악구', '010-3928-1009', "9999.,5.,11.", '2022-10-03 02:14:02', null, '2,5,8', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('seonghwa', '백승화', 'sh.png', '승화', '1234', 'seonghwa@naver.com', '서울,관악구', '010-9192-3321', "9999.,3.,6.", '2021-11-21 23:04:08', null, '5,6,9', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('sangyong', '이상용', 'sy.png', '상용', '1234', 'sangyong@naver.com', '서울,관악구', '010-6721-8011', "9999.", '2021-07-21 18:02:56', null, '7,9,11', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('hyunjae', '백현제', 'hj.png', '현제', '1234', 'hyunjae@naver.com', '서울,관악구', '010-2091-7391', "9999.", '2022-06-13 01:08:32', null, '5,6,10', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('hansol', '이한솔', 'hs.png', '한솔', '1234', 'hansol@naver.com', '서울,관악구', '010-2801-2099', "9999.", '2017-12-01 11:32:16', null, '7,9,11', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('bongjun', '최봉준', 'bongjun.png', '봉준', '1234', 'bongjunho@naver.com', '서울,관악구', '010-8102-5439', "9999.3", '2022-07-02 21:12:56', null, '3,9,10', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('hyojung', '이효중', 'hyojung.png', '효중', '1234', 'hyojung@naver.com', '서울,관악구', '010-1159-7102', "9999.7", '2022-03-11 07:56:12', null, '7,9,11', 1, null);
INSERT INTO member (member_id, member_name, member_photo, member_nickname, member_password, member_email, member_address, member_mobile, member_bookmarks, member_join_date, member_del_date, member_favorite_category, member_level, member_block_ids)
VALUES ('jinsu', '박진수', 'jinsu.png', '진수대장', '1234', 'jinsu@naver.com', '서울,관악구', '010-7701-3162', "9999.", '2022-11-09 12:11:09', null, '7,9,11', 1, null);

COMMIT;
