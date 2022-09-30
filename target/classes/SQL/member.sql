
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- mb_id, mb_name, mb_photo, mb_nickname, mb_password, 
-- mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date,
-- mb_del_date, mb_favorite_category, mb_level, mb_block_ids
DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
  mb_id VARCHAR(20) PRIMARY KEY,
  mb_name VARCHAR(10) NOT NULL,
  mb_photo VARCHAR(100) NULL,  
  mb_nickname VARCHAR(20) NOT NULL unique KEY,
  mb_password VARCHAR(20) NOT NULL,
  mb_email VARCHAR(20) NOT NULL,
  mb_address VARCHAR(20) NOT NULL,
  mb_mobile VARCHAR(20) NOT NULL,
  mb_bookmarks VARCHAR(1000) NULL,
  mb_join_date TIMESTAMP NOT NULL,
  mb_del_date TIMESTAMP NULL,
  mb_favorite_category VARCHAR(40) NULL,
  mb_level INTEGER(5) NOT NULL,
  mb_block_ids VARCHAR(1000) NULL
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
###############################################################################################################################################################################################mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids

INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId01', 'name01', null, 'nickname01', '1234', 'email01@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId02', 'name02', null, 'nickname02', '1234', 'email02@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId03', 'name03', null, 'nickname03', '1234', 'email03@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId04', 'name04', null, 'nickname04', '1234', 'email04@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId05', 'name05', null, 'nickname05', '1234', 'email05@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId06', 'name06', null, 'nickname06', '1234', 'email06@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId07', 'name07', null, 'nickname07', '1234', 'email07@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId08', 'name08', null, 'nickname08', '1234', 'email08@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId09', 'name09', null, 'nickname09', '1234', 'email09@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId10', 'name10', null, 'nickname10', '1234', 'email10@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId11', 'name11', null, 'nickname11', '1234', 'email11@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId12', 'name12', null, 'nickname12', '1234', 'email12@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId13', 'name13', null, 'nickname13', '1234', 'email13@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId14', 'name14', null, 'nickname14', '1234', 'email14@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId15', 'name15', null, 'nickname15', '1234', 'email15@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId16', 'name16', null, 'nickname16', '1234', 'email16@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId17', 'name17', null, 'nickname17', '1234', 'email17@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId18', 'name18', null, 'nickname18', '1234', 'email18@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId19', 'name19', null, 'nickname19', '1234', 'email19@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);
INSERT INTO member (mb_id, mb_name, mb_photo, mb_nickname, mb_password, mb_email, mb_address, mb_mobile, mb_bookmarks, mb_join_date, mb_del_date, mb_favorite_category, mb_level, mb_block_ids) VALUES ('memberId20', 'name20', null, 'nickname20', '1234', 'email20@yameokja.com', '관악구', '01099999999', null, '2017-12-01 05:44:32', null, null, 1, null);

COMMIT;

SELECT * FROM member;
