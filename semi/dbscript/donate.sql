<<<<<<< HEAD
CREATE TABLE DONATE(
  DONATION_NO VARCHAR2(13) PRIMARY KEY,
  MEMBER_ID VARCHAR2(15) NOT NULL,
  DONATION NUMBER NOT NULL,
  DONATION_DATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE DONATE
ADD CONSTRAINT FK_MEMBER_ID FOREIGN KEY(MEMBER_ID)
REFERENCES MEMBER(MEMBER_ID);

COMMENT ON COLUMN DONATE.DONATION_NO IS '기부 번호';
COMMENT ON COLUMN DONATE.MEMBER_ID IS '아이디';
COMMENT ON COLUMN DONATE.DONATION IS '기부금';
COMMENT ON COLUMN DONATE.DONATION_DATE IS '기부일자';
=======
DROP TABLE DONATE CASCADE CONSTRAINTS;

CREATE TABLE DONATE(
  DONATION_NO VARCHAR2(13) PRIMARY KEY,
  MEMBER_ID VARCHAR2(15) NOT NULL,
  DONATION NUMBER NOT NULL,
  DONATION_DATE DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE DONATE
ADD CONSTRAINT FK_MEMBER_ID FOREIGN KEY(MEMBER_ID)
REFERENCES MEMBER(MEMBER_ID);

COMMENT ON COLUMN DONATE.DONATION_NO IS '기부 번호';
COMMENT ON COLUMN DONATE.MEMBER_ID IS '아이디';
COMMENT ON COLUMN DONATE.DONATION IS '기부금';
COMMENT ON COLUMN DONATE.DONATION_DATE IS '기부일자';

--------------------- 샘플 데이터 -------------------------------
>>>>>>> refs/remotes/origin/yunJisun
