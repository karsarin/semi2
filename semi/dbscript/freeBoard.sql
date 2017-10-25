DROP TABLE FREEBOARD CASCADE CONSTRAINTS;

CREATE TABLE FREEBOARD(
  FREEBOARD_NO NUMBER,
  FREEBOARD_TITLE VARCHAR2(50) NOT NULL,
  FREEBOARD_WRITER VARCHAR2(15) NOT NULL,
  FREEBOARD_CONTENT LONG, 
  FREEBOARD_DATE DATE DEFAULT SYSDATE,
  ORIGINAL_FILENAME VARCHAR2(100),
  RENAME_FILENAME VARCHAR2(100),
  READ_COUNT NUMBER DEFAULT 0,
  CONSTRAINT PK_FREEBOARDNO PRIMARY KEY(FREEBOARD_NO),
  CONSTRAINT FK_FREEBOARDWR FOREIGN KEY(FREEBOARD_WRITER) REFERENCES MEMBER(MEMBER_ID) 
);


COMMENT ON COLUMN FREEBOARD.FREEBOARD_NO IS '게시글번호';
COMMENT ON COLUMN FREEBOARD.FREEBOARD_TITLE IS '게시글제목';
COMMENT ON COLUMN FREEBOARD.FREEBOARD_WRITER IS '게시글작성자아이디';
COMMENT ON COLUMN FREEBOARD.FREEBOARD_CONTENT IS '게시글내용';
COMMENT ON COLUMN FREEBOARD.FREEBOARD_DATE IS '게시글올린날짜';
COMMENT ON COLUMN FREEBOARD.ORIGINAL_FILENAME IS '원래첨부파일명';
COMMENT ON COLUMN FREEBOARD.RENAME_FILENAME IS '바뀐첨부파일명';
COMMENT ON COLUMN FREEBOARD.READ_COUNT IS '조회수';



INSERT INTO FREEBOARD VALUES(1, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(2, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(3, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(4, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(5, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(6, '다재다능 자유게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(7, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(8, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(9, '다재다능 자유게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(10, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(11, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(12, '다재다능 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(13, 'search 자유게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(14, 'search 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(15, 'search 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO FREEBOARD VALUES(16, 'search 자유게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(17, 'search 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(18, 'search 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(19, 'search 자유게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO FREEBOARD VALUES(20, 'search 자유게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);



COMMIT;
