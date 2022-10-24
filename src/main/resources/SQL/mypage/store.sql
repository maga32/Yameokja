
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
delete from store;

desc store;


#############하영############
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('조방낙지 범일직영점', "051-637-1001", '129.061905', '35.1388113', 'jobangMain.png', 'jobangMenu.png', '부산,동구', '11:00 ~ 23:00', null, NULL, 'memberId01', '1');
## 부산 동구 조방로 21
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('동래정', "0507-1382-3652", '129.082259', '35.1841698', 'dongraeMain.png', 'dongraeMenu.png', '부산,연제구', '11:00 ~ 21:00', "매주 월요일", "주차공간 있음", 'memberId02', '1');
## 부산 연제구 월드컵대로111번길 4

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('부뚜막', "0507-1342-3692", '126.927494', '37.4846880', 'buddumakMain.png', 'buddumakMenu.png', '서울시,관악구', '16:00 ~ 24:00', null, null, 'memberId03', '9');
## 서울시,관악구 남부순환로 1597-15

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('대원갈비', "0507-1354-3532", '126.928940', '37.4860494', 'daewonMain.png', 'daewonMenu.png', '서울시,관악구', '00:00 ~ 24:00', null, null, 'memberId04', '9');
## 서울시,관악구 신림로67길 5 금호빌딩

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('신풍루 곱창구이', "02-877-6681", '126.937680', '37.4857661', 'sinMain.png', 'sinMenu.png', '서울시,관악구', '14:30 ~ 23:30', null, null, 'memberId05', '9');
## 서울시,관악구 은천로2길 18 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('온돌 서울대입구점', "02-873-8712", '126.956951', '37.4786660', 'onMain.png', 'onMenu.png', '서울시,관악구', '11:30 ~ 22:30', null, null, 'memberId06', '9');
## 서울시,관악구 봉천로 534

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('정숙성', "0507-1370-6668", '126.953785', '37.4792865', 'jungMain.png', 'jungMenu.png', '서울시,관악구', '14:00 ~ 22:00', null, null, 'memberId07', '9');
## 서울시,관악구 남부순환로226길 31 1층 정숙성

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('십원집', "02-873-0057", '126.956182', '37.4794496', 'tenwonMain.png', 'tenwonMenu.png', '서울시,관악구', '12:00 ~ 01:00', null, null, 'memberId08', '9');
## 서울시,관악구 봉천로 521

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('뱃살도둑 관악본점', "0507-1380-1148", '126.952539', '37.4826557', 'theifMain.png', 'theifMenu.png', '서울시,관악구', '10:30 ~ 22:30', "월요일", null, 'memberId09', '10');
## 서울시,관악구 봉천로 469-17 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('Poke all day 서울대입구점', "0507-1323-3465", '126.953017', '37.4782230', 'pokeMain.png', 'pokeMenu.png', '서울시,관악구', '11:00 ~ 20:30', null, null, 'memberId10', '10');
## 서울시,관악구 관악로12길 11 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('스윗밸런스 샤로수점', "0507-1413-3225", '126.957856', '37.4779726', 'sweetMain.png', 'sweetMenu.png', '서울시,관악구', '10:10 ~ 20:30', null, null, 'memberId01', '10');
## 서울시,관악구 관악로14길 99 1층 스윗밸런스

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('샐러디 서울대입구점', "02-877-0780", '126.951988', '37.4788713', 'salMain.png', 'salMenu.png', '서울시,관악구', '08:00 ~ 20:30', null, null, 'memberId02', '10');
## 서울시,관악구 쑥고개로 139

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('샐러데이즈 신대방역점', "02-867-6523", '126.917361', '37.4869968', 'daysMain.png', 'daysMenu.png', '서울시,관악구', '10:00 ~ 22:00', "매달 2,4번째 월요일", null, 'memberId03', '10');
## 서울시,관악구 관천로19길 84 지하1층, 101호

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('그린픽', "02-514-5180", '126.962627', '37.4776949', 'greenMain.png', 'greenMenu.png', '서울시,관악구', '08:00 ~ 23:00', null, null, 'memberId04', '10');
## 서울시,관악구 남부순환로 1919 . 1층(봉천동)

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('9ounce Burger 낙성대점', "02-878-9020", '126.958343', '37.4771889', 'nineMain.png', 'nineMenu.png', '서울시,관악구', '11:30 ~ 22:00', null, null, 'memberId05', '11');
## 서울시,관악구 관악로12길 108 1층

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('더멜팅팟', "02-877-1083", '126.958207', '37.4776484', 'meltingMain.png', 'meltingMenu.png', '서울시,관악구', '11:30 ~ 22:00', null, null, 'memberId06', '11');
## 서울시,관악구 관악로14길 106 1층 (102호)

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('알렉스플레이스', "02-872-4930", '126.947873', '37.4788605', 'alexMain.png', 'alexMenu.png', '서울시,관악구', '11:00 ~ 20:30', null, null, 'memberId07', '11');
## 서울시,관악구 쑥고개로 100

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('베스트 버거 하우스', "02-888-2850", '126.937920', '37.4694581', 'bestMain.png', 'bestMenu.png', '서울시,관악구', '15:00 ~ 03:00', null, null, 'memberId08', '11');
## 서울시,관악구 대학길 31

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('버거랩', "0507-1372-1225", '126.938021', '37.4712331', 'wrapMain.png', 'wrapMenu.png', '서울시,관악구', '11:50 ~ 19:50', "매주 월요일", null, 'memberId09', '11');
## 서울시,관악구 신림로12길 5

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_file_main, store_file_menu, store_address, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('시티버거 신림점', "0507-1428-2110", '126.927414', '37.4857421', 'cityMain.png', 'cityMenu.png', '서울시,관악구', '10:00 ~ 01:00', null, null, 'memberId10', '11');
## 서울시,관악구 신림동5길 34 101호

