desc member;'
select * from member;
select * from board;
insert into MEMBER values ('jiin0191', '0919','jin', 'a1@gmail.com');
insert into MEMBER values ('sony0316', '0316','soni', 'a2@gmail.com');
insert into MEMBER values ('onue0608', '0608','nue', 'a3@gmail.com');

--DELETE FROM board;
--DELETE FROM member;



--원본글
insert into BOARD values (SEQ_BOARD_IDX.nextval, 'title1', 'content1', default, 'jiin0191', SEQ_BOARD_IDX.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_IDX.nextval, '제목2', 'content2', default, 'sony0316', SEQ_BOARD_IDX.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_IDX.nextval, '어렵3', 'content3', default, 'onue0608', SEQ_BOARD_IDX.nextval, 0,0) ;





--원본글
insert into BOARD values (SEQ_BOARD_IDX.nextval, '첫글', '이랍니다.', default, 'jiin0191', SEQ_BOARD_IDX.nextval, 0,0) ;
