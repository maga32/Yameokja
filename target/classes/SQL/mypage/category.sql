
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- category_no, category_name, category_order
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
  category_no INTEGER PRIMARY KEY,
  category_name VARCHAR(20) NOT NULL,
  category_order INTEGER(10) NULL  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO category (category_no, category_name, category_order) VALUES (1, '한식', 1);
INSERT INTO category (category_no, category_name, category_order) VALUES (2, '양식', 2);
INSERT INTO category (category_no, category_name, category_order) VALUES (3, '중식', 3);
INSERT INTO category (category_no, category_name, category_order) VALUES (4, '일식', 4);
INSERT INTO category (category_no, category_name, category_order) VALUES (5, '아시안', 5);
INSERT INTO category (category_no, category_name, category_order) VALUES (6, '술집', 6);
INSERT INTO category (category_no, category_name, category_order) VALUES (7, '카페·디저트', 7);
INSERT INTO category (category_no, category_name, category_order) VALUES (8, '분식', 8);
INSERT INTO category (category_no, category_name, category_order) VALUES (9, '고기', 9);
INSERT INTO category (category_no, category_name, category_order) VALUES (10, '채식', 10);
INSERT INTO category (category_no, category_name, category_order) VALUES (11, '패스트푸드', 11);
INSERT INTO category (category_no, category_name, category_order) VALUES (-1, '삭제된 댓글', 9998);
INSERT INTO category (category_no, category_name, category_order) VALUES (101, '수다글', 101);
INSERT INTO category (category_no, category_name, category_order) VALUES (102, '모집글', 102);
INSERT INTO category (category_no, category_name, category_order) VALUES (0, '댓글', 0);

COMMIT;

SELECT * FROM category;
