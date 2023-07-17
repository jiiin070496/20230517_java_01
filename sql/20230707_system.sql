select * from user_tables;

-- 주석
-- ctrl + / 토글링
--create 명령어 - DDL 데이터 정의어
create user scott identified by tiger;

alter session set "_ORACLE_SCRIPT"=true;

create user kh identified by kh;
create user techuniv identified by univ;


--상태: 실패 -테스트 실패: ORA-01045: 사용자 SCOTT는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
--해결방법 -> grant 권한명, 롤명 to scott;
--create session, create table 처럼 각각의 권한명을 모두 나열하여 적기 어려움으로
--권한을 묶어서 만들어둔 롤을 사용하여 권한을 부여함
--connect - 접속관련 권한들이 있는 role
--resource - 자원(table view등 객체)관련 권한들이 있는 role
grant connect, resource, dba to techuniv;
--grant connect, resource to kh;

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



create user ssr identified by ssr1126;
alter session set "_ORACLE_SCRIPT"=true;
grant connect, resource, dba to ssr;
drop user ssr;

create user naemkoo identified by naem0704;
alter session set "_ORACLE_SCRIPT"=true;
grant connect, resource, dba to naemkoo;
drop user naemkoo;














