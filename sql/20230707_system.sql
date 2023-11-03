select * from user_tables;

-- 주석
-- ctrl + / 토글링
--create 명령어 - DDL 데이터 정의어


alter session set "_ORACLE_SCRIPT"=true;

create user scott identified by tiger;
create user kh identified by kh;
create user khl identified by khl;
create user semi identified by semi;

create user jjapkorea identified by jjapkorea;

create user jjaptest identified by jjaptest;

DROP USER semi CASCADE;
DROP USER jjaptest CASCADE;

--상태: 실패 -테스트 실패: ORA-01045: 사용자 SCOTT는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
--해결방법 -> grant 권한명, 롤명 to scott;
--create session, create table 처럼 각각의 권한명을 모두 나열하여 적기 어려움으로
--권한을 묶어서 만들어둔 롤을 사용하여 권한을 부여함
--connect - 접속관련 권한들이 있는 role
--resource - 자원(table view등 객체)관련 권한들이 있는 role
grant connect, resource to kh;
grant connect, resource, dba to SCOTT;
grant connect, resource, dba to khl;
grant connect, resource, dba to jjapkorea;
grant connect, resource, dba to jjaptest;

alter user scott default tablespace USERS quota unlimited on users;
grant unlimited tablespace to scott;

alter user kh default tablespace USERS quota unlimited on users;
grant unlimited tablespace to kh;

--revoke connect, resource from scott; 
---> 권한 뺏기

--select * from  kh.dept; 
--create public synonym dept_public for KH.DEPT; -- 후에

--계정삭제. 접속해제 후
alter session set "_ORACLE_SCRIPT"=true;
drop user kh;

<<<<<<< HEAD


create user ssr identified by ssr1126;
alter session set "_ORACLE_SCRIPT"=true;
grant connect, resource, dba to ssr;
drop user ssr;

create user naemkoo identified by naem0704;
alter session set "_ORACLE_SCRIPT"=true;
grant connect, resource, dba to naemkoo;
drop user naemkoo;















=======
-- ROLE 
-- 접속 관련된 설정 -  oracle 12이후 버전에서 false 싱테러 접속됨.
alter session set "_ORACLE_SCRIPT"=false;
create role role_scott_manager;
create user c##kh2 identified by kh2;

--connect -롤 이름
-- 권한들의 묶음 = role
--create session - 접속 권한

--create table, alter table. drop table, create view, create sequence, alter sequence.....등 등
-- 공간 space를 사용하는 권한들 묶어서 resource 롤에 저장

grant create table, create view to role_manager;
-- grant 권한명, 권한명, ....., 롤 명, 롤명, ..... to 롤명, 사용자명;
grant role_manager to kh2;
>>>>>>> bf30b39e49f55044e9bf22cb9b70610edfb7abb7
