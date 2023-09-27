select * from board;

insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배고픈데 삼겹살 좀 사주실래요?', 'admin', default,  DEFAULT, SEQ_BOARD_BNO.nextval, 0, 0) ;
commit;