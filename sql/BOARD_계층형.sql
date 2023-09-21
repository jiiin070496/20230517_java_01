--DROP TABLE "ATTACH_FILE";
DROP TABLE "BOARD_READ_RECORD";
DROP TABLE "BOARD_REPLY";
DROP TABLE "BOARD";
DROP TABLE "MEMBER";
DROP SEQUENCE SEQ_BOARD_BNO;
DROP SEQUENCE SEQ_BOARD_RNO;


CREATE SEQUENCE SEQ_BOARD_BNO;
--CREATE SEQUENCE SEQ_BOARD_RNO;

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
    "FILENAME"  VARCHAR2(300),
    "FILEPATH"  VARCHAR2(300),
	"REF"	    NUMBER		    NOT NULL,
	"RSTEP"	NUMBER		    NOT NULL,
    "RLEVEL"	NUMBER		    NOT NULL	
);
--ALTER TABLE BOARD
--ADD(REF NUMBER, RSTEP NUMBER DEFAULT 0, RLEVEL NUMBER DEFAULT 0);

UPDATE BOARD SET REF = BNO;
ALTER TRIGGER TRG_BOARD DISABLE;

COMMENT ON COLUMN "BOARD"."BNO" IS 'SEQ_BOARD_BNO 사용';
COMMENT ON COLUMN "BOARD"."BTITLE" IS '제목';
COMMENT ON COLUMN "BOARD"."BCONTENT" IS '글내용';
COMMENT ON COLUMN "BOARD"."MID" IS '작성자';
COMMENT ON COLUMN "BOARD"."BWRITE_DATE" IS '작성시간';
COMMENT ON COLUMN "BOARD"."REF" IS 'BNO=BREF:원본글, BNO<>BREF:답..글';
COMMENT ON COLUMN "BOARD"."RSTEP" IS '0:원본글, 1-N 원본글기준답..글들의순서';
COMMENT ON COLUMN "BOARD"."RLEVEL" IS '0:원본글, 1:답글, 2:답답글...';

--CREATE TABLE "BOARD_REPLY" (
--    "RNO"       NUMBER    NOT NULL,
--    "BRE"       NUMBER    NULL,
--    "BNO"       NUMBER    NOT NULL,
--    "RCONTENT"  VARCHAR2(3000) NOT NULL,
--    "RDATE"     TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
--    "BREL"      NUMBER    NOT NULL,
--    "BRES"      NUMBER    NOT NULL,
--    "MID"       VARCHAR2(20) NOT NULL
--);
CREATE TABLE "BOARD_REPLY" (
    "RNO"       NUMBER    NOT NULL,
    "BNO"       NUMBER    NOT NULL,
    "PNO"       NUMBER    NOT NULL,
    "DEPTH"     NUMBER    NOT NULL,
    "RCONTENT"  CLOB,
    "MID"       VARCHAR2(20)    NOT NULL,
    "RDATE"     TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL
);

COMMENT ON COLUMN "BOARD_REPLY"."RNO" IS '댓글번호, SEQ_BOARD_RNO 사용';
COMMENT ON COLUMN "BOARD_REPLY"."BNO" IS '원본 글 번호';
COMMENT ON COLUMN "BOARD_REPLY"."PNO" IS '부모 글 번호';
COMMENT ON COLUMN "BOARD_REPLY"."DEPTH" IS '글 깊이';
COMMENT ON COLUMN "BOARD_REPLY"."RCONTENT" IS '댓글 내용';
COMMENT ON COLUMN "BOARD_REPLY"."MID" IS '사용자 ID';
COMMENT ON COLUMN "BOARD_REPLY"."RDATE" IS '작성시간';

CREATE TABLE "BOARD_READ_RECORD" (
	"BNO"	NUMBER		NOT NULL,
	"MID"	VARCHAR2(20)		NOT NULL,
	"READ_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
);

COMMENT ON COLUMN "BOARD_READ_RECORD"."BNO" IS 'SEQ_BOARD_BNO 사용';
COMMENT ON COLUMN "BOARD_READ_RECORD"."MID" IS '조회한사람';
COMMENT ON COLUMN "BOARD_READ_RECORD"."READ_DATE" IS '조회시간';



-----------------------------------
ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "PK_BOARD_REPLY" PRIMARY KEY (
	"RNO",
	"BNO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BNO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MID"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MID"
)
REFERENCES "MEMBER" (
	"MID"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_BOARD_TO_BOARD_REPLY_1" FOREIGN KEY (
	"BNO"
)
REFERENCES "BOARD" (
	"BNO"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_REPLY_1" FOREIGN KEY (
	"MID"
)
REFERENCES "MEMBER" (
	"MID"
);
