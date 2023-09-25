UPDATE board SET BRE_STEP = BRE_STEP + 1
WHERE BREF = 1 AND BRE_STEP > 0;
select * from member;
select * from board;
DESC BOARD_REPLY;

desc board;

commit;

insert into MEMBER values ('jiin0960', '0960','jin', 'a1@gmail.com');
insert into MEMBER values ('sony0316', '0316','soni', 'a2@gmail.com');
insert into MEMBER values ('onue0608', '0608','nue', 'a3@gmail.com');

DELETE FROM board where btitle = '몽';
DELETE FROM member where mid = 'admin12';

update board set btitle = '몽', bcontent = '총이' where bno = 23;

--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '파', '파닭각', 'jiin0960', default, 0, SEQ_BOARD_BNO.nextval, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '고', '고기각', 'sony0316', default, 0, SEQ_BOARD_BNO.nextval, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배곺음', 'onue0608', default, 0, SEQ_BOARD_BNO.nextval, 0, 0) ;

insert into BOARD (
    "BNO", "BTITLE", "BCONTENT", "MID", "BWRITE_DATE", "READCNT", "FILENAME", "FILEPATH", "REF", "RSTEP", "RLEVEL"
) values (
    SEQ_BOARD_BNO.nextval, '등갈비?', '굿ㅋㅋ', 'sony0316', systimestamp, 0, NULL, NULL,
    (select ref from board where bno=1),
    (select rstep + 1 from board where bno=1),
    (select rlevel + 1 from board where bno=1)
);
commit;


-- DECLARE
--   ref_param NUMBER := :ref;
--   rstep_param NUMBER := :rstep;
-- BEGIN
--   UPDATE board SET rstep = rstep + 1
--   WHERE ref = ref_param AND rstep > rstep_param;

--   INSERT INTO board ("BNO", "BTITLE", "BCONTENT", "MID", "BWRITE_DATE", "READCNT", "FILENAME", "FILEPATH", "REF", "RSTEP", "RLEVEL")
--   VALUES (SEQ_BOARD_BNO.nextval, '족', '발각이네?ㅋㅋ', 'sony0316', systimestamp, 0, NULL, NULL,
--           ref_param, rstep_param + 1, :rlevel + 1);
  
--   COMMIT;
-- END;

select ref from board where bno=3;
SELECT n.*, (SELECT mid FROM member m WHERE m.mid = n.mid) name FROM board n WHERE bno=1;


--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '첫글', '이랍니다.', default, 'jiin0960', SEQ_BOARD_BNO.nextval, 0,0) ;

