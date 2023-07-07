select * from user_tables;

-- 주석
-- ctrl + / 토글링
--create 명령어 - DDL 데이터 정의어
create user scott identified by tiger;

alter session set "_ORACLE_SCRIPT"=true;

create user kh identified by kh;


--상태: 실패 -테스트 실패: ORA-01045: 사용자 SCOTT는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
--해결방법 -> grant 권한명, 롤명 to scott;
--create session, create table 처럼 각각의 권한명을 모두 나열하여 적기 어려움으로
--권한을 묶어서 만들어둔 롤을 사용하여 권한을 부여함
--connect - 접속관련 권한들이 있는 role
--resource - 자원(table view등 객체)관련 권한들이 있는 role
grant connect, resource  to scott;
grant connect, resource to kh;
--revoke connect, resource from scott; -> 권한 뺏기