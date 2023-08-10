desc member;'
select * from member;

select * from board;
insert into MEMBER values ('jiin0960', '0960','jin', 'a1@gmail.com');
insert into MEMBER values ('sony0316', '0316','soni', 'a2@gmail.com');
insert into MEMBER values ('onue0608', '0608','nue', 'a3@gmail.com');

DELETE FROM board where mid = '쿵';
DELETE FROM member where mid = 'srk';

DELETE FROM member     
    where mid = 'b'
;

--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, 'title1', 'content1', default, 'jiin0960', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '제목2', 'content2', default, 'sony0316', SEQ_BOARD_BNO.nextval, 0,0) ;
insert into BOARD values (SEQ_BOARD_BNO.nextval, '어렵3', 'content3', default, 'onue0608', SEQ_BOARD_BNO.nextval, 0,0) ;




--원본글
insert into BOARD values (SEQ_BOARD_BNO.nextval, '첫글', '이랍니다.', default, 'jiin0960', SEQ_BOARD_BNO.nextval, 0,0) ;

commit;