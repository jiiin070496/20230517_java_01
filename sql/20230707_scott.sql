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

-- 10, 20 부서를 제외한 사원 정보를 조회
select *
    from emp
--    where not (deptno = 10 OR deptno = 20) 혹은
--    where deptno != 10 AND deptno != 20 AND deptno != 30 혹은
    where deptno not in (10, 20, 30)

;

-- 20번 부서를 제외한 사원 중 comm이 null이 아닌 사원 정보를 조회
select *
    from emp
    where deptno = 20
        and comm is not null
;

--이름 중 3번째 글자가 '_'인 직원 이름과 급여조회
select ename, sal
    from emp
    where ename like '___\_%' escape '\'
          job like '___-_%' escape '-'
;

--관리자도 없고 부서 배치도 받지 않은 직원 조회
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

--20번과 30번 부서원들의 이름, 부서코드, 급여조회
-- IN
select ename, deptno, sal
    from emp
    where deptno in (10, 30)
--    deptno = 20 or deptno = 30과 같은 의미
;

-- analyst 또는 salesman인 사원 중 급여를 2500보다 많이 받는 직원의 이름, 급여, 직급코드 조회
select ename, sal, job
    from emp
    where job in ('ANALYST', 'SALESMAN')
        AND sal >= 2500 
    ;
--사원명의 길이와 byte 크기를 조회
select length(ename), lengthb(ename)
    from emp
    ;
    
select trim ('a안 녕baaaaa', 'a'), length(trim ('a안 녕baaaaa', 'a')), lengthb(trim ('a안 녕baaaaa', 'a'))
--    from emp
    from dual
--  테이블 dual은 임시테이블로 연산이나 간단한 함수 결과값을 조회할때 사용함.    
    ;
-- 사워명의 시작부분 s와 끝나는 부분 s를 모두 제거해주세요.
select Rtrim(Ltrim(ename, 'S'), 'S') from emp; 

--Lpad / Rpad 채워넣기
--ename이 총 10글자가 되도록 left 쪽에 's'를 채워주세요.
select Lpad(ename, 10, 'S') from emp;

--ename이 총 10글자가 되도록 left 쪽에 ''를 채워주세요.
select Lpad(ename, 10) from emp;

--문자(숫자)이어붙이기
select concat(ename, comm) from emp;
--select ename||comm from emp; 이것과 동일
select concat(sal, '$') from emp;

--substr 엄청중요!

--replace('A'를 '$'로 치환)
select replace(ename, 'A', '$') from emp;


--SYSDATE는 함수는 아니지만 명령어가 실행되는 시점에 결과값을 출력해주므로 함수 호출과 같음.
SELECT SYSDATE,  FROM DUAL;

select hiredate from emp;
select hiredate , add_months(hiredate, 510) from emp;
-- 2023.07.10 (월요일)
SELECT SYSDATE, to_char(sysdate, 'yyyy.mm.dd[day] hh:mi:ss') FROM DUAL; -- day = 월요일
SELECT SYSDATE, to_char(sysdate, 'yyyy.mm.dd[dy]') FROM DUAL;  -- dy = 월

alter session set NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
SELECT SYSDATE FROM DUAL;
SELECT * FROM EMP;

--year 2023 month 09 day 11 hour 13
select to_date('2023091113'),'yyyymmddhh24') from dual;
select add_month(to_date('2023091113'),'yyyymmddhh24')) from dual;
select next_day(to_date('2023091113'),'yyyymmddhh24'), '수') from dual;

-- 1 일요일, 2 월요일, 3 수요일

select last_day(to_date('2023091113'),'yyyymmddhh24')) from dual;

select to_number('123,4567,8901', '999,9999,9999')*5 from dual;

-- 직원들의 평균 급여는 얼마인지 조회
select floor(avg(sal)) 평균급여 from emp;
select sum(sal) 평균급여 from emp;
select max(sal) 평균급여 from emp;
select min(sal) 평균급여 from emp;
 -- 부서별 평균 급여 조회 groupby
select floor(avg(sal))평균급여, deptno  from emp group by deptno;
select sum(sal) 급여합, deptno  from emp group by deptno;
select max(sal) 평균급여, deptno from emp group by deptno;
select min(sal) 평균급여, deptno from emp group by deptno;
select count(sal) count, deptno from emp group by deptno;
select count(*) count, deptno from emp group by deptno;

--job별 평균급여 조회
select floor(avg(sal))평균급여, job  from emp group by job;
select sum(sal) sum, job from emp group by job;
select max(sal) max, job from emp group by job;
select min(sal) min, job from emp group by job;
select count(sal) count, job from emp group by job;
select count(*) count, job from emp group by job;

