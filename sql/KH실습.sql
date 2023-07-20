---------------------------------------------------
-- KH_연습문제
---------------------------------------------------
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;


-- 1. JOB테이블의 모든 정보 조회
select * from job;

-- 2. JOB테이블의 직급 이름 조회
select job_name from job;

-- 3. DEPARTMENT 테이블의 모든 정보 조회
select * from department;

-- 4. EMPLOYEE 테이블의 직원명, 이메일, 전화번호, 고용일 조회
select emp_name, email, phone, hire_date
    from employee
;

-- 5. EMPLOYEE 테이블의 고용일, 사원 이름, 월급 조회
select hire_date, emp_name, salary
    from employee
;

-- 6. EMPLOYEE 테이블에서 이름, 연봉, 총수령액(보너스포함), 실수령액(총액 - (연봉*세금 3%)) 조회
--select emp_name 이름, salary*12 연봉, (salary+(salary*nvl(bonus, 0))*12 총수령액 
--    from employee;
select emp_name, salary*12 as "연봉", (salary+(salary*nvl(bonus,0)))*12 as "총수령액", ((salary+(salary*nvl(bonus,0)))-(salary*0.03))*12 as "실수령액" 
    from employee;


-- 7. EMPLOYEE 테이블에서 SAL_LEVEL이 S1인 사원의 이름, 월급, 고용일, 연락처 조회
select emp_name, salary, hire_date, phone
    from employee
    where sal_level='S1'
    ;

-- 8. EMPLOYEE 테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회
select emp_name, salary, ((salary*(nvl(bonus, 0)))-(salary*0.03))*12 실수령액, hire_date
    from employee
    where ((salary+(nvl(bonus, 0)))-(salary*0.03))*12 > 50000000
    ;
-- 9. EMPLOYEE 테이블에 월급이 4000000 이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 and JOB_CODE = 'J2'
;

-- 10. EMPLOYEE 테이블에서 DEPT_CODE가 D9이거나 D5인 사원중 
--고용일이 02년 1월 1일 보다 빠른 사원의 이름, 부서코드, 고용일 조회, hire_date < to_date(20020101, 'yyyymmdd');
select emp_name, dept_code, hire_date
    from employee
        where dept_code in ('D9', 'D5') and hire_date < to_date(20020101, 'yyyymmdd'); 
        
-- 11. EMPLOYEE 테아블에 고용일이 90/01/01 ~ 01/01/01인 사원의 전체 내용을 조회, between
select * from employee 
    where hire_date between to_date(19900101, 'yymmdd') and to_date(20010101, 'yymmdd');

-- 12. EMPLOYEE 테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회,  where emp_name like '%연'
select * from employee where emp_name like '%연';
-- 13. EMPLOYEE테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 조회
select emp_name, phone from employee
    where substr(phone, 1, 3) <> '010';
    
-- 14. EMPLOYEE테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE가 D9 또는 D6이고
--    고용일이 90/01/01 ~ 00/12/01이고, 급여가 270만 이상인 사원의 전체를 조회
select * from employee
    where email like '____#_%' escape '#' and dept_code in ('D9','D6')
    and hire_date between to_date(19900101, 'yymmdd') and to_date(20001201, 'yymmdd')
    and salary > 2700000;
    
-- 15. EMPLOYEE테이블에서 사원 명과 직원의 주민번호를 이용하여 생년, 생월, 생일 조회
select emp_name, substr(emp_no, 1, 2) as 생년, substr(emp_no, 3, 2) as 생월, 
substr(emp_no, 5, 2) as 생일
from employee
;
-- 16. EMPLOYEE테이블에서 사원명, 주민번호 조회 (단, 주민번호는 생년월일만 보이게 하고, '-'다음 값은 '*'로 바꾸기)





-- 9.



--select grade, min(sal) as min_sal, max(sal) as max_sal, round(avg(sal), 2) as 평균급여
--    from emp e join salgrade s on e.sal>s.losal and e.sal<s.hisal
--    group by grade
--;
------------------------------------------------------

-- KH 4
--10. 보너스 포함한 연봉이 높은 5명의 사번, 이름, 부서명, 직급, 입사일, 순위조회
select tb2.* from
(
select tb1.*, rownum rn from
(
SELECT emp_no, emp_name,(select dept_title from department d where dept_id=e.dept_code) as "부서명", job_code, ent_date, salary*12 + (salary*12*NVL(BONUS,0)) sal_rank
    from employee e
    order by sal_rank desc
)tb1
)tb2
where rn <= 5
;
--NVL(BONUS,0) = decode(bonus, null, 0, bonus)
select emp_id, salary*12 + (salary*12*NVL(BONUS,0)) sal_rank FROM EMPLOYEE order by sal_rank desc;

-----------------------------------------------------
-- 0721 test
-- 04 kh join 11번 join과 having(그룹함수 사용가능.)
-- 춘 02 - 14번
-- 춘 03 - 15번 2번째풀이
-- 16번 풀어보기
-----------------------------------------------------
-- 입사일 순서가 빠른 사람 3명을 조회해주세요.
select tb1.* from
(
select * from employee order by hire_date asc
)tb1
where rownum <= 5
;
-----------------------------------------------------
select * from
(
select rownum rn, tb1.* from
(
select * from employee order by hire_date asc
)tb1
)
where rn <= 3
;



SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;






















