ALTER TABLE "BOARD_LIKE" DROP CONSTRAINT "FK_BOARD_TO_BOARD_LIKE_1";
ALTER TABLE "BOARD_LIKE" DROP CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1";
ALTER TABLE "BOARD" DROP CONSTRAINT "FK_MEMBER_TO_BOARD_1";
DROP TABLE "BOARD_LIKE";
DROP TABLE "REPLY";
--DROP TABLE "BOARD_REPLY";
DROP TABLE "BOARD";
DROP TABLE "MEMBER";
DROP SEQUENCE SEQ_BOARD_BNO;
DROP SEQUENCE SEQ_REPLY_REPLY_NO;

CREATE TABLE "MEMBER" (
	"MID"	VARCHAR2(20)		NOT NULL,
	"MPWD"	VARCHAR2(50)		NOT NULL,
	"MNAME"	VARCHAR2(50)		NOT NULL,
	"MEMAIL" VARCHAR2(150)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MID" IS '아이디';
COMMENT ON COLUMN "MEMBER"."MPWD" IS '패스워드';
COMMENT ON COLUMN "MEMBER"."MNAME" IS '이름';
COMMENT ON COLUMN "MEMBER"."MEMAIL" IS '이메일-회원가입,아이디,비밀번호찾기';

CREATE TABLE "BOARD" (
	"BNO"	    NUMBER		    NOT NULL,
	"BTITLE"	VARCHAR2(300)	NOT NULL,
	"BCONTENT"	CLOB		    NOT NULL,
    "MID"	    VARCHAR2(20)	NOT NULL,
	"BWRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
    "READCNT"   NUMBER          DEFAULT 0,
	"REF"	   NUMBER DEFAULT 0 NULL,
	"RSTEP"	   NUMBER DEFAULT 0 NULL,
    "RLEVEL"   NUMBER DEFAULT 0 NULL,
    "LIKEHIT"  NUMBER
);
ALTER TABLE BOARD ADD LIKEHIT NUMBER DEFAULT 0 NULL;
ALTER TABLE BOARD ADD SELECT_REPLY_NO NUMBER DEFAULT 0 NULL;
CREATE SEQUENCE SEQ_BOARD_BNO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

COMMENT ON COLUMN "BOARD"."BNO" IS 'SEQ_BOARD_BNO 사용';
COMMENT ON COLUMN "BOARD"."BTITLE" IS '제목';
COMMENT ON COLUMN "BOARD"."BCONTENT" IS '글내용';
COMMENT ON COLUMN "BOARD"."MID" IS '작성자';
COMMENT ON COLUMN "BOARD"."BWRITE_DATE" IS '작성시간';
COMMENT ON COLUMN "BOARD"."READCNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."REF" IS 'BNO=BREF:원본글, BNO<>BREF:답..글';
COMMENT ON COLUMN "BOARD"."RSTEP" IS '0:원본글, 1-N 원본글기준답..글들의순서';
COMMENT ON COLUMN "BOARD"."RLEVEL" IS '0:원본글, 1:답글, 2:답답글...';

CREATE TABLE "REPLY" (
	"REPLY_NO"	    NUMBER		    NOT NULL,
	"MEMBER_ID"	    VARCHAR(20)		NOT NULL,
    "REPLY_CONTENT"	CLOB		    NOT NULL,
    "REPLY_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
    "BOARD_NO"	    NUMBER		    NOT NULL,
    "RREF"	   NUMBER DEFAULT 0 NULL,
	"RSTEP"	   NUMBER DEFAULT 0 NULL,
	"RLEVEL"   NUMBER DEFAULT 0 NULL
);
CREATE SEQUENCE SEQ_REPLY_REPLY_NO
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

CREATE TABLE "BOARD_LIKE" (
	"LIKE_NO"	NUMBER,
	"MID"	VARCHAR2(20)	NOT NULL,
    "BNO"	    NUMBER		NOT NULL,
    "LIKECHECK" NUMBER
);

--------- MEMBER --------
ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MID"
);

--------- BOARD --------
ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BNO"
);
ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MID"
)
REFERENCES "MEMBER" (
	"MID"
);

--------- REPLY ---------
ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);
ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY (
	"MEMBER_ID"
)
REFERENCES "MEMBER" (
	"MID"
);
ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARDS_TO_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BNO"
)
ON DELETE CASCADE;

--------- LIKE ---------
ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "PK_BOARD_LIKE" PRIMARY KEY (
	"LIKE_NO"
);
ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_BOARD_TO_BOARD_LIKE_1"
FOREIGN KEY ("BNO")
REFERENCES "BOARD" ("BNO")
ON DELETE CASCADE;
ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1"
FOREIGN KEY ("MID")
REFERENCES "MEMBER" ("MID")
ON DELETE CASCADE;

commit;