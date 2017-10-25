DROP TABLE NOTICE CASCADE CONSTRAINTS;

CREATE TABLE NOTICE(
  NOTICE_NO NUMBER,
  NOTICE_TITLE VARCHAR2(50) NOT NULL,
  NOTICE_WRITER VARCHAR2(15) NOT NULL,
  NOTICE_CONTENT LONG, 
  NOTICE_DATE DATE DEFAULT SYSDATE,
  ORIGINAL_FILENAME VARCHAR2(100),
  RENAME_FILENAME VARCHAR2(100),
  READ_COUNT NUMBER DEFAULT 0,
  CONSTRAINT PK_NOTICENO PRIMARY KEY(NOTICE_NO),
  CONSTRAINT FK_NOTICEWR FOREIGN KEY(NOTICE_WRITER) REFERENCES MEMBER(MEMBER_ID) 
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지글번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지글제목';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '공지글작성자아이디';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지글내용';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '공지글올린날짜';
COMMENT ON COLUMN NOTICE.ORIGINAL_FILENAME IS '원래첨부파일명';
COMMENT ON COLUMN NOTICE.RENAME_FILENAME IS '바뀐첨부파일명';
COMMENT ON COLUMN NOTICE.READ_COUNT IS '조회수';

--------------------- 샘플 데이터 -------------------------------
INSERT INTO NOTICE VALUES(1, '다재다능 공지글1', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(2, '다재다능 공지글2', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(3, '다재다능 공지글3', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(4, '다재다능 공지글4', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(5, '다재다능 공지글5', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(6, '다재다능 공지글6', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(7, '다재다능 공지글7', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(8, '다재다능 공지글8', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(9, '다재다능 공지글9', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(10, '다재다능 공지글10', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(11, '다재다능 공지글11', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(12, '다재다능 공지글12', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(13, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(14, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(15, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO NOTICE VALUES(16, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(17, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(18, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(19, 'search 확인용', 'user11', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO NOTICE VALUES(20, 'search 확인용', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);

COMMIT;