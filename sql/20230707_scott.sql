-- 학습용 SCOTT 명령어들
SELECT *
FROM EMP
;
SELECT ENAME, SAL,EMPNO
FROM EMP
;
SELECT ENAME, MGR, SAL, DEPTNO 
FROM emp
WHERE DEPTNO=20 OR SAL>1500
;
SELECT ENAME, MGR, SAL, DEPTNO 
FROM emp
--WHERE ENAME = 'smith'
WHERE ENAME = 'SMITH'
-- ORA-00904: "SMITH": 부적합한 식별자
;
select empno, ename, sal
from emp
;
-- * 을 사용하는 것 보다 속도 빠름. 권장.
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;
-- * 보다 컬럼명을 나열하는 것이 속도면에서 좋음.
select * from emp;
select * from dept;
select * from salgrade;
select * from bonus;


-- Q: 사원명과 연봉과 보너스포함한 연봉을 조회
select ename, sal*12, sal*12 + nvl(comm, 0)
from emp
;
select comm, nvl(comm, 0), nvl(comm, 100)
from emp
;
select ename as "사원명", sal*12 as 연봉, sal*12 + nvl(comm, 0) as "보너스 포함 연봉"
from emp
;
select ename "name", sal*12 sal12, sal*12 + nvl(comm, 0) salwcomm
from emp
;

select '안녕' as hello
from emp
;
select '안녕' as hello
from dept
;
select '$' as 단위, sal 
from emp
;
select distinct '$' as 단위, sal 
from emp
;

-- 급여를 1500보다 많이 받고 2800보다 적게 받는 직원 이름과 급여 조회
-- between and 사용
select ename, sal
    from emp
    where sal between 1500 and 2799
;
-- >= <= 사용
select ename, sal
    from emp
    where sal >= 1500 and sal < 2800
;
-- 20번 부서를 제외한 사원 정보를 조회
select * 
    from emp
--    where deptno != 20
--    where deptno <> 20
--    where deptno ^= 20
--    where not deptno = 20
    where deptno not in (20)
;
-- 20번 부서를 제외한 사원 중 comm이 null이 아닌 사원 정보를 조회
select * 
    from emp
    where not deptno = 20 
--        and comm is not null
-- 오류        comm != null  comm = null
;
-- 10, 20, 30 부서를 사원 정보를 조회
select * 
    from emp
--    where deptno = 10 OR deptno = 20 OR deptno = 30
    where deptno in (10, 20, 30)
;
-- 10, 20, 30 부서를 제외한 사원 정보를 조회
select * 
    from emp
--    where not (deptno = 10 OR deptno = 20)
--    where deptno != 10 AND deptno != 20 AND deptno != 30
    where deptno not in (10,20,30)
;
select * from emp;


-- 급여를 1800보다 많이 받고 2500보다 적게 받는 직원이름과 급여 조회

-- ‘S’로 시작하는 2글자이상의 이름을 가진 직원 이름과 급여 조회
select ename, sal 
    from emp
    where ename like 'S_%'
;
--ORA-00933: SQL 명령어가 올바르게 종료되지 않았습니다
--00933. 00000 -  "SQL command not properly ended"
--SQL Error [933] [42000]: ORA-00933: SQL 명령어가 올바르게 종료되지 않았습니다

-- 핸드폰의 앞 네 자리 중 첫 번호가 7인 직원 이름과 전화번호 조회
-- 이름 중 3번째 글자가 ‘S’ 인 직원 이름과 급여 조회
select ename, sal 
    from emp
    where ename like '__S%'
;
-- 이름 중 3번째 글자가 ‘_’ 인 직원 이름과 급여 조회
select ename, sal 
    from emp
    -- 이름이 4글자 이상인 직원
--    where ename like '___%'  
    where ename like '__\_%' escape '\'
         or job like '__@_%' escape '@'
-- like '__*_' escape '*'
;
-- EMAIL ID 중 ‘_’의 앞이 3자리인 직원 이름, 이메일 조회
-- ‘이’씨 성이 아닌 직원 사번, 이름, 이메일 조회
-- 관리자도 없고 부서 배치도 받지 않은 직원 조회 - *
select *
    from emp
    where mgr is null
        and deptno is null
;
-- 관리자가 없지만 보너스를 지급받는 직원 조회
select *
    from emp
    where mgr is null
        and comm is not null
;
-- 20 부서와 30 부서원들의 이름, 부서코드, 급여 조회
-- in
select ename, deptno, sal
    from emp
    where deptno in (20, 30)
    -- deptno = 20 or deptno = 30
;

-- ANALYST 또는 SALESMAN 인 사원 중 급여를 2500보다 많이 받는 직원의 이름, 급여, job 조회
select ename, sal, job
    from emp
    where job in ('ANALYST', 'SALESMAN') 
        and sal >= 2500
    ;
-- 사원명의 길이와 byte크기를 조회
select length(ename), lengthb(ename)
    from emp
    ;
--select ' a안 녕b ', length(' a안 녕b '), lengthb(' a안 녕b ')
select trim(' a안 녕b '), length(trim(' a안 녕b ')), lengthb(trim(' a안 녕b ')) 
--    from emp
    from dual
