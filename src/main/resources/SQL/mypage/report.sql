
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- report_no, report_type, report_target, report_content, report_date, report_file, 
-- report_punish_check, report_punish_content, member_id, category_no

DROP TABLE IF EXISTS report;
CREATE TABLE IF NOT EXISTS report(
  report_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  report_title VARCHAR(1000) NOT NULL,
  report_type VARCHAR(20) NOT NULL,
  report_target VARCHAR(20) NOT NULL,  
  report_content VARCHAR(1000) NOT NULL,
  report_date TIMESTAMP NOT NULL,
  report_file INTEGER(5) NULL,
  report_punish_check VARCHAR(100) NOT NULL default 0,
  report_punish_content VARCHAR(1000) NULL,
  
  member_id VARCHAR(20) NOT NULL,
  category_no INTEGER(10) NOT NULL,
  CONSTRAINT report_member_fk FOREIGN KEY(member_id) REFERENCES member(member_id),
  CONSTRAINT report_category_fk FOREIGN KEY(category_no) REFERENCES category(category_no)
  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;

SELECT * FROM report;

############################################################################################################################################################################################report_no, report_title, report_type, report_target, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no
#store
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('영업시간이 잘 못 적여 있어요', '가게정보 변경(영업시간, 가게번호)', 'report_target', '영업시간이 잘 못 적혀있는데\n수정 부탁드립니다.', '2017-12-01 05:44:32', NULL, '0', NULL, 'memberId01', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('가게 폐업함', '위치이전 및 폐업', 'report_target', '폐업한 가게니 확인 부탁', '2018-1-01 05:44:32', NULL, '1', NULL, 'memberId02', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('가게아니고 가정집', '허위 가게', 'report_target', '일반적인 식당이 아닌데 가게라고 소개되어있어서 친구랑 갓다가 시간만 버리고 왔네요ㅠㅠ\n가게 삭제처리 해수세요.', '2018-3-01 05:44:32', NULL, '2', NULL, 'memberId03', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상한 가게 신고합니다.', '허위 가게', 'report_target', '식당 분위기가 별로', '2018-5-07 05:44:32', NULL, '3', NULL, 'memberId04', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('폐업한 가겐데 모르고 여자친구랑 갔어요', '위치이전 및 폐업', 'report_target', '폐업한 가겐데 업데이트가 안 됐는지\n정보가 떠 있어서 찾아갔는데 아무것도 없었어요', '2018-6-01 05:44:32', NULL, '3', NULL, 'memberId05', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('벌레나온 가게 신고함', '기타(가게)', 'report_target', '음식에서 벌레가ㅜㅜㅜㅜ', '2018-7-01 05:44:32', NULL, '2', NULL, 'memberId06', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('사장님이 이상해요', '기타(가게)', 'report_target', '사장님이 현금만 받으요,,\n 그럴 수도 있긴 한데 저는 좀 그랬습니다.', '2018-8-01 05:44:32', NULL, '1', NULL, 'memberId07', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이전해서 위치가 안 맞아요', '위치이전 및 폐업', 'report_target', '가게 이전했는데 바뀐 위치로 변경 좀', '2018-9-01 05:44:32', NULL, '0', NULL, 'memberId08', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('다른 가게 사진이 올라감', '가게정보 변경(영업시간, 가게번호)', 'report_target', '가게 사진이 가게와 맞지 않습니다.', '2018-10-01 05:44:32', NULL, '1', NULL, 'memberId09', '301');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('메뉴판 사진이 이 가게가 아님', '메뉴판 변경', 'report_target', '메뉴판 사진이 맞지 않는데 확인부탁드립니다.', '2018-11-01 05:44:32', NULL, '2', NULL, 'memberId10', '301');
#post
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('거칫 후기', '부적절한 게시글 및 댓글', 'report_target', '가게 후기에 이상한 말을 적어놓으셨네요. \n관리자님께서 확인해보시고 적당한 처리 부탁드립니다.', '2018-12-01 05:44:32', NULL, '3', NULL, 'memberId01', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상한 말을 적어놈', '부적절한 게시글 및 댓글', 'report_target', '가게가 마음에 안 들면 안 가면 되지 후기를 악의적으로 적어놓음.', '2019-1-01 05:44:32', NULL, '3', NULL, 'memberId02', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('가게와 상관없는 글', '허위정보 게시글', 'report_target', 'ㅋㅋㅋ가게랑 상관없는 후기를 왜 여기다 적어놓으셨을까요\n 음 전혀 상관이 없으니 삭제가 되어야 할 것 같습니다.', '2019-2-01 05:44:32', NULL, '2', NULL, 'memberId03', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('다른 가게 사진', '허위정보 게시글', 'report_target', '후기를 착각하고 다른 가게꺼를 올렸는지 사진과 가게정보가 맞지 않아 혼란을 주고 있습니다.', '2019-3-01 05:44:32', NULL, '1', NULL, 'memberId04', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('분식집인데 중국집 설명이', '허위정보 게시글', 'report_target', '분식집인데 중국집 설명이되어있어요. 처리 시급함.', '2019-4-01 05:44:32', NULL, '1', NULL, 'memberId05', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('신고합니다.', '반복적인 게시글', 'report_target', '후기에는 양이 엄청 많은 가게인 것 처럼 올렸는데 실제 가보니 양이 다르네요. 사장님 아는 사이신가', '2019-5-01 05:44:32', NULL, '0', NULL, 'memberId06', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('다른 사람이 작성한 글', '허위정보 게시글', 'report_target', '제가 쓴 글을 몇 글자 수정하고 그대로 올렸네요. 불쾌함', '2019-6-01 05:44:32', NULL, '0', NULL, 'memberId07', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상해요', '반복적인 게시글', 'report_target', '무슨 야채인지 모르겠는 야채가 들어있었어요ㅜㅜ 먹고 체함', '2019-7-01 05:44:32', NULL, '0', NULL, 'memberId08', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상한 후기', '부적절한 게시글 및 댓글', 'report_target', '가게랑 상관없는 후기는 여기 왜 쓰는건지,,', '2019-8-01 05:44:32', NULL, '0', NULL, 'memberId09', '302');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('일부러 가게에 대한 안 좋은 글을 씀', '부적절한 게시글 및 댓글', 'report_target', '가게에 불만이 있는지 가게욕이 가득하네요', '2019-9-01 05:44:32', NULL, '3', NULL, 'memberId10', '302');
#community
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('그지야 뭐야', '부적절한 커뮤니티글', 'report_target', '친구처럼 지내자고 해놓고 계산할 때만 뒤로가고 돈 빌려달라면서 사람 모집글을 쓰지는데 이런 사람은 못 쓰게 해야하지 않나요?', '2019-10-01 05:44:32', NULL, '3', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('판매상이신가', '부적절한 커뮤니티글', 'report_target', '동네글에 자꾸 판매글을 올려욬ㅋㅋㅋ뭐지', '2019-11-01 05:44:32', NULL, '2', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('지역이 맞지 않는데 다른 지역글을 착각하고 올리신 듯', '부적절한 커뮤니티글', 'report_target', '다른 지역글입니다.', '2019-12-01 05:44:32', NULL, '0', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('광고글 삭제 좀', '부적절한 커뮤니티글', 'report_target', '광고성 판매글을 올리십니다. 사과 맛있겠다.', '2020-1-01 05:44:32', NULL, '0', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('해결 좀', '부적절한 커뮤니티글', 'report_target', 'report_content10', '2020-2-01 05:44:32', NULL, '3', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('도배 사절', '반복적인 게시글', 'report_target', '반복적인 글을 올립니다.', '2020-3-01 05:44:32', NULL, '0', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('아 음란물 처리 좀', '반복적인 게시글', 'report_target', '이상한 음란물을 올리십니다.', '2020-4-01 05:44:32', NULL, '2', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('자꾸 욕을 쓰시넹', '반복적인 게시글', 'report_target', '반복적으로 특정유저에 대한 욕을 작성하십니다.', '2020-5-01 05:44:32', NULL, '1', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('모임을 일부러 파토내는 사람 신고합니다.', '부적절한 커뮤니티글', 'report_target', '약속시간이 다 되서 파토내요ㅜㅜ 일부러 그러는 것 같습니다.', '2020-6-01 05:44:32', NULL, '3', NULL, 'memberId10', '303');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('모집글에서 여자만 구해요', '부적절한 커뮤니티글', 'report_target', '여자만 모집에 참가할 수 있도록 하시네요', '2020-7-01 05:44:32', NULL, '2', NULL, 'memberId10', '303');
#user
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상한 유저 신고합니다.', '불건전한 사용자', 'report_target', '모르는 사람이 자꾸 아는 척 하면서 채팅을;;', '2020-8-01 05:44:32', NULL, '3', NULL, 'memberId01', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상한 게시글을 반복적으로 올립니다', '기타(사용자)', 'report_target', '반복글로 도배하네요 블랙리스트 처리해야할 듯', '2020-9-01 05:44:32', NULL, '2', NULL, 'memberId02', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('신고', '불건전한 사용자', 'report_target', 'report_content03', '2020-10-01 05:44:32', NULL, '1', NULL, 'memberId03', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('불법 유저', '불건전한 사용자', 'report_target', '사기 치는 사람은 이용을 못 하게 해야 됨. 진짜 악질임. \n사줄테니 밥 먹고 싶은 사람 오라고 헤 놓고 노쇼네요', '2020-11-01 05:44:32', NULL, '2', NULL, 'memberId04', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('사기친 사람 신고요', '불건전한 사용자', 'report_target', '유명인인척하면서 자꾸 상품 가입시키려 합니다.', '2020-12-01 05:44:32', NULL, '3', NULL, 'memberId05', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('거짓글을 작성합니다.', '불건전한 사용자', 'report_target', '이상한 글을 작성하네요 이 분이 적으신 글들 대부분이 이상합니다.', '2021-1-01 05:44:32', NULL, '3', NULL, 'memberId06', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('이상한 채팅을 보내요', '불건전한 사용자', 'report_target', '모르는 사람이 채팅을 보내는데요', '2021-2-01 05:44:32', NULL, '0', NULL, 'memberId07', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('욕함', '불건전한 사용자', 'report_target', '욕하는 사람 신고', '2021-3-01 05:44:32', NULL, '0', NULL, 'memberId08', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('변태 신고', '불건전한 사용자', 'report_target', '변태 옷 입고 찍은 사진을 올리는데 보기 역하니 처리 좀요', '2021-4-01 05:44:32', NULL, '0', NULL, 'memberId09', '304');
INSERT INTO report (report_title, report_type, report_target, report_content, report_date, report_file, report_punish_check, report_punish_content, member_id, category_no) VALUES ('해결 좀', '불건전한 사용자', 'report_target', '채팅을 보내는 기능이 오류나요ㅜㅜ', '2021-5-01 05:44:32', NULL, '1', NULL, 'memberId10', '304');


COMMIT;

SELECT * FROM report;

