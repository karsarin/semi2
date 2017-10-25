--��� �Խ��ǿ� db script file
DROP TABLE question;


create table question(
question_num number,--�Խñ� ��ȣ
question_title varchar2(50) NOT NULL,--�Խñ� ����
question_writer varchar2(15) NOT NULL,--�Խñ� �ۼ���
question_content varchar2(2000) NOT NULL,--�Խñ� ����
question_original_filename varchar2(100),--���ε��� ���� ���ϸ�
question_rename_filename varchar2(100),--���ε��� �ٲ� ���ϸ�
question_date date DEFAULT SYSDATE,--�Խñ� �ø� ��¥
question_readcount number DEFAULT 0,--��ȸ��
question_level number DEFAULT 0,--�۷��� : ����-0,�����Ǵ��-1,����Ǵ��-2
question_ref number,--�������۹�ȣ : ������ ���� �ڱ��ȣ,����� ���� ���۹�ȣ
question_reply_ref number,--������۹�ȣ : ������ ���� 0,1�̸� �ڱ��ȣ, ������ 2�̸� �����ϴ� ��۹�ȣ
question_reply_seq number DEFAULT 0,--��� ����
CONSTRAINT PK_question PRIMARY KEY (question_NUM),
CONSTRAINT FK_question_WR FOREIGN KEY (question_WRITER) REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL,
CONSTRAINT FK_question_REF FOREIGN KEY (question_REF) REFERENCES question (question_NUM) ON DELETE CASCADE,
CONSTRAINT FK_question_REPLY_REF FOREIGN KEY (question_REPLY_REF) REFERENCES question (question_NUM) ON DELETE CASCADE
);

COMMENT ON COLUMN question.question_NUM IS '�Խñ۹�ȣ';
COMMENT ON COLUMN question.question_WRITER IS '�Խñ��ۼ��� ���̵�';
COMMENT ON COLUMN question.question_TITLE IS '�Խñ�����';
COMMENT ON COLUMN question.question_CONTENT IS '�Խñ۳���';
COMMENT ON COLUMN question.question_DATE IS '�Խñۿø���¥';
COMMENT ON COLUMN question.question_ORIGINAL_FILENAME IS '÷�����Ͽ����̸�';
COMMENT ON COLUMN question.question_RENAME_FILENAME IS '÷�����Ϻ����̸�';
COMMENT ON COLUMN question.question_LEVEL IS '�Խñ۷���';
COMMENT ON COLUMN question.question_REF IS '�������۹�ȣ';
COMMENT ON COLUMN question.question_REPLY_REF IS '������۹�ȣ';
COMMENT ON COLUMN question.question_REPLY_SEQ IS '��ۼ���';
COMMENT ON COLUMN question.question_READCOUNT IS '��ȸ��';

INSERT INTO question VALUES(1,'게시글1','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,1,NULL,0);
INSERT INTO question VALUES(2,'게시글2','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,2,NULL,0);
INSERT INTO question VALUES(3,'게시글3','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,3,NULL,0);
INSERT INTO question VALUES(4,'게시글4','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,4,NULL,0);
INSERT INTO question VALUES(5,'게시글5','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,5,NULL,0);
INSERT INTO question VALUES(6,'게시글6','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,6,NULL,0);
INSERT INTO question VALUES(7,'게시글7','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,7,NULL,0);
INSERT INTO question VALUES(8,'게시글8','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,8,NULL,0);
INSERT INTO question VALUES(9,'게시글9','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,9,NULL,0);
INSERT INTO question VALUES(10,'게시글10','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,10,NULL,0);
INSERT INTO question VALUES(11,'게시글11','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,11,NULL,0);
INSERT INTO question VALUES(12,'게시글12','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,12,NULL,0);
INSERT INTO question VALUES(13,'게시글13','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,13,NULL,0);
INSERT INTO question VALUES(14,'게시글14','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,14,NULL,0);
INSERT INTO question VALUES(15,'게시글15','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,15,NULL,0);
INSERT INTO question VALUES(16,'게시글16','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,16,NULL,0);
INSERT INTO question VALUES(17,'게시글17','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,17,NULL,0);
INSERT INTO question VALUES(18,'게시글18','admin','본문 내용입니다',NULL,NULL,SYSDATE,0,0,18,NULL,0);
INSERT INTO question VALUES(19,'게시글19','cajulove','본문 내용입니다',NULL,NULL,SYSDATE,0,0,19,NULL,0);


commit;