--   테이블 dual 은 임시테이블로 연산이나 간단한 함수 결과값을 조회할때 사용함.
;
-- 사원명의 시작부분 S와 끝나는 부분 S 모두 제거해주세요.
select Rtrim(Ltrim(ename, 'S'), 'S') from emp;
-- Ltrim 예시 010 제거

-- Lpad / Rpad 채워넣기
-- ename이 총 10자가 되도록 left 쪽에 'S'를 채워주세요.
select Lpad(ename, 10, 'S') from emp;
-- ename이 총 10자가 되도록 left 쪽에 ' ' 공백(default)를 채워주세요.
select Lpad(ename, 10) from emp;

-- 문자(컬럼) 이어붙이기
select concat(ename, comm) from emp;
select ename||comm from emp;
select sal||'달러' from emp;
select concat(sal, '달러') from emp;
-- substr 엄청중요 !!
-- replace
select replace(ename, 'AM', 'AB') from emp;


select ename||'s family' , sal ||'원'
from emp;
select sal, '원'
from emp;

-- sysdate은 함수는 아니나 명령어가 실행되는 시점에 결과값을 출력해주므로 함수호출과 같이 동작함.
select sysdate, add_months(sysdate, 1) from dual;
select hiredate from emp;
select hiredate, add_months(hiredate, 1) from emp;
-- 2023.07.10 (월)
select sysdate, to_char(sysdate, 'yyyy.mm.dd (dy) hh24:mi:ss')  from dual;
select sysdate, to_char(sysdate, 'yyyy.mm.dd (day) hh24:mi:ss')  from dual;

alter session set NLS_DATE_FORMAT = 'yyyy-mm-dd hh24:mi:ss';
select sysdate from dual;
select * from emp;

-- year 2023 month 09 day 11 hour 13
select to_date('2023091113', 'yyyymmddhh24') from dual;
select add_months(to_date('2023091113', 'yyyymmddhh24'), 5) from dual;
select next_day(to_date('2023091113', 'yyyymmddhh24'), '수') from dual;  
select next_day(to_date('2023091113', 'yyyymmddhh24'), 4) from dual;  
-- 1:일요일, 2 월요일, 3 화요일...
select last_day(to_date('2023091113', 'yyyymmddhh24')) from dual;

-- 오류 select add_months('20230911132214', 4) from dual;

select to_char(empno, '000000') , '$'||trim(to_char(sal, '999,999,999,999'))
    from emp;
select to_char(empno, '000000') , trim(to_char(sal, 'L999,999,999,999'))
    from emp;

select to_number('123,4567,89.01', '999,9999,99.99')*5 from dual;
-- 오류 select '123,4567,8901'*5 from dual;
-- 오류 select '123,456,789,012'*5 from dual;

-- 직원들의 평균 급여는 얼마인지 조회
select avg(sal) 평균급여 from emp;
select sum(sal) sum from emp;
select max(sal) max from emp;
select min(sal) min from emp;
select count(sal) count from emp;
-- 부서별 평균 급여 조회
select avg(sal) 평균급여, deptno from emp group by deptno;
select sum(sal) sum, deptno from emp group by deptno;
select max(sal) max, deptno from emp group by deptno;
select min(sal) min, deptno from emp group by deptno;
select count(sal) count, deptno from emp group by deptno;
select count(*) count, deptno from emp group by deptno;
-- job별 평균 급여 조회
select avg(sal) 평균급여, job from emp group by job;
select sum(sal) sum, job from emp group by job;
select max(sal) max, job from emp group by job;
select min(sal) min, job from emp group by job;
select count(sal) count, job from emp group by job;
select count(*) count, job from emp group by job;

-- job이 ANALYST 인 직원의 평균 급여 조회
select avg(sal) 평균급여, job 
    from emp 
    group by job
    having job='ANALYST'
;
select avg(sal) 평균급여
    -- 오류, job 
    from emp 
    where job='ANALYST'
;
-- job이 CLERK 인 부서별 직원의 평균 급여 조회
---- job이 CLERK 인 부서별 직원
select job, deptno, ename, sal
    from emp
    where job='CLERK';
-- job이 CLERK 인 부서별 직원의 평균 급여 조회
select job, deptno, avg(sal)
--, ename
    from emp
    where job='CLERK'
    group by deptno, job
    ;

select * from emp
    order by sal desc, ename asc
    ;
select sal, sal*12+nvl(comm,0) salcomm 
    from emp
    order by salcomm desc, sal asc
    ;
select ename, sal*12+nvl(comm,0)  
    from emp
    order by 2 desc, 1 desc
    ;
-- job 오름차순
select * from emp
--    order by job;
    order by 3;    
    
    
-- EMPLOYEE에서 부서코드, 그룹 별 급여의 합계, 그룹 별 급여의 평균(정수처리), 인원 수를 조회하고 부서 코드 순으로 정렬

