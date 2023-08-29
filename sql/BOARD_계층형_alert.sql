desc member;

select * from board;
select * from member;

alter table member add enabled number(1) default 1;
alter table member add authority char(3) default 'R_A';