--job이 analyst인 직원의 평균급여 조회
select floor(avg(sal))평균급여, job  
    from emp
    group by job
    having job = 'ANALYST'
    ;

select avg(sal)평균급여,
    -- 오류 job
    from emp
    where job = 'ANALYST'
    ;

--job이 analyst인 부서별 직원의 평균급여 조회

--job이 analyst인 부서별 직원
select job, deptno, min(sal)    --, ename
    from emp
    where job= 'CLERK'
    group by deptno, job
;
--JOB 오름차순
SELECT * FROM EMP
    ORDER BY 3 -- 테이블의 JOB 순서인 3으로도 결과확인 가능
    ;
    
-- EMPLOYEE에서 부서코드, 그룹 별 급여의 합계, 그룹 별 급여의 평균(정수처리), 
-- 인원 수를 조회하고 부서 코드 순으로 정렬
select deptno from emp;
select sum(sal) sum, job 
    from emp 
    group by job
;
select floor(avg(sal)) 평균급여, deptno
    from emp
    group by deptno
;
SELECT * FROM EMP;
-- EMPLOYEE 테이블에서 부서코드와 보너스 받는 사원 수 조회하고 부서코드 순으로 정렬

-- EMPLOYEE 테이블에서 성별과 성별 별 급여 평균(정수처리), 급여 합계, 인원 수 조회하고 
-- 인원수로 내림차순 정렬

-- 사원명, 부서번호, 부서명, 부숴위치를 조회
select * from dept;
select * from emp;
select *
    from emp
        join dept on emp.deptno = dept.deptno    
;
select *
    from emp
        join dept using (deptno) -- 두 개의 테이블 같은 이름의 컬럼일때 using 을사용해 하나로 묶기 가능
;

-- 부서 위치기 DALLAS인 사원명 부서번호 부서명을 조회
SELECT ENAME, DEPT.DEPTNO, DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
        AND LOC = 'DALLAS'
;

select empno, loc
    from emp cross join dept
    ;

select * from emp;
select * from salgrade;
    -- 사원의 이름, 사번, sal, grade를 조회
select e.ename, e.empno, e.sal, s.grade 등급
    from emp e join salgrade s 
                on e.sal between s.losal and s.hisal
    order by s.grade desc, e.sal desc
;    
-- 같은 이름의 컬럼명이 나타나지 않도록 별칭 사용.    
 select e.empno 사원번호, e.ename 사원명, e.mgr 관리자번호, m.ename 관리자명
    from emp e join emp m
        on e.mgr = m.empno
--      on e.empno = m.mgr
;
select ename from emp where empno=7566;

----------------------------
--자료형--
----------------------------

create table t1( 
    c1 char(5), 
    c2 varchar2(5)
);
insert into t1 values('12', '12');
insert into t1 values('12345', '12345');
--insert into t1 values('123456', '123456');
commit;
select * from t1;

desc t1;
desc emp;

--오류
select rownum, e.* from emp e where deptno in (20, 30)
    order by ename asc
;
--해결방법
select rownum, e.* 
    from (select * from emp where deptno in (20, 30) order by ename asc) e     
;

-- 1페이지에는 1-3
select rownum, e.* 
    from (select * from emp where deptno in (20, 30) order by ename asc) e     
    where rownum between 1 and 3    
;
-- 2페이지에는 4-6
select * 
    from (select rownum rnum, e.* 
            from (select * from emp where deptno in (20, 30) order by ename asc) e
            )
    where rnum between 4 and 6    
;
-- 3페이지에는 7-9
-- rownum을 제대로 사용하기 위해서는 2개의 중첩 inline-view가 필요함
select * 
    from (select rownum rnum, e.* 
            from (select * from emp where deptno in (20, 30) order by ename asc) e
            )
    where rnum between 7 and 9    
;
with abc as (select rownum rnum, e.* 
            from (select * from emp where deptno in (20, 30) order by ename asc) e)
select *
from abc
where rnum between 7 and 9
--abc가 마치 새로운 테이블처럼 사용 가능함.
--    and sal > (select avg(sal) from abc)
;

create view view_abc
as 
select rownum rnum, e.* 
            from (select * from emp where deptno in (20, 30) order by ename asc) e
;            

select * from view_abc;
select *
    from view_abc
        where rnum between 7 and 9
;

-- ERD( Entity Relationship Diagram )
-- UML - CLASSDIAGRAM, ERD

select * from emp;
---------------------------------------------------
-- SCOTT_연습문제
---------------------------------------------------