-- EMPLOYEE테이블에서 부서코드와 보너스 받는 사원 수 조회하고 부서코드 순으로 정렬
-- EMPLOYEE테이블에서 성별과 성별 별 급여 평균(정수처리), 급여 합계, 인원 수 조회하고 인원수로 내림차순 정렬

-- 03-11. GRADE 별로 평균 급여에 10프로 내외의 급여를 받는 사원명을 조회 - 정렬
select S.GRADE, e.ename, e.sal
    from emp e join salgrade s
        on e.sal between s,losal and s.hisal 
    where e.sal >=
;

select S.GRADE, e.ename, e.sal
    from emp e join salgrade s
        on e.sal between s,losal and s.hisal 
    where e.sal >=
;


Create or replace view view_emp_salgrade
as
select e.empno, e.ename, job, mgr, hiredate, sal, comm, deptno, grade, losal, hisal 
    from emp e join salgrade s
        on e.sal between s.losal and s.hisal
;

-- 03-12 지역 재난 지원금을 사원들에게 추가 지급
--조건 :
--1. NEW YORK지역은 SAL의 2%, DALLAS지역은 SAL의 5%, CHICAGO지역은 SAL의 3%,
--BOSTON지역은 SAL의 7%
--2. 추가지원금이 많은 사람 순으로 정렬
-- CASE 1. case, when-then
 select empno, ename, sal, loc, 
       sal + case loc
            when 'NEW YORK' then sal*0.02
            when 'DALLAS' then sal*0.05
            when 'CHICAGO' then sal*0.03
            when 'BOSTON' then sal*0.07
        END            
        as sal_subsidy
    from emp e
        join dept d using (deptno)
--    where
--    group by
--    having
    order by sal_subsidy - sal desc
;

-- CASE 2. decode
 select empno, ename, sal, loc, 
        sal+decode(loc, 'NEW YORK',sal*0.02, 'DALLAS',sal*0.05, 'CHICAGO',sal*0.03, 'BOSTON', sal*0.07 )
        as sal_subsidy
    from emp e
        join dept d using (deptno)
    order by (sal_subsidy-sal) desc
;

--salesman들의, 급여와, 같은 급여를 받는 사원을 조회
select empno, ename, sal
    from emp
--    where sal > ALL(select sal from emp where job='SALESMAN')
    where sal > (select MAX(sal) from emp where job='SALESMAN')

--        where sal in (2975, 2850, 2450)
;

SELECT ENAME, SAL FROM EMP WHERE JOB='SALESMAN';

---------------------------------------------------------
--관리자로 등록되어 있는 사원들을 조회
select empno, ename
    from emp e
    where exists (select empno from emp e2 where e2.empno = e.mgr)
;
--exists 없이
select distinct e.empno, e.ename
    from emp e join emp e2
        on e.empno = e2.mgr
    order by empno asc
;
--join 대비 상관쿼리 사용시 속도 매우 향상

---------------------------------------------------------
--부서번호가 30인 사원들의 급여와 부서번호를 묶어 메인 쿼리로 전달
select *
    from emp
    where (deptno, sal) in (select deptno, sal from emp where deptno=30)
;

---------------------------------------------------------
-- 부서별 평균급여와 직원들 정보를 조회해주세요.
select e.*,
        -- 스칼라서브쿼리 작성되어야함.
        (select trunc(avg(sal)) from emp e2 where e2.deptno = e.deptno) avgsal
    from emp e
;
---------------------------------------------------------

-- 직원 정보와, 부서번호, 부서명, 부서위치
select ename, deptno, dname, loc
    from emp join dept using(deptno)
;
--스칼라서브쿼리
select ename, deptno,
        (select dname from dept d where d.deptno = e.deptno ) dname
        ,(select loc from dept d where d.deptno = e.deptno )loc
    from emp e
;
---------------------------------------------------------

--salesman과 manager를 조회해주세요.

select * from emp where job in ('salesman', 'manager');

select empno, ename, job 
from emp 
where job='salesman'

union --order by 불가능

select empno, ename, job 
from emp 
where job='manager'
;

---------------------------------------------------------

--급여가 1000미만인 직원, 2000 미만인 직원 조회- 중복 결과(union all)
select empno, ename, sal from emp where sal < 1000
union all
select empno, ename, sal from emp where sal < 2000
;

---------------------------------------------------------

--급여가 1000 초과인 직원, 2000 미만인 직원 조회 - 교집합 intersect
select empno, ename, sal from emp where sal > 1000
intersect
select empno, ename, sal from emp where sal < 2000
;
---------------------------------------------------------

--2000 미만인 직원을 제외하고 조회 - 차집합 minus
select empno, ename, sal from emp
minus
select empno, ename, sal from emp where sal < 2000
;
-- not exists 
select empno, ename, sal from emp e
    where not exists (select e2.sal from emp e2 where e.sal < 2000)
;
---------------------------------------------------------
-- DDL - COMMENT -
comment on column EMP.MGR is '관리자사번';

desc emp;
desc user_constraints;
select * from user_constraints;
select * from user_tables;
select * from user_views;
select * from user_cons_columns;

---------------------------------------------------------








