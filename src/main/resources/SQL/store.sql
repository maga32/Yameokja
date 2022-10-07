
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, 
-- store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no
DROP TABLE IF EXISTS store;
CREATE TABLE IF NOT EXISTS store(
  store_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  store_name VARCHAR(40) NOT NULL,
  store_phone VARCHAR(20) NULL,  
  store_latitude VARCHAR(20) NOT NULL,
  store_longitude VARCHAR(20) NOT NULL,
  store_read_count INTEGER(10) NULL,
  store_file_main VARCHAR(100) NOT NULL,
  store_file_menu VARCHAR(100) NOT NULL,
  store_address VARCHAR(20) NOT NULL,
  store_review_count INTEGER(10) NULL,
  store_star INTEGER(10) NULL,
  store_bookmarks INTEGER(20) NOT NULL,
  store_time VARCHAR(40) NULL,
  store_day_off VARCHAR(100) NULL,
  store_parking VARCHAR(100) NULL,
  
  member_id VARCHAR(20) NOT NULL,
  category_no INTEGER(10) NOT NULL,
  CONSTRAINT store_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT store_category_fk FOREIGN KEY(category_no) REFERENCES category(category_no)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#######################################################################################################################################################################################################################store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name01', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId01', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name02', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId02', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name03', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId03', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name04', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId04', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name05', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId05', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name06', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId06', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name07', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId07', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name08', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId08', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name09', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId09', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('store_name10', NULL, 'store_latitude', 'store_longitude', NULL, 'store_file_main', 'store_file_menu', 'store_address', NULL, NULL, '10', NULL, NULL, NULL, 'memberId10', '1');



COMMIT;
SELECT * FROM store;
SELECT * FROM post;
SELECT * FROM member;


