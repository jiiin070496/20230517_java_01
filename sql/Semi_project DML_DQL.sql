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
insert into BOARD values (SEQ_BOARD_BNO.nextval, '파', '파닭각', 'jiin0960', default,  DEFAULT, NULL, NULL, SEQ_BOARD_BNO.nextval, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '고', '고기각', 'sony0316', default,  DEFAULT, NULL, NULL, SEQ_BOARD_BNO.nextval, 0, 0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배곺음', 'onue0608', default,  DEFAULT, NULL, NULL, SEQ_BOARD_BNO.nextval, 0, 0) ;
commit;

SELECT n.*, (SELECT mname FROM member m WHERE m.mid = n.mid) name FROM board n WHERE bno=1;


--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '첫글', '이랍니다.', default, 'jiin0960', SEQ_BOARD_BNO.nextval, 0,0) ;