############################# 예진 ###################

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('그란데', "0507-1328-7692", '127.124632', '37.3237346', '0', '그란데메인.png', '그란데메뉴.png', '수지구', '0', '0', '0', '11:00 ~ 22:00', '없음', '주차가능', 'memberId01', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('쏘렐라 1호점', "031-782-5882", '127.105375', '37.3661372', '0', '쏘렐라_1호점메인.png', '쏘렐라_1호점메뉴.png', '분당구', '0', '0', '0', '11:30 ~ 22:00', '일요일, 월요일', '주차가능', 'memberId02', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('지오쿠치나', "031-711-9488", '127.113835', '37.3771309', '0', '지오쿠치나메인.png', '지오쿠치나메뉴.png', '분당구', '0', '0', '0', '11:30 ~ 21:50', '없음', '주차가능', 'memberId03', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('올라 백운호수점', "0507-1435-1055", '127.006102', '37.3742830', '0', '올라_백운호수점메인.png', '올라_백운호수점메뉴.png', '의왕시', '0', '0', '10', '11:30 ~ 22:00', '없음', '주차가능', 'memberId04', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('스테이크나인', "0507-1358-9010", '127.118526', '37.6697521', '0', '스테이크나인메인.png', '스테이크나인메뉴.png', '남양주시', '0', '0', '10', '11:00 ~ 22:00', '없음', '주차불가능', 'memberId05', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('식물감각', "031-957-3123", '126.698770', '37.7873581', '0', '식물감각메인.png', '식물감각메뉴.png', '파주시', '0', '0', '0', '11:00 ~ 21:00', '없음', '주차가능', 'memberId06', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('올리코', "031-913-1324", '126.747289', '37.6713836', '0', '올리코메인.png', '올리코메뉴.png', '파주시', '0', '0', '0', '11:30 ~ 20:00', '월요일, 화요일', '주차불가능', 'memberId07', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('굿갓레스토랑', "0507-1408-7759", '127.048612', '37.7377609', '0', '굿갓레스토랑메인.png', '굿갓레스토랑메뉴.png', '의정부시', '0', '0', '10', '11:30 ~ 21:30', '없음', '주차불가능', 'memberId08', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('오말리', "031-901-1233", '126.773730', '37.6577428', '0', '오말리메인.png', '오말리메뉴.png', '고양시', '0', '0', '0', '11:30 ~ 22:00', '없음', '주차가능', 'memberId09', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('까사', "031-476-3053", '126.953976', '37.3914831', '0', '까사메인.png', '까사메뉴.png', '안양시', '0', '0', '0', '11:30 ~ 22:00', '없음', '주차불가능', 'memberId10', '2');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('동동국수집', "031-576-1588", '127.236561', '37.5571153', '0', '동동국수집메인.png', '동동국수집메뉴.png', '남양주시', '0', '0', '0', '9:00 ~ 21:00', '없음', '주차가능', 'memberId01', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('마방집', "031-791-0011", '127.217136', '37.5321679', '0', '마방집메인.png', '마방집메뉴.png', '하남시', '0', '0', '0', '11:00 ~ 21:30', '토요일, 일요일', '주차불가능', 'memberId02', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('거궁 이천점', "031-637-4007", '127.405808', '37.2999783', '0', '거궁_이천점메인.png', '거궁_이천점메뉴.png', '이천시', '0', '0', '0', '10:30 ~ 21:30', '없음', '주차가능', 'memberId03', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('초대한정식', "031-557-7318", '127.171527', '37.5855810', '0', '초대한정식메인.png', '초대한정식메뉴.png', '남양주시', '0', '0', '0', '11:30 ~ 21:30', '없음', '주차가능', 'memberId04', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('목향원', "031-527-2255", '127.101474', '37.6834356', '0', '목향원메인.png', '목향원메뉴.png', '남양주시', '0', '0', '0', '10:30 ~ 22:00', '없음', '주차가능', 'memberId05', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('김삿갓밥집', "031-559-9188", '127.361444', '37.6642422', '0', '김삿갓밥집메인.png', '김삿갓밥집메뉴.png', '남양주시', '0', '0', '0', '11:00 ~ 17:00', '월요일, 화요일', '주차가능', 'memberId06', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('청목', "031-634-5414", '127.408604', '37.2995993', '0', '청목메인.png', '청목메뉴.png', '이천시', '0', '0', '0', '9:50 ~ 21:30', '없음', '주차가능', 'memberId07', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('달보드레', "0507-1421-7900", '127.039398', '37.2896076', '0', '달보드레메인.png', '달보드레메뉴.png', '수원시', '0', '0', '0', '10:00 ~ 22:00', '월요일', '주차가능', 'memberId08', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('고미꽃시래', "0507-1436-6969", '127.140367', '37.3766432', '0', '고미꽃시래메인.png', '고미꽃시래메뉴.png', '성남구', '0', '0', '0', '11:00 ~ 21:30', '없음', '주차가능', 'memberId09', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('자연담은밥상백운재', "031-422-6909", '127.012087', '37.3851399', '0', '자연담은밥상백운재메인.png', '자연담은밥상백운재메뉴.png', '의왕시', '0', '0', '0', '11:00 ~ 21:00', '없음', '주차가능', 'memberId10', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('순보보', "0507-1314-9343", '126.958648', '37.4774773', '0', '순보보메인.png', '순보보메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 21:30', '없음', '주차불가능', 'memberId01', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('정가한정식', "0507-1443-8988", '126.939865', '37.4827850', '0', '정가한정식메인.png', '정가한정식메뉴.png', '관악구', '0', '0', '0', '11:30 ~ 21:40', '설연휴', '주차가능', 'memberId02', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('남도한상', "02-889-8318", '126.947336', '37.4861403', '0', '남도한상메인.png', '남도한상메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 21:00', '없음', '주차가능', 'memberId03', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('미가할매집', "02-888-6940", '126.929085', '37.4877164', '0', '미가할매집메인.png', '미가할매집메뉴.png', '관악구', '0', '0', '0', '11:30 ~ 22:00', '없음', '주차가능', 'memberId04', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('감나무집', "0507-1489-0081", '126.951005', '37.4779428', '0', '감나무집메인.png', '감나무집메뉴.png', '관악구', '0', '0', '0', '11:30 ~ 21:30', '일요일', '주차가능', 'memberId05', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('포도원삼계탕', "02-873-7909", '126.930165', '37.4822119', '0', '포도원삼계탕메인.png', '포도원삼계탕메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 21:00', '없음', '주차가능', 'memberId06', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('토당골', "02-887-0252", '126.929742', '37.4867617', '0', '토당골메인.png', '토당골메뉴.png', '관악구', '0', '0', '0', '11:30 ~ 24:00', '없음', '주차불가능', 'memberId07', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('지리산삼계탕', "02-885-2015", '126.930245', '37.4811127', '0', '지리산삼계탕메인.png', '지리산삼계탕메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 22:00', '없음', '주차가능', 'memberId08', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('관악산가마솥삼계탕', "02-887-0188", '126.950981', '37.4805918', '0', '관악산가마솥삼계탕메인.png', '관악산가마솥삼계탕메뉴.png', '관악구', '0', '0', '0', '11:30 ~ 21:00', '없음', '주차가능', 'memberId09', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('이레삼계탕', "02-877-8833", '126.964912', '37.4759838', '0', '이레삼계탕메인.png', '이레삼계탕메뉴.png', '관악구', '0', '0', '0', '10:30 ~ 21:00', '일요일', '주차불가능', 'memberId10', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('한근한방삼계탕', "02-877-2100", '126.943664', '37.4827508', '0', '한근한방삼계탕메인.png', '한근한방삼계탕메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 21:30', '없음', '주차가능', 'memberId01', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('참이맛감자탕 사당점', "02-587-5879", '126.980649', '37.4753298', '0', '참이맛감자탕메인.png', '참이맛감자탕메뉴.png', '관악구', '0', '0', '10', '8:00 ~ 24:00', '없음', '주차가능', 'memberId02', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('박막례청진동해장국', "02-875-9882", '126.952590', '37.4745918', '0', '박막례청진동해장국메인.png', '박막례청진동해장국메뉴.png', '관악구', '0', '0', '0', '00:00 ~ 24:00', '없음', '주차가능', 'memberId03', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('수라간뼈해장국', "02-874-1233", '126.942214', '37.4863992', '0', '수라간뼈해장국메인.png', '수라간뼈해장국메뉴.png', '관악구', '0', '0', '0', '10:30 ~ 22:00', '토요일', '주차불가능', 'memberId04', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('오인자아구찜 본점', "0507-1332-8422", '126.962910', '37.4769832', '0', '오인자아구찜_본점메인.png', '오인자아구찜_본점메뉴.png', '관악구', '0', '0', '0', '10:00 ~ 22:00', '없음', '주차가능', 'memberId05', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('대호아구집', "02-889-1700", '126.953648', '37.4815209', '0', '대호아구집메인.png', '대호아구집메뉴.png', '관악구', '0', '0', '0', '10:00 ~ 22:00', '월요일', '주차가능', 'memberId06', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('조춘식동갑이네 서울대본점', "02-877-7199", '126.951239', '37.4825290', '0', '조춘식동갑이네_서울대본점메인.png', '조춘식동갑이네_서울대본점메뉴.png', '관악구', '0', '0', '0', '10:30 ~ 23:00', '목요일', '주차가능', 'memberId07', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('고창복의낙지세상 봉천점', "02-886-4242", '126.941968', '37.4826419', '0', '고창복의낙지세상_봉천점메인.png', '고창복의낙지세상_봉천점메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 22:00', '없음', '주차불가능', 'memberId08', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('해물나라', "02-3487-2050", '126.976918', '37.4749507', '0', '해물나라메인.png', '해물나라메뉴.png', '관악구', '0', '0', '0', '11:00 ~ 21:00', '없음', '주차불가능', 'memberId09', '1');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('남도해물요리전문점', "02-888-8253", '126.945397', '37.4792017', '0', '남도해물요리전문점메인.png', '남도해물요리전문점메뉴.png', '관악구', '0', '0', '0', '10:00 ~ 22:00', '월요일', '주차불가능', 'memberId10', '1');
    
############### 승화 ##############################


INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('신셰프양꼬치&훠궈 남현동1호점', '02-598-0077', '126.980344', '37.4754649', '0', 'shinchefmain.', 'shinchefmenu.jpeg', '서울시,관악구', '0', '0', '0', '12:00 - 22:00', 'NULL', NULL, 'memberId01', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('중화요리 팔공', '0507-1307-9815', '126.937083', '37.4840629', '0', 'chinese80main.png', 'chinese80menu.jpeg', '서울시,관악구', '0', '0', '0', '11:20 - 21:30, 브레이크 타임 : 오전재료소진~오후5시까지', '일요일', NULL, 'memberId02', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('화상손만두', '02-3285-8842', '126.962922', '37.4762534', '0', 'hwasangmain.jpeg', 'hwasangmenu.jpeg', '서울시,관악구', '0', '0', '0', '11:30 - 22:30', '일요일', NULL, 'memberId03', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('마부마라탕 샤로수길점', '02-875-0107', '126.953752', '37.4789982', '0', 'magicinchentmain.jpeg', 'magicinchentmenu.jpeg', '서울시,관악구', '0', '0', '0', '11:00 - 22:00', 'NULL', NULL, 'memberId04', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('마차이짬뽕 본사직영점', '02-873-8886', '126.952588', '37.4779255', '0', 'machaimain.jpeg', 'machaimenu.jpeg', '서울시,관악구', '0', '0', '0', '11:00 - 22:00', 'NULL', NULL, 'memberId05', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('무궁화반점 관악점', '02-882-7119', '126.929362', '37.4819051', '0', 'mugunghwamain.jpeg', 'mugunghwamenu.jpeg', '서울시,관악구', '0', '0', '0', '연중무휴', 'NULL', NULL, 'memberId06', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('홍콩반점0410 서울시,관악구청점', '02-886-8965', '126.952565', '37.4786823', '0', 'hongkongmain.png', 'hongkongmenu.png', '서울시,관악구', '0', '0', '0', '월~토 : 11:00 - 21:50, 일 : 11:00 - 21:30', 'NULL', NULL, 'memberId07', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('향라선촨촨향', '02-877-1898', '126.959134', '37.4777388', '0', 'chwanchwanmain.jpeg', 'chwanchwanmenu.jpeg', '서울시,관악구', '0', '0', '0', '11:00 - 24:00', 'NULL', NULL, 'memberId08', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('짬뽕갑 본점', '0507-1320-2113', '126.926022', '37.4866513', '0', 'gapmain.png', 'gapmenu.jpeg', '서울시,관악구', '0', '0', '0', '토~일 : 11:00 - 21:00, 월~금 : 11:00 - 22:00', 'NULL', NULL, 'memberId09', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('소백양샤브샤브', '0507-1321-5188', '126.951986', '37.4824933', '0', 'so100main.png', 'so100menu.jpeg', '서울시,관악구', '0', '0', '0', '10:00 - 01:00', 'NULL', NULL, 'memberId10', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('동경산책', '0507-1343-0666', '126.954170', '37.4788722', '0', 'tokyomain.jpeg', 'tokyomenu.jpeg', '서울시,관악구', '0', '0', '0', '11:30 - 21:00, 브레이크타임 : 15:00 - 17:00', 'NULL', NULL, 'memberId01', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('철판구이 고쿠', '0507-1364-5733', '126.956330', '37.4782243', '0', 'gokumain.jpeg', 'gokumenu.jpeg', '서울시,관악구', '0', '0', '0', '17:00 - 02:00', '월', NULL, 'memberId02', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('안녕쿠마', '0507-1358-3875', '126.956330', '37.4782243', '0', 'kumamain.jpeg', 'kumamenu.jpeg', '서울시,관악구', '0', '0', '0', '11:30 - 22:00, 브레이크타임 : 15:00 - 17:00', '수', NULL, 'memberId03', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('텐동요츠야', '0507-1409-7974', '126.954464', '37.4789444', '0', 'yotsuyamain.jpeg', 'yotsuyamenu.jpeg', '서울시,관악구', '0', '0', '0', '12:00 - 21:00, 브레이크타임: 14:30 - 17:00', '월', NULL, 'memberId04', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('모다모다 낙성대점', '0507-1485-3324', '126.965782', '37.4756056', '0', 'modamain.jpeg', 'modamenu.jpeg', '서울시,관악구', '0', '0', '0', '11:00 - 22:00', 'NULL', NULL, 'memberId05', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('은행골 본점신관', '02-859-4988', '126.903436', '37.4832830', '0', 'bankbonemain.jpeg', 'bankbonemenu.jpeg', '서울시,관악구', '0', '0', '0', '월~금 : 11:20 - 22:30, 토~일 : 11:20 - 21:30', 'NULL', NULL, 'memberId06', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('온정돈까스 본점', '02-3281-3330', '126.909077', '37.4835308', '0', 'onjeongmain.jpeg', 'onjeongmenu.jpeg', '서울시,관악구', '0', '0', '0', '11:00 - 19:50', '화', NULL, 'memberId07', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('라이라이켄', '0507-1312-4303', '126.954089', '37.4820797', '0', 'rairaimain.jpeg', 'rairaimenu.jpeg', '서울시,관악구', '0', '0', '0', '11:50 - 21:00, 브레이크타임 : 15:00 - 17:00', '월', NULL, 'memberId08', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('낙원의소바', '0507-1438-3018', '126.952858', '37.4797276', '0', 'heavenmain.jpeg', 'heavenmenu.jpeg', '서울시,관악구', '0', '0', '0', '11:00 - 20:30, 브레이크타임 : 15:00 - 17:00', 'NULL', NULL, 'memberId09', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('고베규카츠 신림점', '0507-1428-8988', '126.928196', '37.4835352', '0', 'gobegyumain.jpeg', 'gobegyumenu.jpeg', '서울시,관악구', '0', '0', '0', '11:30 - 22:00', 'NULL', NULL, 'memberId10', '4');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('연경', '0507-1389-7894', '126.620183', '37.4756268', '0', 'ykmain.jpeg', 'ykmenu.jpeg', '인천,중구', '0', '0', '0', '10:30 - 21:30', 'NULL', NULL, 'memberId01', '3');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no) VALUES ('우와', '070-7808-0728', '126.721033', '37.4916406', '0', 'wowmain.jpeg', 'wowmenu.jpeg', '인천,부평구', '0', '0', '0', '금~토 : 12:00 - 24:00, 일~목 : 12:00 - 22:00', 'NULL', NULL, 'memberId02', '4');

################ 상용 #############

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('마노아김밥', "02-872-7720", '126.965918', '37.4765337', '0', 'manoa_main.jpg', 'maoa_menu.jpg', '서울시,관악구', '0', '0', '10', '06:30 ~ 23:00', '일요일', '가능', 'memberId01', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('쩡떡볶이', "0507-1344-2074", '126.945690', '37.4791658', '0', 'jjung_main.jpg', 'jjung_menu.jpg', '서울시,관악구', '0', '0', '10', '10:30 ~ 22:00', '토요일', '불가능', 'memberId02', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('진순자계란말이김밥 봉천본점', "02-883-1824", '126.947351', '37.4812569', '0', 'jinsunja_main.jpg', 'jinsunja_menu.jpg', '서울시,관악구', '0', '0', '10', '08:00 ~ 23:00', '일요일', '불가능', 'memberId03', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('청담동마녀김밥 서울대역점', "0507-1442-7821", '126.950641', '37.4810782', '0', 'mayeo_main.jpg', 'mayeo_menu.jpg', '서울시,관악구', '0', '0', '10', '08:00 ~ 21:00', '없음', '불가능', 'memberId04', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('모모즉석떡볶이', "02-885-2497", '126.965059', '37.4748936', '0', 'momo_main.jpg', 'momo_menu.jpg', '서울시,관악구', '0', '0', '10', '11:00 ~ 22:00', '가능', '가능', 'memberId05', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('레드신 낙성대역점', "0507-1394-6670", '126.963521', '37.4767582', '0', 'red_main.jpg', 'red_menu.jpg', '서울시,관악구', '0', '0', '10', '11:30 ~ 23:30', '일요일', '불가능', 'memberId06', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('오월의김밥', "02-876-7792", '126.964595', '37.4760828', '0', '5wol_main.jpg', '5wol_menu.jpg', '서울시,관악구', '0', '0', '10', '07:00 ~ 20:30', '월요일', '불가능', 'memberId07', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('별미분식', "0507-1400-9705", '126.974872', '37.4756260', '0', 'byeolmi_main.jpg', 'byeolmi_menu.jpg', '서울시,관악구', '0', '0', '10', '11:00 ~ 21:00', '없음', '가능', 'memberId08', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('신포우리만두 낙성대점', "02-888-7501", '126.960038', '37.4775229', '0', 'shinpo_main.jpg', 'shinpo_menu.jpg', '서울시,관악구', '0', '0', '10', '11:30 ~ 21:00', '수요일, 목요일', '불가능', 'memberId09', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('다감오니기리', "02-888-5272", '126.962696', '37.4756497', '0', 'dagam_main.jpg', 'dagam_menu.jpg', '서울시,관악구', '0', '0', '10', '10:00 ~ 20:30', '토요일', '불가능', 'memberId10', '8');

INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('라빈느', "070-4127-0506", '126.936395', '37.4682139', '0', 'lavi_main.jpg', 'lavi_menu.jpg', '서울시,관악구', '0', '0', '10', '07:00 ~ 19:00', '일요일', '불가능', 'memberId01', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('구동커피', "02-884-0077", '126.936225', '37.4688174', '0', 'gudong_main.jpg', 'gudong_menu.jpg', '서울시,관악구', '0', '0', '10', '08:30 ~ 16:00', '토요일, 일요일', '불가능', 'memberId02', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('세미온', "070-7573-6567", '126.937277', '37.4686018', '0', 'semi_main.jpg', 'semi_menu.jpg', '서울시,관악구', '0', '0', '10', '11:00 ~ 22:00', '화요일', '가능', 'memberId03', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('와플대학', "02-6369-0770", '126.937208', '37.4691694', '0', 'waffle_main.jpg', 'waffle_menu.jpg', '서울시,관악구', '0', '0', '10', '11:00 ~ 22:00', '없음', '불가능', 'memberId04', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('카페인', "0507-1395-0122", '126.935761', '37.4693848', '0', 'kaffeine_main.jpg', 'keffeine_menu.jpg', '서울시,관악구', '0', '0', '10', '07:00 ~ 23:00', '없음', '가능', 'memberId05', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('카페요와', "0507-1434-8852", '126.948754', '37.4803385', '0', 'cafeyo_main.jpg', 'cafeyo_menu.jpg', '서울시,관악구', '0', '0', '10', '08:30 ~ 01:00', '없음', '가능', 'memberId06', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('샤라라', "070-4194-0771", '126.947284', '37.4799504', '0', 'sha_main.jpg', 'sha_menu.jpg', '서울시,관악구', '0', '0', '10', '12:00 ~ 21:00', '수요일, 목요일', '불가능', 'memberId07', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('제일공간', "0507-1489-3599", '126.955719', '37.4793683', '0', 'jeil_main.jpg', 'jeil_menu.jpg', '서울시,관악구', '0', '0', '10', '12:00 ~ 21:30', '월요일', '불가능', 'memberId08', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('사담', "02-882-7501", '126.955537', '37.4798999', '0', 'sadam_main.jpg', 'sadam_menu.jpg', '서울시,관악구', '0', '0', '10', '10:00 ~ 22:00', '없음', '불가능', 'memberId09', '7');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('마인드멜드', "0507-1313-9401", '126.953752', '37.4789891', '0', 'mind_main.jpg', 'mind_menu.jpg', '서울시,관악구', '0', '0', '10', '11:00 ~ 22:00', '수요일', '불가능', 'memberId10', '7');


INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('남문납작만두', "053-257-1440", '128.591546', '35.8614692', '0', 'mannun_menu.jpg', 'nammun_main.jpg', '대구,중구', '0', '0', '10', '10:00 ~ 18:30', '일요일', '불가능', 'memberId01', '8');
INSERT INTO store (store_name, store_phone, store_latitude, store_longitude, store_read_count, store_file_main, store_file_menu, store_address, store_review_count, store_star, store_bookmarks, store_time, store_day_off, store_parking, member_id, category_no)
	VALUES ('스테이블모먼트', "0507-1361-1031", '128.516267', '35.8189345', '0', 'stable_main.jpg', 'stable_menu.jpg', '대구,달서구', '0', '0', '10', '09:30 ~ 23:00', '없음', '가능', 'memberId02', '7');

SELECT * FROM store order by store_no DESC;
COMMIT;
SELECT * FROM store;
SELECT * FROM post;
SELECT * FROM member;