-- 1. EMP테이블에서 COMM의 값이 NULL이 아닌 정보 조회

select * from emp where comm is not null;

-- 2. EMP테이블에서 커미션을 받지 못하는 직원 조회
select * from emp where comm is null;

-- 3. EMP테이블에서 관리자가 없는 직원정보 조회
select * from emp where MGR is null;

-- 4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
select * from emp order by sal desc;

-- 5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순으로 정렬조회
select * from emp order by sal desc;

-- 6. EMP테이블에서 사원번호, 사원명, 직급, 입사일 조회(단, 입사일을 오름차순 정렬 정리)
select empno, ename, job, hiredate
    from emp
    order by hiredate asc
;

-- 7. EMP테이블에서 사원번호, 사원명 조회(사원번호 기준 내림차순 정렬) 
select empno, ename
    from emp
    order by empno desc
;

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

-- 20230713
select * from emp;
create table emp_copy1 as select * from emp;
select * from emp_copy1;

create view view_emp1 as select * from emp;
select * from view_emp1;

desc emp;
insert into emp values(8000, 'NK', 'KH', 7788, sysdate, 3000, 700, 40);
commit;

insert into emp_copy1 values(8001, 'SSL', 'KH', 7788, sysdate, 9000, 700, 40);
commit;

insert into view_emp1 values(8000, '냄궁', 'KH', 7788, sysdate, 3000, 700, 40);
commit;

create table emp_copy20 as 
select empno, ename 사원명, job, hiredate, sal
    from emp
        where deptno=20
;

desc emp_copy20;
select * from user_constraints;

-----------------------------------------------
-- 7_DML, INSERT
--insert into emp(컬럼명1, 컬럼명2, ....) values(값1, 값2);
desc emp;
insert into emp(ename, empno, job, mgr, hiredate, deptno) 
    values('냄궁', 8190, 'T', 7788, SYSDAtE, 40);
insert into emp(ename, empno, job, mgr, hiredate, deptno) 
    values('SSR', 8191, 'p', NULL, to_date('2023-05-17', 'yyyy-mm-dd'), 40);
commit;

update emp set job='Base' where ename = 'NAEM.KU';
update emp set ename = 'NAEM.KU' where EMPNO = 8000;

update emp set job='Piano' where ename = 'SSR';
    
update emp
    set mgr = 7788
    where ename = 'SSR'   
-- update 명령문의 where절에는 컬럼명 pk=값;  
-- where 절에는 컬럼명 pk=값 ==> resultset은 단일행
-- where 절에는 컬럼명 uk=값 ==> resultset은 단일행
;
-- 20번 부서의 mgr이 SMITH(7908)로 조직개편
update emp
    set mgr = 7908
    where deptno = '20'
;
commit;
rollback;
-- 30번 부서의 mgr이 SMITH(7908)로 조직개편
update emp
    set mgr = 7902
    where ename = 'SSR';
;
commit;
-- 20번 부서에 신입사원 NKH(0191), NKJ(0704)를 투입
insert into emo (ename, empno, deptno)values('NKH', 0191, 50);
insert into emo (ename, empno, deptno)values('NKJ', 0704, 50);
INSERT ALL
    into emp (ename, empno, deptno)values('NKH', 0191, 20)
    into emp (ename, empno, deptno)values('NKJ', 0704, 20)
select * from dual;    

-- 새로운 부서 50번이 만들어지고 그 부서에 신입사원 NKH(0191), NKJ(0704)를 투입

                              
                      
SELECT * FROM EMP;                       
SELECT * FROM DEPT;                                                                                                                                          


SELECT * FROM EMP;
--여러개의 DML 명령어들을 묶어서 하나의 행동(일)처리를 하고자 할때 COMMIT/ROLLBACK을 적절히 사용
-- 하나 DML명령어가 하나의 행동(일)처리 단위라면 DML - COMMIT;(바로 커밋 때리기)
-- 2개 이상 DML명령어가 하나의 행동(일)처리 단위라면 DML 모두가 성공해야 - COMMIT; 그 중 하나라도 실패하면 ROLLBACK
-- 하나의 행동(일) 처리단위를 Transaction(트랜잭션) - commit/rollback 명령어가 수행되는 단위

--commit;
--rollback;

create table dept_copy2 as select * from dept where 1<>1;
-- DDL 명령어 수행시 COMMIT 행동도 함께 수행됨. VIEW, USER 등 똑같이 포함됨

---------------------------------------------------------------------
-- 0714_SCOTT
---------------------------------------------------------------------
create view view_emp10
    as select max(sal) maxsal, job from emp group by job;

