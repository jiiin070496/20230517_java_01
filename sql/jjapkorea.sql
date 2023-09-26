
select * from board;

DROP TABLE "BOARD";
DROP SEQUENCE SEQ_BOARD_BNO;

CREATE SEQUENCE SEQ_BOARD_BNO;
ALTER SEQUENCE SEQ_BOARD_BNO INCREMENT BY 1;

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

COMMENT ON COLUMN "BOARD"."BNO" IS 'SEQ_BOARD_BNO 사용';
COMMENT ON COLUMN "BOARD"."BTITLE" IS '제목';
COMMENT ON COLUMN "BOARD"."BCONTENT" IS '글내용';
COMMENT ON COLUMN "BOARD"."MID" IS '작성자';
COMMENT ON COLUMN "BOARD"."BWRITE_DATE" IS '작성시간';
COMMENT ON COLUMN "BOARD"."REF" IS 'BNO=BREF:원본글, BNO<>BREF:답..글';
COMMENT ON COLUMN "BOARD"."RSTEP" IS '0:원본글, 1-N 원본글기준답..글들의순서';
COMMENT ON COLUMN "BOARD"."RLEVEL" IS '0:원본글, 1:답글, 2:답답글...';

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BNO"
);
ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MID"
)
REFERENCES "MEMBER" (
	"MID"
);

insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배곺음', 'admin', default,  DEFAULT, NULL, NULL, SEQ_BOARD_BNO.nextval, 0, 0) ;
commit;

--SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
--FROM USER_CONSTRAINTS
--WHERE TABLE_NAME = 'MEMBER';