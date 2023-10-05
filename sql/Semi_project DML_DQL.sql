UPDATE board SET BRE_STEP = BRE_STEP + 1
WHERE BREF = 1 AND BRE_STEP > 0;
select BNO from BOARD;
select * from board_like where bno = 3;
select like_no from board_like where bno = 3 and mid = 'jiin0960';
desc board;
select * from reply where board_no=3 order by reply_no desc;

SELECT *
FROM 
( SELECT a.*, ROWNUM AS rnum
    FROM ( SELECT * FROM board ORDER BY bno DESC) a
)
WHERE rnum BETWEEN 1 AND 10;

insert into MEMBER values ('jiin0960', '0960','jin', 'a1@gmail.com');
insert into MEMBER values ('sony0316', '0316','soni', 'a2@gmail.com');
insert into MEMBER values ('onue0608', '0608','nue', 'a3@gmail.com');
insert into BOARD values (SEQ_BOARD_BNO.nextval, '파', '후우루룽', 'jiin0960', default, 0, SEQ_BOARD_BNO.nextval, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '고', '고ㅁㅁㅁㅁㅁ', 'sony0316', default, 0, SEQ_BOARD_BNO.nextval, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배곺음', 'onue0608', default, 0, SEQ_BOARD_BNO.nextval, 0, 0) ;
COMMIT;

insert into board_like ("LIKE_NO", "BNO", "MID", "BOARD_LIKE", "LIKE_TYPE")
values ((select nvl(max(like_no), 0) + 1 from board_like), 3, 'jiin0960', 1, 1);
DELETE FROM board where btitle = '몽';
DELETE FROM member where mid = 'admin12';

update board set btitle = '몽', bcontent = '총이' where bno = 23;


INSERT INTO board_like VALUES ((SELECT NVL(MAX(like_no), 0) + 1 as like_no FROM board_like), 'jiin0960', 3);

--원본글

insert into BOARD (
    "BNO", "BTITLE", "BCONTENT", "MID", "BWRITE_DATE", "READCNT", "REF", "RSTEP", "RLEVEL"
) values (
    SEQ_BOARD_BNO.nextval, '등갈비?', '굿ㅋㅋ', 'sony0316', systimestamp, 0,
    (select ref from board where bno=1),
    (select rstep + 1 from board where bno=1),
    (select rlevel + 1 from board where bno=1)
);
commit;

SELECT A.SID
     , A.SERIAL#
     , A.STATUS
  FROM V$SESSION A
     , V$LOCK B
     , DBA_OBJECTS C
 WHERE A.SID         = B.SID
   AND B.ID1         = C.OBJECT_ID
   AND B.TYPE        = 'TM'
   AND C.OBJECT_NAME = 'COMMENT';

