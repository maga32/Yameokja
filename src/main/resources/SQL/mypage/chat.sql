
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- ch_no, ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check
DROP TABLE IF EXISTS chat;
CREATE TABLE IF NOT EXISTS chat(
  chat_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  chat_ids VARCHAR(30) NOT NULL,
  chat_sender VARCHAR(100) NOT NULL,  
  chat_receiver VARCHAR(100) NOT NULL,
  chat_content VARCHAR(1000) NOT NULL,
  chat_send_date TIMESTAMP NOT NULL,
  chat_read_check INTEGER(5) NOT NULL,
  chat_leave_check INTEGER(5) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#######################################################################################################################ch_no, ch_ids, ch_sender, ch_receiver, ch_content, ch_send_date, ch_read_check, ch_leave_check

INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId01', 'memberId02', '멤버1->멤버2 채팅1', '2017-12-01 05:44:32', '1', '0');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId03', 'memberId01', 'memberId03', '멤버1->멤버3 채팅2', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId04', 'memberId01', 'memberId04', '멤버1->멤버4 채팅3', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId01', 'memberId02', '멤버1->멤버2 채팅4', '2017-12-01 05:44:32', '1', '2');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId02', 'memberId01', '멤버2->멤버1 채팅5', '2017-12-01 05:44:32', '1', '-1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId02,memberId03', 'memberId02', 'memberId03', '멤버2->멤버3 채팅6', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId03,memberId04', 'memberId03', 'memberId04', '멤버3->멤버4 채팅7', '2017-12-01 05:44:32', '0', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId03', 'memberId03', 'memberId01', '멤버3->멤버1 채팅8', '2017-12-01 05:44:32', '0', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId02', 'memberId01', '멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2멤버2->멤버1 채팅2', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId04', 'memberId01', 'memberId04', '멤버1->멤버4 채팅9', '2017-12-01 05:44:32', '0', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId01', 'memberId02', '멤버1->멤버2 채팅10', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId02', 'memberId01', '멤버2->멤버1 채팅11', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId01', 'memberId02', '멤버1->멤버2 채팅12', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId02', 'memberId01', '멤버2->멤버1 채팅13', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId01', 'memberId02', '멤버1->멤버2 채팅14', '2017-12-01 05:44:32', '1', '1');
INSERT INTO chat (chat_ids, chat_sender, chat_receiver, chat_content, chat_send_date, chat_read_check, chat_leave_check) VALUES ('memberId01,memberId02', 'memberId02', 'memberId01', '멤버2->멤버1 채팅15', '2017-12-01 05:44:32', '1', '1');

COMMIT;
desc chat;
SELECT * FROM chat ORDER BY chat_no DESC;

SELECT chat_ids FROM (SELECT chat_no, chat_ids FROM chat WHERE chat_sender = "memberId01" or chat_receiver = "memberId01" ORDER BY chat_no DESC)chat_ids;
SELECT chat_ids FROM chat WHERE chat_sender = "memberId01" or chat_receiver = "memberId01" GROUP BY chat_ids ORDER BY MAX(chat_no) DESC;
SELECT * FROM chat WHERE chat_ids = "memberId01,memberId03" ORDER BY chat_no DESC LIMIT 0,1;
SELECT * FROM chat WHERE chat_ids = "memberId01,memberId03" AND chat_leave_check = 1 OR chat_leave_check = -1 ORDER BY chat_no;
UPDATE chat SET chat_read_check = 1 WHERE chat_ids = 'memberId01,memberId02' AND chat_receiver = 'memberId02' AND chat_read_check = 0;
UPDATE chat SET chat_read_check = 0 WHERE chat_ids = 'memberId01,memberId02' AND chat_receiver = 'memberId02' AND chat_read_check = 1;