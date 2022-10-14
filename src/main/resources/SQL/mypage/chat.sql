
## DATABASE 삭제 및 생성 및 선택
DROP DATABASE yameokja;
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- ch_no, ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check
DROP TABLE IF EXISTS chat;
CREATE TABLE IF NOT EXISTS chat(
  ch_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  ch_ids VARCHAR(30) NOT NULL,
  ch_sender VARCHAR(100) NOT NULL,  
  ch_receiver VARCHAR(100) NOT NULL,
  ch_content VARCHAR(1000) NOT NULL,
  ch_send_date TIMESTAMP NOT NULL,
  ch_read_check VARCHAR(20) NOT NULL,
  ch_leave_check INTEGER(5) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#######################################################################################################################ch_no, ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check

INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids01', 'ch_sender01', 'ch_receiver01', 'ch_content01', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids02', 'ch_sender02', 'ch_receiver02', 'ch_content02', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids03', 'ch_sender03', 'ch_receiver03', 'ch_content03', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids04', 'ch_sender04', 'ch_receiver04', 'ch_content04', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids05', 'ch_sender05', 'ch_receiver05', 'ch_content05', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids06', 'ch_sender06', 'ch_receiver06', 'ch_content06', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids07', 'ch_sender07', 'ch_receiver07', 'ch_content07', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids08', 'ch_sender08', 'ch_receiver08', 'ch_content08', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids09', 'ch_sender09', 'ch_receiver09', 'ch_content09', '2017-12-01 05:44:32', 'ch_read_check', '1');
INSERT INTO chat (ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check) VALUES ('ch_ids10', 'ch_sender10', 'ch_receiver10', 'ch_content10', '2017-12-01 05:44:32', 'ch_read_check', '1');


COMMIT;

SELECT * FROM chat;
