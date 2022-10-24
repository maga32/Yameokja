
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

ALTER table store CHANGE store_bookmarks store_bookmarks INTEGER(20) NOT NULL default '0';
ALTER TABLE store CHANGE community_file community_file VARCHAR(1000) NULL;

desc store;
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

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('조방낙지 범일직영점', "051-637-1001", '129.061905', '35.1388113', 'jobangMain.png', 'jobangMenu.png', '부산,동구', '11:00 ~ 23:00', null, NULL, 'memberId01', '1');
## 부산 동구 조방로 21
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('동래정', "0507-1382-3652", '129.082259', '35.1841698', 'dongraeMain.png', 'dongraeMenu.png', '부산,연제구', '11:00 ~ 21:00', "매주 월요일", "주차공간 있음", 'memberId02', '1');
## 부산 연제구 월드컵대로111번길 4

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('부뚜막', "0507-1342-3692", '126.927494', '37.4846880', 'buddumakMain.png', 'buddumakMenu.png', '서울,관악구', '16:00 ~ 24:00', null, null, 'memberId03', '9');
## 서울 관악구 남부순환로 1597-15

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('대원갈비', "0507-1354-3532", '126.928940', '37.4860494', 'daewonMain.png', 'daewonMenu.png', '서울,관악구', '00:00 ~ 24:00', null, null, 'memberId04', '9');
## 서울 관악구 신림로67길 5 금호빌딩

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('신풍루 곱창구이', "02-877-6681", '126.937680', '37.4857661', 'sinMain.png', 'sinMenu.png', '서울,관악구', '14:30 ~ 23:30', null, null, 'memberId05', '9');
## 서울 관악구 은천로2길 18 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('온돌 서울대입구점', "02-873-8712", '126.956951', '37.4786660', 'onMain.png', 'onMenu.png', '서울,관악구', '11:30 ~ 22:30', null, null, 'memberId06', '9');
## 서울 관악구 봉천로 534

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('정숙성', "0507-1370-6668", '126.953785', '37.4792865', 'jungMain.png', 'jungMenu.png', '서울,관악구', '14:00 ~ 22:00', null, null, 'memberId07', '9');
## 서울 관악구 남부순환로226길 31 1층 정숙성

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('십원집', "02-873-0057", '126.956182', '37.4794496', 'tenwonMain.png', 'tenwonMenu.png', '서울,관악구', '12:00 ~ 01:00', null, null, 'memberId08', '9');
## 서울 관악구 봉천로 521

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('뱃살도둑 관악본점', "0507-1380-1148", '126.952539', '37.4826557', 'theifMain.png', 'theifMenu.png', '서울,관악구', '10:30 ~ 22:30', "월요일", null, 'memberId09', '10');
## 서울 관악구 봉천로 469-17 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('Poke all day 서울대입구점', "0507-1323-3465", '126.953017', '37.4782230', 'pokeMain.png', 'pokeMenu.png', '서울,관악구', '11:00 ~ 20:30', null, null, 'memberId10', '10');
## 서울 관악구 관악로12길 11 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('스윗밸런스 샤로수점', "0507-1413-3225", '126.957856', '37.4779726', 'sweetMain.png', 'sweetMenu.png', '서울,관악구', '10:10 ~ 20:30', null, null, 'memberId01', '10');
## 서울 관악구 관악로14길 99 1층 스윗밸런스

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('샐러디 서울대입구점', "02-877-0780", '126.951988', '37.4788713', 'salMain.png', 'salMenu.png', '서울,관악구', '08:00 ~ 20:30', null, null, 'memberId02', '10');
## 서울 관악구 쑥고개로 139

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('샐러데이즈 신대방역점', "02-867-6523", '126.917361', '37.4869968', 'daysMain.png', 'daysMenu.png', '서울,관악구', '10:00 ~ 22:00', "매달 2,4번째 월요일", null, 'memberId03', '10');
## 서울 관악구 관천로19길 84 지하1층, 101호

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('그린픽', "02-514-5180", '126.962627', '37.4776949', 'greenMain.png', 'greenMenu.png', '서울,관악구', '08:00 ~ 23:00', null, null, 'memberId04', '10');
## 서울 관악구 남부순환로 1919 . 1층(봉천동)

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('9ounce Burger 낙성대점', "02-878-9020", '126.958343', '37.4771889', 'nineMain.png', 'nineMenu.png', '서울,관악구', '11:30 ~ 22:00', null, null, 'memberId05', '11');
## 서울 관악구 관악로12길 108 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('더멜팅팟', "02-877-1083", '126.958207', '37.4776484', 'meltingMain.png', 'meltingMenu.png', '서울,관악구', '11:30 ~ 22:00', null, null, 'memberId06', '11');
## 서울 관악구 관악로14길 106 1층 (102호)

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('알렉스플레이스', "02-872-4930", '126.947873', '37.4788605', 'alexMain.png', 'alexMenu.png', '서울,관악구', '11:00 ~ 20:30', null, null, 'memberId07', '11');
## 서울 관악구 쑥고개로 100

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('베스트 버거 하우스', "02-888-2850", '126.937920', '37.4694581', 'bestMain.png', 'bestMenu.png', '서울,관악구', '15:00 ~ 03:00', null, null, 'memberId08', '11');
## 서울 관악구 대학길 31

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('버거랩', "0507-1372-1225", '126.938021', '37.4712331', 'wrapMain.png', 'wrapMenu.png', '서울,관악구', '11:50 ~ 19:50', "매주 월요일", null, 'memberId09', '11');
## 서울 관악구 신림로12길 5

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('시티버거 신림점', "0507-1428-2110", '126.927414', '37.4857421', 'cityMain.png', 'cityMenu.png', '서울,관악구', '10:00 ~ 01:00', null, null, 'memberId10', '11');
## 서울 관악구 신림동5길 34 101호

SELECT * FROM store order by store_no DESC;

DELETE from store WHERE store_no > 11;

COMMIT;
SELECT * FROM store;
SELECT * FROM post;
SELECT * FROM member;


