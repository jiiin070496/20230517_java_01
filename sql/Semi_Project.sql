DROP TABLE "BOARD_READ_RECORD";
DROP TABLE "BOARD";
DROP TABLE "MEMBER";
DROP SEQUENCE SEQ_BOARD_IDX;

CREATE SEQUENCE SEQ_BOARD_IDX; 
CREATE TABLE "MEMBER" (
	"MID"	VARCHAR2(20)	NOT NULL,
	"MPWD"	VARCHAR2(30)	NOT NULL,
	"MNAME"	VARCHAR2(50)	NOT NULL,
    "MEMAIL" VARCHAR2(150)	NOT NULL
);
COMMENT ON COLUMN "MEMBER"."MID" IS '아이디';
COMMENT ON COLUMN "MEMBER"."MPWD" IS '패스워드';
COMMENT ON COLUMN "MEMBER"."MNAME" IS '이름';
COMMENT ON COLUMN "MEMBER"."MEMAIL" IS '이메일';


CREATE TABLE "BOARD" (
    "IDX" NUMBER NOT NULL,
    "TITLE" VARCHAR2(300) NOT NULL,
    "CONTENT" VARCHAR2(4000) NULL,
    "WRITE_DATE" TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    "MID" VARCHAR2(20),
    "BREF" NUMBER NOT NULL,
    "BRE_LEVEL" NUMBER NOT NULL,
    "BRE_STEP" NUMBER NOT NULL -- 수정: 닫는 괄호 추가
);
COMMENT ON COLUMN "BOARD"."IDX" IS 'SEQ_BOARD_BNO 사용';
COMMENT ON COLUMN "BOARD"."TITLE" IS '제목';
COMMENT ON COLUMN "BOARD"."CONTENT" IS '글내용';
COMMENT ON COLUMN "BOARD"."WRITE_DATE" IS '작성시간';
COMMENT ON COLUMN "BOARD"."MID" IS '작성자';
COMMENT ON COLUMN "BOARD"."BREF" IS 'BNO=BREF:원본글, BNO<>BREF:답..글';
COMMENT ON COLUMN "BOARD"."BRE_LEVEL" IS '0:원본글, 1:답글, 2:답답글...';
COMMENT ON COLUMN "BOARD"."BRE_STEP" IS '0:원본글, 1-N 원본글기준답..글들의순서';



CREATE TABLE "BOARD_READ_RECORD" (
	"IDX"	NUMBER	NOT NULL,
	"MID"	VARCHAR2(20) NOT NULL,
	"READ_DATE"	TIMESTAMP	NOT NULL
);
COMMENT ON COLUMN "BOARD_READ_RECORD"."IDX" IS 'SEQ_BOARD_BNO 사용';
COMMENT ON COLUMN "BOARD_READ_RECORD"."MID" IS '조회한사람';
COMMENT ON COLUMN "BOARD_READ_RECORD"."READ_DATE" IS '조회시간';


ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"IDX"
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

ALTER TABLE "BOARD_READ_RECORD" ADD CONSTRAINT "FK_BOARD_TO_BOARD_READ_RECORD_1" FOREIGN KEY (
	"IDX"
)
REFERENCES "BOARD" (
	"IDX"
);

ALTER TABLE "BOARD_READ_RECORD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_READ_RECORD_1" FOREIGN KEY (
	"MID"
)
REFERENCES "MEMBER" (
	"MID"
);

