
## DATABASE 생성 및 선택
CREATE DATABASE IF NOT EXISTS yameokja;
use yameokja;
-- 테이블 넣는 순서 member-category-store-post
-- 								-community
-- 								-report
-- 상관없는 테이블 chat

-- c_no, c_name, c_order
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
  c_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  c_name VARCHAR(20) NOT NULL,
  c_order VARCHAR(10) NULL  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO category (c_name, c_order) VALUES ('한식', null);
INSERT INTO category (c_name, c_order) VALUES ('양식', null);
INSERT INTO category (c_name, c_order) VALUES ('중식', null);
INSERT INTO category (c_name, c_order) VALUES ('일식', null);

COMMIT;

SELECT * FROM category;
