drop table member cascade constraints;

CREATE TABLE MEMBER(
  MEMBER_ID VARCHAR2(15) PRIMARY KEY,
  MEMBER_PWD VARCHAR2(20)NOT NULL,
  MEMBER_NAME VARCHAR2(50) NOT NULL,
  MEMBER_NO VARCHAR2(13) NOT NULL
  CONSTRAINT MEMBER_NO_UK UNIQUE,
  MEMBER_NIK VARCHAR2(20) NOT NULL
  CONSTRAINT MEMBER_NIK_UK UNIQUE,
  MEMBER_ADDRESS VARCHAR2(255) NOT NULL,
  MEMBER_EMAIL VARCHAR2(255) NOT NULL
  CONSTRAINT MEMBER_EMAIL_UK UNIQUE,
  MEMBER_PHONE VARCHAR2(30) NOT NULL
  CONSTRAINT MEMBER_PHONE_UK UNIQUE,
  SIGNUP_DATE DATE DEFAULT SYSDATE NOT NULL,
  CONNECTION CHAR(1) default 'Y' CHECK(CONNECTION IN('Y','N')) NOT NULL,
  talent varchar2(30),
  manager_chatting char(1) default 'Y' check(manager_chatting in ('Y','N')) not null,
  manager_login char(1) default 'Y' check(manager_login in ('Y','N')) not null
);
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '이름';
COMMENT ON COLUMN MEMBER.MEMBER_NO IS '주민번호';
COMMENT ON COLUMN MEMBER.MEMBER_NIK IS '닉네임';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.SIGNUP_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.CONNECTION IS '접속여부';
COMMENT ON COLUMN MEMBER.talent IS '재능';
COMMENT ON COLUMN MEMBER.manager_chatting IS '채팅가능여부';
COMMENT ON COLUMN MEMBER.manager_login IS '접속가능여부';

INSERT INTO MEMBER VALUES (
  'user11', 'pass11', '유저1', '9001011122334', '유저_1', 
  '서울시 강남구 역삼동', 'user11@iei.org', '01012345678',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user22', 'pass22', '유저2', '9101011122334', '유저_2', 
  '서울시 강남구 역삼동', 'user22@iei.org', '01012345679',
  DEFAULT, 'N', '컨설팅', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user33', 'pass33', '유저3', '9301011122334', '유저_3', 
  '서울시 강남구 역삼동', 'user33@iei.org', '01012345688',
  DEFAULT, 'N', '디자인,프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user44', 'pass44', '유저4', '9401011122334', '유저_4', 
  '서울시 강남구 역삼동', 'user44@iei.org', '01022345678',
  DEFAULT, 'N', '통역,번역', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user55', 'pass55', '유저5', '9501011122334', '유저_5', 
  '서울시 강남구 역삼동', 'user55@iei.org', '01012348678',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user66', 'pass66', '유저6', '9601011122334', '유저_6', 
  '서울시 강남구 역삼동', 'user66@iei.org', '01012645678',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user77', 'pass77', '유저7', '9701011122334', '유저_7', 
  '서울시 강남구 역삼동', 'user77@iei.org', '01012345778',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user88', 'pass88', '유저8', '8801011122334', '유저_8', 
  '서울시 강남구 역삼동', 'user88@iei.org', '01088345778',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user99', 'pass99', '유저99', '8901011122334', '유저_9', 
  '서울시 강남구 역삼동', 'user99@iei.org', '01012995778',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);
INSERT INTO MEMBER VALUES (
  'user10', 'pass10', '유저10', '8401011122334', '유저_10', 
  '서울시 강남구 역삼동', 'user10@iei.org', '01011045778',
  DEFAULT, 'N', '프로그래밍', DEFAULT, DEFAULT
);

INSERT INTO MEMBER VALUES (
  'admin', 'admin', '관리자', '9510102222222', '관리자', 
  '서울시 강남구 역삼동', 'admin@iei.org', '01044444444',
  DEFAULT, 'N', '관리자', DEFAULT, DEFAULT
);
COMMIT;

