select * from board;

insert into BOARD values (SEQ_BOARD_BNO.nextval, '배', '배곺음', 'admin', default,  DEFAULT, NULL, NULL, SEQ_BOARD_BNO.nextval, 0, 0) ;
commit;