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
select emp_name 이름, salary*12 연봉, (salary+bonus)*12 총수령액, 
    from employee;

-- 7. EMPLOYEE 테이블에서 SAL_LEVEL이 S1인 사원의 이름, 월급, 고용일, 연락처 조회
select emp_name, salary, hire_date, phone
    from employee
    where sal_level='s1'
    ;

-- 8. EMPLOYEE 테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회

-- 9. EMPLOYEE 테이블에 월급이 4000000 이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 and JOB_CODE = 'j2'
;