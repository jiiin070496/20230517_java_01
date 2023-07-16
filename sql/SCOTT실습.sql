---------------------------------------------------
-- SCOTT_실습
---------------------------------------------------

select * from emp;

--1. EMP 테이블에서 COMM의 값이 NULL이 아닌 정보 조회
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--2. EMP테이블에서 커미션을 받지 못하는 직원 조회
select * from emp where comm is null or comm = 0
;

--3. EMP테이블에서 관리자가 없는 직원 정보 조회
select * from emp where mgr is null;

--4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
select * from emp order by sal desc;

--5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
select * from emp where sal=sal order by sal desc, comm desc;

--6. EMP테이블에서 사원번호, 사원명, 직급, 입사일 조회(단, 입사일을 오름차순 정렬)
select empno, ename, job, hiredate from emp order by hiredate asc;

--7. EMP 테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬
select empno 사원번호, ename 사원명 from emp order by empno desc;

--8. EMP 테이블에서 사번, 입사일, 사원명, 급여 조회
--(부서번호가 빠른 순으로, 같은 부서번호 일때는 최근입사일 순으로 처리)
select empno, hiredate, ename, sal 
    from emp 
    where deptno = deptno
    order by deptno, hiredate desc;
    
--9. 오늘 날짜에 대한 정보 조회
select sysdate from dual;

--10. EMP 테이블에서 사번, 사원명, 급여조회
--단, 급여는 100딘위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬
select empno, ename, ROUND(sal, -2)
    from emp
    order by sal desc;
    
--11. EMP 테이블에서 사원번호가 홀수인 사람 조회
select *
    from emp
    where mod(empno, 2)='1';
--12. EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
select ename, extract(year from hiredate) as 입사연도, extract(month from hiredate)
    from emp;

--13. EMP테이블에서 9월에 입사한 직원의 정보 조회
select * from emp where extract(month from hiredate)='9';

--14. EMP테이블에서 81년도에 입사한 직원 조회
select * from emp where extract(year from hiredate)='1981';

--15. EMP 테이블에서 이름이 'E'로 끝나는 직원 조회
select * from emp where ename like '%E';

--16. EMP 테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
select * from emp where ename like '__R%';
select * from emp where substr(ename, 3, 1)='R';

--17. EMP 테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
select empno, ename, hiredate, add_months(hiredate, 480)
    from emp
;
--18. EMP 테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
select *
    from emp
    where months_between(sysdate, hiredate)>=456;

--19. 오늘 날짜에서 년도만 추출
select extract(year from sysdate) from dual; 

------------------------------------------------------
-- SCOTT예제 3.
------------------------------------------------------
-- 9. GRADE별로 급여을 가장 작은 사원명을 조회
select s.grade as "등급", e.ename as "등급별가장적은급여"
    from emp e, salgrade s
    where (grade, sal) in
    (select grade, min(sal) from emp, salgrade
    where sal > losal and sal < hisal   
    group by grade
    );

-- 10.
select grade, min(sal) as min_sal, max(sal) as max_sal, round(avg(sal), 2) as avg_sal
    from emp e join salgrade s
        on e.sal > s.losal and e.sal < s.hisal
    group by grade
;

-- 12. NEW YORK지역은 SAL의 2%, DALLAS지역은 SAL의 5%, CHICAGO지역은 SAL의 3%, BOSTON지역은 SAL의 7%
-- 추가지원금이 많은 사람 순으로 정렬
SELECT empno, ename, sal, 
(case when loc = 'NEW YORK' then sal*1.02
when loc = 'DALLAS' then sal*1.05
when loc = 'CHICAGO' then sal*1.03
when loc = 'BOSTON' then sal*1.07
end)AS SAL_SUBSIDY
    from emp e, dept d
    where e.deptno = d.deptno
    order by (case when loc = 'NEW YORK' then sal*1.02
        when loc = 'DALLAS' then sal*1.05
        when loc = 'CHICAGO' then sal*1.03
        when loc = 'BOSTON' then sal*1.07
        end) DESC
;


select * from emp;
select * from salgrade;
select * from dept;