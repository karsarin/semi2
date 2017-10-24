DROP TABLE REPLYBOARD CASCADE CONSTRAINTS;

CREATE TABLE REPLYBOARD(
  REPLYBOARD_NO NUMBER,
  REPLYBOARD_TITLE VARCHAR2(50) NOT NULL,
  REPLYBOARD_WRITER VARCHAR2(15) NOT NULL,
  REPLYBOARD_CONTENT LONG, 
  REPLYBOARD_DATE DATE DEFAULT SYSDATE,
  ORIGINAL_FILENAME VARCHAR2(100),
  RENAME_FILENAME VARCHAR2(100),
  READ_COUNT NUMBER DEFAULT 0,
  CONSTRAINT PK_REPLYBOARDNO PRIMARY KEY(REPLYBOARD_NO),
  CONSTRAINT FK_REPLYBOARDWR FOREIGN KEY(REPLYBOARD_WRITER) REFERENCES MEMBER(MEMBER_ID) 
);


COMMENT ON COLUMN REPLYBOARD.REPLYBOARD_NO IS '후기게시글번호';
COMMENT ON COLUMN REPLYBOARD.REPLYBOARD_TITLE IS '후기게시글제목';
COMMENT ON COLUMN REPLYBOARD.REPLYBOARD_WRITER IS '후기게시글작성자아이디';
COMMENT ON COLUMN REPLYBOARD.REPLYBOARD_CONTENT IS '후기게시글내용';
COMMENT ON COLUMN REPLYBOARD.REPLYBOARD_DATE IS '후기게시글올린날짜';
COMMENT ON COLUMN REPLYBOARD.ORIGINAL_FILENAME IS '원래첨부파일명';
COMMENT ON COLUMN REPLYBOARD.RENAME_FILENAME IS '바뀐첨부파일명';
COMMENT ON COLUMN REPLYBOARD.READ_COUNT IS '조회수';



INSERT INTO REPLYBOARD VALUES(1, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(2, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(3, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(4, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(5, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(6, '다재다능 후기게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(7, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(8, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(9, '다재다능 후기게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(10, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(11, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(12, '다재다능 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(13, 'search 후기게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(14, 'search 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(15, 'search 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT );
INSERT INTO REPLYBOARD VALUES(16, 'search 후기게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(17, 'search 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(18, 'search 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(19, 'search 후기게시판1', 'cajulove', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);
INSERT INTO REPLYBOARD VALUES(20, 'search 후기게시판1', 'admin', '다재다능 서비스가 개시되었습니다. 많이 이용해주세요.' ,DEFAULT, NULL, NULL, DEFAULT);



COMMIT;
