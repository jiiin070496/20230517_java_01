
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
insert into BOARD values (SEQ_BOARD_BNO.nextval, '파', '파닭각', default, 'jiin0960', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '고', '고기각', default, 'sony0316', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배곺음', default, 'onue0608', SEQ_BOARD_BNO.nextval, 0,0) ;
commit;




--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '첫글', '이랍니다.', default, 'jiin0960', SEQ_BOARD_BNO.nextval, 0,0) ;