----------------------VIEW----------------------------
--t2테이블이 없음에도 view를 생성
create or replace force view view_test2
    AS SELECT * FROM t2
;
create force view view_test2
    AS SELECT * FROM t2
;
create or replace view view_test3
    AS SELECT * FROM t3
;
create or replace view view_emp_readonly
    as 
    select * from emp
    with read only
;

insert into view_emp_readonly (empno, ename, deptno) values(8100, 'hgse', 30); 
--SQL 오류: ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
--42399.0000 - "cannot perform a DML operation on a read-only view"

create or replace view view_emp_checkoption
    as
    select * from emp
    where deptno=30
    with check option -- deptno에 걸림, 바꿀 수 없음
;
select * from view_emp_checkoption;
update view_emp_checkoption set deptno=20 where empno=7499;
--ORA-01402: 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다
update view_emp_checkoption set comm=350 where empno=7499;
--다른건 됨

update emp set comm=350 where empno=7499;


create sequence seq_t1;
select seq_t1.nextval from dual;
select seq_t1.currval from dual;

-- sequence의 nextval은 unique한 값에 insert시에 활용됨.
-- sequence 이름 지울때 - SEQ_table명_컬럼명
-- 예를 들어 emp테이블 empno에 적용 - seq_emp_empno
-- insert into emp values (seq_emp_mepeno.nextval, '홍길동',....);

select * from user_sequences;
select * from user_indexes;
select * from user_cons_columns;

-- 함수기반 index
create index idx_emp_sal on emp(sal);

create index idx_emp_sal on emp(sal*12);
-- where 절에 sal*12 > 5000 처럼 조건문에 사용이 번번할때 index를 걸어줌 

create index idx_emp_sal_comm on emp(sal,comm);
-- where 절에 sal*12 > 5000 and comm > 200 처럼 조건문에 사용이 번번할때 index를 걸어줌 

select * from emp where sal>3000 and comm is not null;

--bitmap기반 index - 도메인의 종류가 적을때 동일한 데이터가 많은 경우 ex) gender 남/여
create bitmap idx_emp_deptno on emp(deptno);
create bitmap idx_emp_deptno_job on emp(job,deptno);

-- 1. UNIQUE
    -- insert 오류체크빠름. 
-- 2. NON_UNIQUE
alter index pk_emp rebuild;

-- DDL - SEQUENCE
create sequence seq_tb1_c1 start with 10 increment by 10 maxvalue 90 minvalue 10 nocycle cache 20;
select seq_tb1_c1.nextval from dual;
select seq_tb1_c1.currval from dual;
-- 사용예시 : DQL이나 DML에 사용됨.

-- DDL - INDEX(createm alter, drop), table과 무관하지만 table DQL과 DML에는 사용됨
-- SELECT문 속도 향상. DML 속도 저하가 되므로 적절하게 사용해야함
-- WHERE 절에 주로 사용되는 COLUMN에 INDEX
-- PK - CONSTRAINT 생성 시 INDEX도 생성됨.
-- CREATE BITMAP INDEX IDX_TB1_C1 ON TB1(C1); 
-- ALTER INDEX IDX_TB1_C1 rebuild;
--DML - insert, update, delete
--view 도 가능하나 - with read only 불가, with check option

-- RANK() OVER || 21일 평가
-- over-ram 용량이 많이 차지하고 느릴 수 있음.
select deptno, empno, ename, sal
        , sum(sal) over(partition by deptno) sumsal 
    from emp
;    
-- over(order by)
-- window - over(order by ..): 기존 rownum 대비 간결함. - 동일한 순위가 있을때 다음 순위값 +1 이 dense_rank() 
select deptno, empno, ename, sal
        , rank()over(order by sal asc)ranksal -- 순위, 4등 2명 다음 6등
        , dense_rank()over(order by sal asc)dranksal -- 순위, 4등 2명 다음 5등
        , row_number()over(order by sal asc)rnsal -- 그냥 순서 
--        , rank(2450) within group over(order by sal asc) clarksal
        , rank()over(partition by deptno order by sal asc)dept_sal_rank -- group by를 사용하지 않아도 deptno 별로 묶여서 나옴
    from emp
    order by deptno
;   
select dense_rank(2450) within group(order by sal asc) clarksal
    from emp
;   

--rownum
select deptno, empno, ename, sal
        , rank()over(order by sal asc)ranksal
    from (select rownum rn, t1.* from(select deptno, empno, ename, sal from emp order by sal asc)t1);
;    

