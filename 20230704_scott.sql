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