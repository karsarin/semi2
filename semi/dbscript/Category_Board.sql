
DROP TABLE CATEGORY_BOARD CASCADE CONSTRAINTS;

-- 카테고리 게시글 테이블
CREATE TABLE CATEGORY_BOARD(
    CATEGORY_NO NUMBER CONSTRAINT PK_CATEGORY PRIMARY KEY,
    USER_ID VARCHAR2(15) NOT NULL,
    CATEGORY_GROUP NUMBER NOT NULL,
    CATEGORY_TITLE VARCHAR2(50) NOT NULL,
    CATEGORY_WRITER VARCHAR2(15) NOT NULL,
    CATEGORY_CONTENT VARCHAR2(2000) NOT NULL,
    CATEGORY_DATE DATE DEFAULT SYSDATE,
    CATEGORY_READCOUNT NUMBER DEFAULT 0,
    CATEGORY_DONATION NUMBER DEFAULT 0,
    WORK_DATE NUMBER DEFAULT 0,
    CATEGORY_LEVEL NUMBER,
    CATEGORY_REF NUMBER,
    CATEGORY_REPLY_REF NUMBER,
    CATEGORY_REPLY_SEQ NUMBER,
    PHONE CHAR(11),
    EMAIL VARCHAR2(30),
    ORIGINAL_IMAGE VARCHAR2(100),
    RENAME_IMAGE VARCHAR2(1000),
    SPECIAL CHAR(1) DEFAULT 'N',
    APPROVAL CHAR(1) DEFAULT 'N'
);
ALTER TABLE CATEGORY_BOARD
ADD CONSTRAINT FK_CATEGORYGROUP FOREIGN KEY (CATEGORY_GROUP)
REFERENCES CATEGORY_GROUP(GROUP_NO);


COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_NO IS '카테고리게시글번호';
COMMENT ON COLUMN CATEGORY_BOARD.USER_ID IS '아이디';
COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_GROUP IS '카테고리분류';
COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_TITLE IS '카테고리게시글이름';
COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_DATE IS '작성일자';
COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_DONATION IS '기부금';
COMMENT ON COLUMN CATEGORY_BOARD.WORK_DATE IS '작업일';
COMMENT ON COLUMN CATEGORY_BOARD.ORIGINAL_IMAGE IS '메인이미지';
COMMENT ON COLUMN CATEGORY_BOARD.ORIGINAL_IMAGE IS '이름바뀐이미지';
COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_CONTENT IS '상세내용';
COMMENT ON COLUMN CATEGORY_BOARD.PHONE IS '전화번호';
COMMENT ON COLUMN CATEGORY_BOARD.EMAIL IS '이메일';
COMMENT ON COLUMN CATEGORY_BOARD.CATEGORY_READCOUNT IS '조회수';

INSERT INTO CATEGORY_BOARD VALUES(1, 'user11', 1, 'IT 재능', 'user11', 
    'IT 재능 기부함', DEFAULT, DEFAULT, 10000, 1, 1, 0, 0, 0, 01012345678, 'user11@naver.com',
    NULL, NULL, DEFAULT, DEFAULT);    
INSERT INTO CATEGORY_BOARD VALUES(2, 'user22', 2, '번역 재능', 'user22', 
    '번역 재능 기부함', DEFAULT, DEFAULT, 500000, 3, 1, 0, 0, 0, 01023456789, 'user22@daum.com',
    NULL, NULL, DEFAULT, DEFAULT);    
INSERT INTO CATEGORY_BOARD VALUES(3, 'user33', 3, '건강 재능', 'user33', 
    '건강 재능 기부함', DEFAULT, DEFAULT, 7000, 2, 1, 0, 0, 0, 01034567890, 'user33@naver.com',
    NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO CATEGORY_BOARD VALUES(4, 'user44', 4, '디자인 재능', 'user44', 
    '디자인 재능 기부함', DEFAULT, DEFAULT, 40000, 4, 1, 0, 0, 0, 01045678901, 'user44@hotmail.com',
    NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO CATEGORY_BOARD VALUES(5, 'user55', 5, '마케팅 재능', 'user55', 
    '마케팅 재능 기부함', DEFAULT, DEFAULT, 20000, 6, 1, 0, 0, 0, 01056789012, 'user55@naver.com',
    NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO CATEGORY_BOARD VALUES(6, 'user66', 6, '음악 재능', 'user66', 
    '음악 재능 기부함', DEFAULT, DEFAULT, 610000, 6, 1, 0, 0, 0, 01067890123, 'user66@naver.com',
    NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO CATEGORY_BOARD VALUES(7, 'user77', 7, '노하우/상담 재능', 'user77', 
    '노하우/상담 재능 기부함', DEFAULT, DEFAULT, 70000, 1, 1, 0, 0, 0, 01089012345, 'user77@naver.com',
    NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO CATEGORY_BOARD VALUES(8, 'user88', 8, '번역 재능', 'user88', 
    '번역 재능 기부함', DEFAULT, DEFAULT, 80000, 8, 1, 0, 0, 0, 01078901234, 'user88@naver.com',
    NULL, NULL, DEFAULT, DEFAULT);

    
-- 카테고리 분류 테이블
CREATE TABLE CATEGORY_GROUP(
    GROUP_NO NUMBER NOT NULL CONSTRAINT PK_NO PRIMARY KEY,
    GROUP_NAME VARCHAR2(50)
);

INSERT INTO CATEGORY_GROUP VALUES(1, 'IT');
INSERT INTO CATEGORY_GROUP VALUES(2, '디자인');
INSERT INTO CATEGORY_GROUP VALUES(3, '마케팅');
INSERT INTO CATEGORY_GROUP VALUES(4, '음악');
INSERT INTO CATEGORY_GROUP VALUES(5, '노하우/상담');
INSERT INTO CATEGORY_GROUP VALUES(6, '번역');
INSERT INTO CATEGORY_GROUP VALUES(7, '건강');
INSERT INTO CATEGORY_GROUP VALUES(8, '기타');

update category_board set original_image = 'images/img26.png' where category_no=2;
update category_board set original_image = 'images/default_board.png' where category_no=2;
update category_board set original_image = 'images/default_board.png' where category_no=3;
update category_board set original_image = 'images/default_board.png' where category_no=4;
update category_board set original_image = 'images/default_board.png' where category_no=5;
update category_board set original_image = 'images/default_board.png' where category_no=6;
update category_board set original_image = 'images/default_board.png' where category_no=7;
update category_board set original_image = 'images/default_board.png' where category_no=8;
update category_board set original_image = 'images/default_board.png' where category_no=9;
update category_board set original_image = 'images/default_board.png' where category_no=10;
commit;