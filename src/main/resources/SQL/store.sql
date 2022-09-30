
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, 
-- st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no
DROP TABLE IF EXISTS store;
CREATE TABLE IF NOT EXISTS store(
  st_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  st_name VARCHAR(40) NOT NULL,
  st_phone VARCHAR(20) NULL,  
  st_latitude VARCHAR(20) NOT NULL,
  st_longitude VARCHAR(20) NOT NULL,
  st_read_count INTEGER(10) NULL,
  st_file_main VARCHAR(100) NOT NULL,
  st_file_menu VARCHAR(100) NOT NULL,
  st_address VARCHAR(20) NOT NULL,
  st_review_count INTEGER(10) NULL,
  st_star INTEGER(10) NULL,
  st_bookmarks INTEGER(20) NOT NULL,
  st_time VARCHAR(40) NULL,
  st_day_off VARCHAR(100) NULL,
  st_parking VARCHAR(100) NULL,
  
  mb_id VARCHAR(20) NOT NULL,
  c_no INTEGER(10) NOT NULL,
  CONSTRAINT store_member_fk FOREIGN KEY(mb_id) REFERENCES member(mb_id),
  CONSTRAINT store_category_fk FOREIGN KEY(c_no) REFERENCES category(c_no)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#######################################################################################################################################################################################################################st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name01', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId01', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name02', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId02', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name03', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId03', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name04', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId04', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name05', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId05', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name06', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId06', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name07', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId07', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name08', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId08', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name09', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId09', '1');
INSERT INTO store (st_name, st_phone, st_latitude, st_longitude, st_read_count, st_file_main, st_file_menu, st_address, st_review_count, st_star, st_bookmarks, st_time, st_day_off, st_parking, mb_id, c_no) VALUES ('st_name10', NULL, 'st_latitude', 'st_longitude', NULL, 'st_file_main', 'st_file_menu', 'st_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId10', '1');



COMMIT;

SELECT * FROM post;
SELECT * FROM member;
SELECT * FROM store;

