UPDATE board SET BRE_STEP = BRE_STEP + 1
WHERE BREF = 1 AND BRE_STEP > 0;
select LIKEHIT from BOARD;
select * from board_like;
select LIKECHECK from board_like where bno = 3 and mid = 'onue0608';
update board set LIKEHIT= 99
		where BNO = 63;
desc board;
select * from board where bno=119;
	
update board_like set likecheck = 0
where BNO = 7 and mid = 'jiin0960';

select * from member;
select * from business;
insert into business values ('jiin', 3, default, '(주)쿵쓰참치', '경기도 성남시 분당구 정자일로 95', '쿵쓰', '01098745612', default, default, default, default, default, default, default, '쿵쓰', default, default, default, default);
select * from member where mid='jiin';
insert into MEMBER values ('jiin', 'jin', 'ROLE_BUSINESS', default, default, default, default);
commit;
SELECT *
FROM 
( SELECT a.*, ROWNUM AS rnum
    FROM ( SELECT * FROM board ORDER BY bno DESC) a
)
WHERE rnum BETWEEN 1 AND 10;

insert into MEMBER values ('jiin0960', '0960','jin', 'a1@gmail.com');
insert into MEMBER values ('sony0316', '0316','soni', 'a2@gmail.com');
insert into MEMBER values ('onue0608', '0608','nue', 'a3@gmail.com');
insert into BOARD values (SEQ_BOARD_BNO.nextval, '뭐시', '뭐시중헌디', 'jiin0960', default, 0, SEQ_BOARD_BNO.nextval, 0, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '뭔데', '뭐시 문젠디', 'sony0316', default, 0, SEQ_BOARD_BNO.nextval, 0, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '뭐', '뭐시', 'onue0608', default, 0, SEQ_BOARD_BNO.nextval, 0, 0, 0) ;
COMMIT;

insert into BOARD values (SEQ_BOARD_BNO.nextval, '뭐시', '뭐시중헌디', 'admin', default, 0, SEQ_BOARD_BNO.nextval, 0, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '뭔데', '뭐시문젠디', 'admin', default, 0, SEQ_BOARD_BNO.nextval, 0, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '뭐', '뭐시', 'admin', default, 0, SEQ_BOARD_BNO.nextval, 0, 0, 0) ;
COMMIT;

insert into board_like ("LIKE_NO", "BNO", "MID", "BOARD_LIKE", "LIKE_TYPE")
values ((select nvl(max(like_no), 0) + 1 from board_like), 3, 'jiin0960', 1, 1);
DELETE FROM board where btitle = '紐�';
DELETE FROM member where mid = 'admin12';

update board set btitle = '紐�', bcontent = '珥앹씠' where bno = 23;


INSERT INTO board_like VALUES ((SELECT NVL(MAX(like_no), 0) + 1 as like_no FROM board_like), 'jiin0960', 63, 30);

--�썝蹂멸�

insert into BOARD (
    "BNO", "BTITLE", "BCONTENT", "MID", "BWRITE_DATE", "READCNT", "REF", "RSTEP", "RLEVEL"
) values (
    SEQ_BOARD_BNO.nextval, '�벑媛덈퉬?', '援욍뀑�뀑', 'sony0316', systimestamp, 0,
    (select ref from board where bno=1),
    (select rstep + 1 from board where bno=1),
    (select rlevel + 1 from board where bno=1)
);
commit;


                                    
