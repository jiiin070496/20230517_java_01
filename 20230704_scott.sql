-- 파란색 -> 예약어, 대소문자 구분 하지않으나 대부분 대문자화 시킴

SELECT *
FROM EMP, dept
;
SELECT EMPNO, ENAME, SAL -- 3번! 컬럼 열 추출조건 
FROM EMP -- 1번!
;
select ENAME, MGR, SAL, DEPTNO
from emp
WHERE DEPTNO=20 OR SAL>1500-- 2번! 행 선택조건 추철 
;
select ENAME, MGR, SAL, DEPTNO
from emp
--WHERE ENAME = 'smith' 
WHERE ENAME = 'SMITH' -- 속성값 컬럼값은 대/소문자 구분 철저히 함!
;
select empno, ename, sal
from emp
;
select dname, loc
from dept
;
--*를 사용하는 것보다 속도 빠름. 권장.
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;
--*보다 컬럼명을 나열하는 것이 속도면에서 좋음.
SELECT * FROM EMP;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;


--Q: 사원명과 연봉과 보너스를 포함한 연봉을조회
select ename, sal*12, sal*12 + NVL(comm, 0) -- NVL은 NullValue
from emp
;
select comm, nvl(comm, 0)
from emp;

select ename as 사원명, sal*12 as 연봉, sal*12 + NVL(comm, 0) "보너스 포함 연봉" , '$' as 단위-- NVL은 NullValue
from emp;

select distinct '$' as 단위, sal
from emp;

--급여가 1500보다 많이 받고 2800보다 적게 받는 직원 이름과 급여 조회
-- between and 사용
select ename, sal
    from emp
    where sal between 1500 and 2799 
;

-->= =< 사용
select ename, sal
    from emp
    where sal >= 1500 and sal < 2800
;

-- 20번 부서를 제외한 사원 정보를 조회

select *
    from emp
--    where deptno ^= 20
--    where deptno != 20
--    where deptno <> 20
    where not deptno = 20
;

-- 20번 부서를 제외한 사원 중 comm이 null인 사원 정보를 조회
select *
    from emp
    where deptno = 20
--오류       comm = null        
        and comm is null
        and comm is not null

;

-- 10, 20 부서인 사원 정보를 조회
select *
    from emp
--    where deptno = 10 OR deptno = 20 OR deptno = 30 혹은
    where deptno in (10, 20, 30)
;

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
 
-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여조회
-- (부서번호가 빠른 순으로, 같은 부서번호 일때는 최근 입사일 순으로 처리)










