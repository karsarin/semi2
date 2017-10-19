CREATE TABLE CATEGORY_BOARD(
    CATEGORY_NO NUMBER CONSTRAINT PK_CATEGORY PRIMARY KEY,
    USER_ID VARCHAR2(15) NOT NULL,
    CATEGORY_GROUP NUMBER NOT NULL,
    CATEGORY_TITLE VARCHAR2(50) NOT NULL,
    CATEGORY_WRITER VARCHAR2(15) NOT NULL,
    CATEGORY_CONTENT VARCHAR2(2000) NOT NULL,
    CATEGORY_DATE DATE DEFAULT SYSDATE,
    CATEGORY_READCOUNT NUMBER DEFAULT 0,
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