-- 누적분산 cume_dist()
-- 부서 코드가 30번인 직원의 이름, 급여, 급여에 대한 누적분산을 조회
select ename, sal
        , cume_dist()over(order by sal) sal_cume_dist
    from emp
    where deptno = 30;

--- 부서별 직원의 이름, 급여, 급여에 대한 누적분산을 조회
select ename, deptno, sal
        , cume_dist()over(partition by deptno order by sal) sal_cume_dist
    from emp
--    where deptno = 30
    ;
select ename, deptno, sal
        , trunc(cume_dist()over(partition by deptno order by sal), 2) sal_cume_dist
        , trunc(ratio_to_report(sal)over(partition by deptno), 2) sal_ratio --  전체중 차지하고있는 비율
    from emp
--    where deptno = 30
;

select deptno, ename, sal
        , first_value(ename) over(partition by deptno order by sal desc)as dept_rich
        , last_value(ename) over(partition by deptno order by sal desc
--        window 
-- 생략시 현재 행이 작성되는 내용(값)까지만 알 수 있음. 다음 행에 나올 값은 알지 못함.
--unbounded preceding : 윈도우의 첫행
--unbounded following : 윈도우의 마지막행
--1 preceding : 현재행의 이전행
--1 following : 현재행의 다음행
-- current row: 현재행
                                rows between current row and unbounded following
        )as dept_poor
        from emp
        where sal is not null;

select deptno, ename, empno, sal, sum(sal) over (partition by deptno)s_sal --> deptno 그룹의 sal을 다 더한 값
    from emp;

select empno, ename, sal, ntile(4) over(order by sal)
    from emp;

-----------------------------------------------------------
-- 0718
-----------------------------------------------------------
desc dept;
select * from dept;
insert into dept values(10,'ACCOUNT','NEW YORK');
insert into dept values('&deptno','&부서명','&지역');
commit;

select * from emp
    where 
--    ename = '%SMITH'
--        ENAME LIKE '%SMITH' 
    ENAME = '&SMITH' 
;

SELECT '&뭐라도입력' FROM DUAL;
-- &는 문자형태(작은 따옴표) 안에 넣어줘야함 '&' - ESCAPE문자: 특별한 역할 - 대체문자입력창을 띄워줌
-- WHERE , SELECT 등 여기저기 사용함.
-- 검색을 '&_'로 검색하고 싶다면 
--LIKE '%' / LIKE '_' - ESCAPE 문자 : 특별한 역할 - %:문자 0개 이상, _: 문자 1개
--검색을 _%로 하려면 LIKE '$_$%' ESCAPE '$'
SET DEFINE OFF;,
--, =, !=, <>, ^=, >, <, >=, <= 비교연산자
-- 비교연산자 값은 TRUE/FALSE

--NULL은 비교연산자로 비교하지 못함
--IS NULL / IS NOT NULL 로 사용


-----------------------------------------------------------
--0719 TRIGGER
-----------------------------------------------------------
CREATE TABLE PRODUCT(
    pcode number primary key,
    pname varchar2(30),
    brand varchar2(30),
    price number,
    stock number default 0
);

create table pro_detail(
    dcode number primary key,
    pcode number,
    pdate date,
    amount number,
    status varchar2(10) check(status in('입고','출고')),
    foreign key (pcode) references product(pcode)
);

create sequence seq_pcode;
create sequence seq_dcode;

insert into product
values (seq_pcode.nextval, '갤럭시노트8','삼성',900000, default);
insert into product
values (seq_pcode.nextval, '아이폰8','애플',1000000, default);
insert into product
values (seq_pcode.nextval, '대륙폰','샤오미',600000, default);


INSERT INTO PRO_DETAIL VALUES (SEQ_DCODE.NEXTVAL, 1, SYSDATE, 120,'입고');
INSERT INTO PRO_DETAIL VALUES (SEQ_DCODE.NEXTVAL, 2, SYSDATE, 95,'입고');
INSERT INTO PRO_DETAIL VALUES (SEQ_DCODE.NEXTVAL, 3, SYSDATE, 4,'입고');
INSERT INTO PRO_DETAIL VALUES (SEQ_DCODE.NEXTVAL, 1, SYSDATE, 32,'출고');
INSERT INTO PRO_DETAIL VALUES (SEQ_DCODE.NEXTVAL, 2, SYSDATE, 98,'출고');
INSERT INTO PRO_DETAIL VALUES (SEQ_DCODE.NEXTVAL, 3, SYSDATE, 11,'출고');

SELECT * FROM PRODUCT;
SELECT SEQ_DCODE.NEXTVAL FROM DUAL ;


















