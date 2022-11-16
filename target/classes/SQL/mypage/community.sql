
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
  community_title VARCHAR(40) NULL,
  community_reg_date TIMESTAMP NOT NULL,  
  community_reply_count INTEGER(10) NULL default '0',
  community_read_count integer(10) default '0',
  community_content VARCHAR(1000) NOT NULL,
  community_file VARCHAR(100) NULL,
  community_parent_no INTEGER(10) NOT NULL default '0',
  community_re_reply INTEGER(10) NOT NULL default '0',
  community_reply_target VARCHAR(20) NULL,
  party_members INTEGER(5) NULL,
  party_member_ids VARCHAR(300) NULL,
  party_d_day TIMESTAMP NULL,
  party_place VARCHAR(40) NULL,
  category_no INTEGER NOT NULL default '0',
  member_id VARCHAR(20) NOT NULL,
  member_nickname VARCHAR(20) NOT NULL,
  member_address VARCHAR(20) NOT NULL default"",
  
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
    
    INSERT INTO post (post_title, post_content, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('최고의 저녁식사였습니다.', '사장님이 친절하시고 해물찜이 맛있었어요. 단짠의 조화가 잘 어울리는 맛이라 제가 진짜 좋아하는 맛이었습니다ㅜㅜㅜㅠㅠ 엄마가 해주시던 것과 비슷한 맛이나서 엄마가 생각날 때 찾아가곤 합니다.', 'test.png', null, null, null, null, sysdate(), '1', '5', '40', '', '60', 'yejin', '하영전용킬러 예진');
	INSERT INTO post (post_title, post_content, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('오늘 저녁으로 먹고 왔습니다.', '후기가 좋길래 오늘 저녁에 갔다왔습니다. 퇴근길에 지나가면서 사람들이 먹는 모습보고 궁금했던 가겐데 가격도 저렴하고 만족합니다. 해물찜 강추', 'test.png', null, null, null, null, sysdate(), '1', '4', '56', '', '60', 'yejin', '하영전용킬러 예진');
	INSERT INTO post (post_title, post_content, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('가족들이랑 다녀왔습니다.', '매운 것 잘 못 먹는 남편이 잘 먹어서 다음에 또 갈까 생각중입니다. 아이들은 원래 해물 잘 먹어서 좋아할 것 같긴했는데 아주 잘 먹더라고요~ 우리동네 맛집 인정~!', 'test.png', null, null, null, null, sysdate(), '1', '5', '36', '', '60', 'yejin', '하영전용킬러 예진');
	INSERT INTO post (post_title, post_content, post_file1, post_file2, post_file3, post_file4, post_file5, post_reg_date, post_is_post, post_star, post_up_count, post_up_list, store_no, member_id, member_nickname) VALUES ('쭈꾸미덮밥이 생각보다 별미', '친구들이 좋아해서 자주 가는데 매번 해물찜만 먹다가 쭈꾸미덮밥을 먹었어요. 요즘 제철아닌지 쭈꾸미가 좀 작긴 합니다만 맛인 괜찮았습니다.', 'test.png', null, null, null, null, sysdate(), '1', '3', '23', '', '60', 'yejin', '하영전용킬러 예진');
    
select * from community order by community_no desc;
COMMIT;

