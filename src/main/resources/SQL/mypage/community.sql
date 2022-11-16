
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
  community_title VARCHAR(20) NULL,
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
  member_address VARCHAR(20) NOT NULL,
  
  CONSTRAINT community_category_fk FOREIGN KEY(category_no) REFERENCES category(category_no),
  CONSTRAINT community_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT community_member_fk2 FOREIGN KEY(member_nickname) REFERENCES member(member_nickname)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table community change community_title community_title VARCHAR(30) NULL;

TRUNCATE community;

#######################################################################################################################################################################################################################################community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname

INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("관악구 맛집 추천해주세요!!", '2022-11-03 13:42:32', 0, 12, '선배님들 추천 부탁드립니다!!', 'community01.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("오는 토요일 아침 조깅하실분~", '2022-11-04 03:22:08', 0, 85, '같이 가실분 신청해주세요! 1:1채팅 드릴게요~', 'community02.png', '0', '0', NULL, '4', 'yejin', '2022-11-05 06:00:00', '봉천역 1번출구', '102', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("근처 코로나 대면진료 보는 병원 공유해주세요 ㅠㅠ", '2022-11-09 08:31:09', 0, 32, '오늘 아침에 확진됐네요 생일인데 ㅠㅠ', 'community03.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("유희왕 카드게임 듀얼한판 하실분 찾아요~", '2022-11-10 23:42:32', 0, 12, '부끄러운 취미지만 용기내어 같이하실 분 찾아봅니다 ㅎㅎ', 'community04.png', '0', '0', NULL, '2', 'yejin', '2022-11-13 13:00:00', '신림역 2번줄구 옆 잔디밭', '102', 'yejin', '하영전용킬러 예진', '서울,관악구');
	INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("봉천동 가성비 치킨맛집 쁘이치킨 추천드려요!", '2022-11-11 01:02:09', 0, 13, '가격도 저렴하고 맛있습니다 ㅎㅎ', 'community05.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("날씨가 많이 추워졌네요", '2022-11-12 08:45:09', 0, 40, '다들 옷 따듯하게 입으세요 ㅎㅎ', 'community06.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("케이크 잘 만드는 동네 빵집 추천해주세요!", '2022-11-12 17:20:52', 0, 22, '맛있는 케이크가 먹고싶네요', 'community07.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("에그옐로우 건물 안에 있는 치과 괜찮나요?", '2022-11-12 21:03:29', 0, 19, '다녀와보신 분 계신가요? 다른 괜찮은 곳 있으면 추천부탁드려요!', 'community08.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("여러분의 인생드라마를 공유해주세요~", '2022-11-13 00:53:19', 0, 14, '저는 나의아저씨, 미스터 선샤인을 너무 재밌게 봤어요 ㅎㅎ', 'community09.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
     INSERT INTO community (community_title, community_reg_date, community_reply_count, community_read_count, community_content, community_file, community_parent_no, community_re_reply, community_reply_target, party_members, party_member_ids, party_d_day, party_place, category_no, member_id, member_nickname, member_address) 
	VALUES ("서울대입구역 근처 잘하는 수선집 있나요?", '2022-11-14 13:10:09', 0, 9, '맨투맨 목, 손목 시보리 수선하고싶어요~', 'community10.png', '0', '0', NULL, NULL, NULL, NULL, NULL, '101', 'yejin', '하영전용킬러 예진', '서울,관악구');
    
select * from community order by community_no desc;
COMMIT;

