SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;

desc employee;

SELECT * FROM EMPLOYEE WHERE JOB_CODE = 'J1';

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <=6000000
;
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000
;
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%'
;

SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___7%'
;

SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____#_%' ESCAPE '#'
;

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '이%'
;

SELECT EMP_ID, MANAGER_ID , DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL
;

SELECT EMP_NAME, DEPT_CODE, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL AND DEPT_CODE IS NULL
;

--D6부서와 D8 부서원들의 이름, 부서코드, 급여조회
select EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE IN ('D6', 'D8')
;
    
--J2 또는 J7 직급 코드 중 급여를 2000000보다 많이 받는 직원의 이름, 급여, 직급코드 조회
SELECT EMP_NAME, SALARY, JOB_CODE
    FROM EMPLOYEE
    WHERE JOB_CODE = 'J2' OR JOB_CODE = 'J7' AND SALARY > 2000000;

-- 문자처리함수 substr
select substr('showmethemoney',1,2) from dual;

-- 문자처리함수, INITCAP
select initcap('welcome to my world') from dual;

-- 문자처리함수, concat
select concat('HIGHWAY T','O HELL') from dual;

-- 문자처리함수, replace (역삼동을 지우고 개포동으로 대입)
select replace('서울시 강남구 역삼동', '역삼동', '개포동') from dual;

-- 숫자처리함수, ABS(전달받은 숫자의 절대값 반환)
select abs(-10.9) from dual;

-- 숫자처리함수, MOD(전달받은 숫자를 나누어 나머지 반환)
select mod(100, 3) from dual;

-- 숫자처리함수, round(전달받은 숫자 혹은 컬럼에서 지정한 위치부터 반올림하여 값 반환)
select round(10.11)from dual;

-- 숫자처리함수, TRUNC(인자로 전달받은 숫자 혹은 컬럼에서 지정한 위치부터 소수점 자리의 수를 버리고 반환)
select  trunc(123.4567, 3) from dual;

-- 숫자처리함수 CEIL(인자로 전달 받은 숫자 혹은 컬럼을 올림 후 반환)
select ceil(10.0001) from dual;

select length(emp_name) len, lengthb(emp_name) bytelen
    from employee
    ;

--select email, instr(email, '@', -1, 1) 위치
--select email, instr(email, '@', -1) 위치
--instr - 1부터 시작
select email, instr(email, '@', 3) 위치
    from employee
    ;
--email은 @ 이후에 .이 1개 이상 있어야함    
select email --, instr(email, '@'), instr (email, '.', instr(email, '@')) 위치
    from employee
    where instr (email, '.', instr(email, '@')) != 0
    ;
    
-- O찾기 
select instr('ORACLEWELCOME', 'O', 1) from dual;
select instr('ORACLEWELCOME', 'O', 1, 2) from dual;
select instr('ORACLEWELCOMEOKAY', 'O', 1, 3) from dual;

select instr('ORACLEWELCOMEOKAY', 'O', 3) from dual;
select instr('ORACLEWELCOMEOKAY', 'O', 3, 2) from dual;
select instr('ORACLEWELCOMEOKAY', 'O', 3, 3) from dual;


-- 모든 사원들의 남, 여 성별과 함께 이름과 주민번호 
SELECT emp_name, emp_no, 
    decode(substr(emp_no, 8, 1), 2, '여', 4, '여', 1, '남', 3, '남', '그외') as "성 별"
    from employee
;

SELECT emp_name, emp_no, 
    case substr(emp_no, 8, 1)
        when '2' then '여' 
        when '4' then '여' 
        when '1' then '남' 
        when '3' then '남'
        else '그외'
    end
    as "성 별"
    from employee
;

SELECT emp_name, emp_no, 
    case to_number(substr(emp_no, 8, 1))
        when 2 then '여' 
        when 4 then '여' 
        when 1 then '남' 
        when 3 then '남'
        else '그외'
    end
    as "성 별"
    from employee
;

select floor(avg(salary)) 평균급여 from employee; -- 소수 자름
select round(avg(salary), 4) 평균급여 from employee; -- 소수 자름
select ceil(avg(salary)) 평균급여 from employee;
select trunc(avg(salary)) 평균급여 from employee;


select count(DISTINCT DEPT_CODE) 
    FROM EMPLOYEE;
select count(DEPT_CODE) 
    FROM EMPLOYEE; -- 21
select count(*) 
    FROM EMPLOYEE; -- 23
select count(*) 
    from EMPLOYEE 
    where dept_code is null;
    
--count(컬럼명)은 resultset의 row값이 null이라면 count 되지 않음    
-- count(*) row 개수
select count(DEPT_CODE), count(bonus), count(emp_id), count(manager_id), count(*)
    from EMPLOYEE 
    where dept_code is null;


-- distinct : 중복 값들을 하나로 처리
select count(DEPT_CODE), count(DISTINCT DEPT_CODE) 
    FROM EMPLOYEE; -- 21
    
select *
    from EMPLOYEE
;

select DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;


-- string a = (substring(emp_no, 8, 1)== 2 ? "여":"남";
--if(substr(emp_no, 8, 1) == 2){
--    return "여"'
--}else if(substr(emp_no, 8, 1) == 4){
--    return "여";
--}else if(substr(emp_no, 8, 1) == 1){
--    return "남";
--}else if(substr(emp_no, 8, 1) == 3){
--    return "남";
--}else {
--    return "그 외";
--}
--
--
--
--select substr(emp_no, 1, 6) from employee;


