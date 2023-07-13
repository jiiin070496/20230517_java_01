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

-- 날짜 처리 함수
select sysdate from dual;

-- 날짜 처리 함수 months_Between : 인자로 날짜 두 개를 전달받아 개월 수 차이를 숫자 데이터형으로 변환
select emp_name, hire_date, months_between(sysdate, hire_date)
    from employee;

--날짜 처리 함수 ADD_MONTHS : 개월 수 +
select EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6)
    FROM EMPLOYEE;

-- NEXT_DAY : 인자로 받은 요일이 가장 가까운 날짜 반환
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일')FROM EMPLOYEE;

--LAST_DAY : 인자로 전달받은 날짜가 속한 달의 마지막 날짜 변환
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE) FROM EMPLOYEE;

--EXTRACT : 년, 월, 일 정보 추출하여 반환
SELECT 

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

-- 형변환 함수
-- TO_CHAR
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')
    TO_CHAR(HIRE_DATE, 'YY/MON, DAY, DY')
        FROM EMPLOYEEL
    ;

-- TO_DATE
SELECT EMP_NO, EMP_NAME, HIRE_DATE
    FROM EMPLOYEE
    WHERE HIRE_DATE > TO_DATE(20000101, 'YYYYMMDD') -- 2000년도 이후에 입사한 사원의 사번, 이름, 입사일 조회
;
-- TO_NUMBER : 날짜 혹은 문자형 데이터를 숫자형 데이터로 변환하여 반환
SELECT TO_NUMBER('1,000,000', '99,999,999')-TO_NUMBER('550,000', '999,000') FROM DUAL;

-- NULL 처리 함수 NVL: NULL로 되어있는 컬럼의 값을 인자로 지정한 숫자 혹은 문자로 변경하여 반환
SELECT EMP_NO, EMP_NAME, SALARY, NVL(BONUS, 0),(SALARY+(SALARY*NVL(BONUS, 0))*12
    FROM EMPLOYEE
    ;
--선택 함수
--DECODE : 비교하고자 하는 값 또는 컬럼이 조건식과 같으면 결과 값 반환
SELECT EMP_ID, EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남', '2', '여') AS 성별
    FROM EMPLOYEE
    ;
    
-- CASE: 비교하고자 하는 값 또는 컬럼이 조건식과 같으면 결과값 반환(조건은 범위 값 가능)
-- CASE 예시1
SELECT EMP_ID, EMP_NAME, EMP_NO, CASE WHEN SUBSTR(EMP_NO, 8, 1)=1 THEN '남자'
    ELSE '여자' END AS 성별
        FROM EMPLOYEE
        ;

-- CASE 예시2
SELECT EMP_NAME, SALARY, 
    CASE WHEN SALARY > 5000000 THEN '1등급'
         WHEN SALARY > 3500000 THEN '2등급'
         WHEN SALARY > 2000000 THEN '3등급'
    ELSE '4등급'
    END 월급루팡
        FROM EMPLOYEE
        ;

-- 그룹 함수
-- SUM: 해당 컬럼 값들의 총합 반환
-- EMPLOYEE TABLE에서 남자 사원의 급여 총합 조회
SELECT SUM(SALARY) 
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) = 1;
    
-- EMPLOYEE TABLE에서 부서코드가 DS인 직원의보너스 포함 연봉 조회
SELECT SUM(SALARY+(SALARY*NVL(BONUS, 0)*12)
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5'
    ;

-- AVG: 해당 컬럼 값들의 평균 반환
--EMPLOYEE 테이블에서 전 사원의 보너스 평균을 소수 셋 째 자리에서 반올람 한 것 조회
SELECT ROUND(AVG(NVL(BONUS, 0)),2) -- NVL을 하지 않을 시 NULL값을 가진 행은 평균 계산에서 제외되어 계산 
    FROM EMPLOYEE
    ;

-- COUNT : 테이블 조건을 만족하는 행의 개수 반환
--EMPLOYEE 테이블에서 전체 사원 수 조회
SELECT COUNT(*)
    FROM EMPLOYEE;
--EMPLOYEE 테이블에서 부서코드가 D5인 직원의 수 조회
SELECT COUNT(DEPT_CODE)
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5'
    ;
-- EMPLOYEE 테이블에서 사원드이 속해있는 부서의 수 조회
SELECT COUNT(DISTINCT DEPT_CODE)
    FROM EMPLOYEE
    ;
--부서코드와 급여 3000000 이상인 직원의 그룹별 평균 조회
select avg(salary)
    from employee
    where salary >= 3000000
    group by dept_code
    order by 1
;    

--부서코드와 급여 3000000 이상인 그룹조회
select dept_code, floor(avg(salary))
    from employee
    group by dept_code
    having  floor(avg(salary)) >= 3000000
    order by dept_code
;        

-- 사원명, 부서번호, 부서명, 부숴위치를 조회
select employee.emp_name, employee.dept_code, department.dept_title, department.location_id, location.national_code 
    from employee te
        join department on employee.dept_code = department.dept_id
        join location on department.location_id = location.local_code
        join national tv4 on 
        -- join 조건에 사용되는 컬럼명이 다르면 using 사용 불가
;

select emp_id c1, emp_name c2, job_code c3, job_name c4
    from employee 
        join job using(job_code)
        ;

select emp_id ei, emp_name en, dept_code dc, dept_title dt
    from employee
    join department on dept_code = dept_id
    ;


select *
    from employee e -- 기준
        join department d on e.dept_code = d.dept_id
    ;

select *
    from employee e -- 기준
        left outer join department d on e.dept_code = d.dept_id
    ;
    
select *
    from employee e -- 기준
        right outer join department d on e.dept_code = d.dept_id
    ;

select *
    from employee e -- 기준
        full outer join department d on e.dept_code = d.dept_id
    ;
    
select emp_name, dept_title
    from employee, department
        where dept_code(+) = dept_id
    ;

select emp_name as 이름, dept_title as 부서명
    from employee
    cross join department
    ;
select emp_name, salary, e.sal_level
    from employee e
    join sal_grade s on (salary between min_sal and max_sal)
;    

select e.emp_id, e.emp_name 사원이름, e.dept_code, e.manager_id, m.emp_name 관리자이름
    from employee e, employee m
        where e.manager_id = m.emp_id
;
desc employee;

-- 단일행 서브쿼리
-- 전 직원의 급여 평균보다 많은 급여를 받는 직원의 이름, 직급, 부서, 급여조회
select emp_id, emp_name, job_code, salary
    from employee
    where salary >= (select avg(salary) from employee)
;
-- 다중행 서브쿼리, 부서 별 최고 급여를 받는 직원의 이름, 직급, 부서, 급여 조회
select emp_name, job_code, dept_code, salary
    from employee
    where salary in
    (select MAX(salary)
    from employee
    group by dept_code)
        order by 3
;



-- 다중열 서브쿼리, 퇴사한 여직원과 같은 부서, 같은 직급에 해당하는 사원의 이름, 직급, 부서, 입사일 조회
select emp_name, job_code, dept_code, hire_date
    from employee
    where (dept_code, job_code)in 
    (select dept_code, job_code 
    from employee 
    where substr(emp_no, 8, 1)=2 and ent_yn = 'y')
;



-- 다중행, 다중열 서브쿼리, 직급별 최소 급여를 받는 직원의 사번, 이름, 직급, 급여 조회

select emp_id, emp_name, job_code, salary
    from employee
    where (job_code, salary)
    in (select job_code, min(salary)
        from employee
        group by job_code)
    order by job_code
    ;

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;

-- inline-view 
select rownum, emp_name, salary
    from employee
    where rownum <= 5
    order by rownum
;

--with
with lclass as
    (select emp_name, salary
    from employee
    order by salary asc)
select rownum, emp_name, salary
from lclass;

--rank over()
select 월급순위, emp_name, salary
    from (select emp_name, salary,
        rank()over(order by salary desc) as 월급순위
        from employee
        order by salary desc
    )
;
-- dense_rank()over
select 순위, emp_name, salary
from(select emp_name, salary
        dense_rank()over (order by salary desc) as 순위
        from employee
        order by salary desc
);

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
    where sal_level = 's1'
    ;

-- 8. EMPLOYEE 테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회

-- 9. EMPLOYEE 테이블에 월급이 4000000 이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 and JOB_CODE = 'j2'
;

---------------------------------------------------------------------------
--GROUPING SETS
select dept_code, job_code, manager_id, floor(avg(salary))
    from employee
        group by grouping sets ((dept_code, job_code, manager_id), 
                                (dept_code, manager_id),
                                (job_code, manager_id))
;
select dept_code, job_code, manager_id, floor(avg(salary))
    from employee
        group by dept_code, job_code, manager_id
;

---------------------------------------------------------------------------
--UNIQUE 예시
CREATE TABLE USER_UNIQUE(
    user_no number, 
    user_id varchar2(20) UNIQUE, 
    user_pwd varchar2(30) not null,
    user_name varchar2(30),
    gender varchar2(10),
    phone varchar2(30),
    email varchar2(50)
);

insert into user_unique values(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'asd@nate.net');

-- UNIQUE 예시2
CREATE TABLE USER_UNIQUE2(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(30)NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    UNIQUE (USER_ID)
);

INSERT INTO USER_UNIQUE2 VALUES(1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', 'asd@nate.net');

--UNIQUE 예시3

CREATE TABLE  USER_UNIQUE3(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(30)NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    UNIQUE (USER_NO, USER_ID)
);

select * from user_UNIQUE2;
INSERT INTO USER_UNIQUE3 VALUES(1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', 'asd@nate.net');
INSERT INTO USER_UNIQUE3 VALUES(2, 'USER01', 'PASS01', NULL, NULL, '010-1234-4567', 'asd@nate.net')
---------------------------------------------------------------------------
-- PRIMARY KEY 예시

CREATE TABLE USER_PRIMARYKEY(
    USER_NO NUMBER PRIMARY KEY, 
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50)   
);
INSERT INTO USER_PRIMARYKEY VALUES(1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', 'asd@nate.net');
INSERT INTO USER_PRIMARYKEY VALUES(1, 'USER02', 'PASS02', '냄궁', '남', '010-1234-4567', 'KOONG@nate.net');
INSERT INTO USER_PRIMARYKEY VALUES(1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', 'asd@nate.net');

CREATE TABLE USER_PRIMARYKEY2(
    USER_NO NUMBER,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(20),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    PRIMARY KEY (USER_NO, USER_ID)
);

INSERT INTO USER_PRIMARYKEY2 VALUES(1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', 'asd@nate.net');
INSERT INTO USER_PRIMARYKEY2 VALUES(1, 'USER02', 'PASS02', '냄궁', '남', '010-1234-4567', 'KOONG@nate.net');
INSERT INTO USER_PRIMARYKEY2 VALUES(2, 'USER01', 'PASS01', '쏘롱', '여', '010-1234-4567', 'SSOL@nate.net');
select * from user_PRIMARYKEY;
---------------------------------------------------------------------------
--FOREIGN KEY 예시
CREATE TABLE USER_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR(30) NOT NULL
);

INSERT INTO USER_GRADE VALUES(10, '일반회원');
INSERT INTO USER_GRADE VALUES(20, '우수회원');
INSERT INTO USER_GRADE VALUES(30, '특별회원');

SELECT * FROM USER_GRADE;
DROP TABLE USER_FOREIGNKEY;
CREATE TABLE USER_FOREIGNKEY(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR(20) UNIQUE,
    USER_PWD VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR(30),
    GENDER VARCHAR(10),
    PHONE VARCHAR(30),
    GRADE_CODE NUMBER,
    FOREIGN KEY (GRADE_CODE)    

        --여기 CONSTRAINT 이름 정해주기. 
        -- FK_USER_FOREIGNKEY_GRADE_CODE_USER_GRADE        
        --자동생성 SYS_0000000
            REFERENCES USER_GRADE(GRADE_CODE) ON DELETE CASCADE
);

CREATE TABLE USER_FOREIGNKEY2(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR(20) UNIQUE,
    USER_PWD VARCHAR(30) NOT NULL,
    USER_NAME VARCHAR(30),
    GENDER VARCHAR(10),
    PHONE VARCHAR(30),
    GRADE_CODE NUMBER REFERENCES USER_GRADE(GRADE_CODE)
);

INSERT INTO USER_FOREIGNKEY VALUES (1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', '10');
INSERT INTO USER_FOREIGNKEY VALUES (2, 'USER02', 'PASS02', '냄궁', '남', '010-1234-4568', '20');
INSERT INTO USER_FOREIGNKEY VALUES (3, 'USER03', 'PASS03', '쏘롱', '여', '010-1234-4569','30');
INSERT INTO USER_FOREIGNKEY VALUES (4, 'USER04', 'PASS04', '신사임당', '여', '010-1234-4560',NULL);
-- 오류 INSERT INTO USER_FOREIGNKEY VALUES (5, 'USER05', 'PASS05', '안중근', '남', '010-1234-4560',50);

SELECT * FROM USER_FOREUGHKEY;

CREATE TABLE USER_FOREIGNKEY3(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODE NUMBER CONSTRAINS FK_USER_FOREIGNKEY_GRADE_CODE_USER_GRADE REFERENCES USER_GRADE(GRADE_CODE) ON DELETE CASCADE
);


DELETE FROM USER_GRADE WHERE GRADE_CODE = 10;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_FOREIGNKEY3;


CREATE TABLE USER_FOREIGNKEY4(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODE NUMBER REFERENCES USER_GRADE(GRADE_CODE) ON DELETE CASCADE
);

DELETE FROM USER_GRADE WHERE GRADE_CODE = '10';
---------------------------------------------------------------------------

CREATE TABLE USER_CHECK(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(10), --CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    CHECK(GENDER IN('남','여')) 
);

INSERT INTO USER_CHECK VALUES (1, 'USER01', 'PASS01', '홍길동', '남', '010-1234-4567', 'jiiiin12@nate.net');
SELECT * FROM USER_CHECK;


----------------------------------------------------------
-- 7_DML
insert into employee
values(1, '홍길동', '850114-1010101', 'asdjkl@naver.com', '01012345678', 'D5', 'J2', 'S4',3800000,
        NULL, '200', SYSDATE, NULL, DEFAULT);

insert into employee
values(900, '장채현', '850114-1010101', 'jang_ch@naver.com', '01012345678', 'D1', 'J8', 'S3',4300000,
        0.2, '200', SYSDATE, NULL, DEFAULT);

-- insert 예시2
create table emp_01(
    emp_id number,
    emp_name varchar2(30),
    dept_title varchar2(20)
);

insert into emp_01(
    select emp_id,
        emp_name,
        dept_title
        from employee
        left join department on (dept_code = dept_id)
);

select * from employee;

-- insert all 예시1
insert all
into emp_dept_d1 values(emp_id, emp_name, dept_code, hire_date)
into emp_manager values(emp_id, emp_name, manager_id)
select emp_id, emp_name, dept_code, hire_date, manager_id
from employee
where dept_code = 'D1';

-- insert all 예시2
create table emp_old
as select emp_id, 
            emp_name,
            hire_date,
            salary
    from employee
    where 1 = 0;

create table emp_new
as select emp_id, 
            emp_name,
            hire_date,
            salary
    from employee
    where 1 = 0;

insert all
when hire_date < '2000/01/01' then
        into emp_old values (emp_id, emp_name, hire_date, salary)
        when hire_date >= '2000/01/01' then
        into emp_new values (emp_id, emp_name, hire_date, salary)
select emp_id, emp_name, hire_date, salary
from employee;

select * from emp_old;
select * from emp_new;

-- UPDATE 예시2
create table emp_salary
as select emp_id,
            emp_name,
            dept_code,
            salary,
            bonus
    from employee;
    
select * from emp_salary
where emp_name in ('유재식','방명수');

update emp_salary
set salary = (select salary
            from emp_salary
            where emp_name = '유재식'),
    bonus = (select bonus
            from emp_salary
            where emp_name = '유재식')
where emp_name = '방명수';

-- UPDATE 예시3
update emp_salary
set (salary, bonus) = 
        (select salary, bonus
        from emp_salary
        where emp_name = '유재식')
where emp_name = '방명수';

select * from emp_salary
where emp_name in ('유재식','방명수');

update emp_salary
set bonus = 0.3
where emp_id in 
(select emp_id
from employee
join department on(dept_id = dept_code)
join location on (location_id = local_code)
where local_name like 'ASIA%');

-- DELETE 예시1
delete from employee
where emp_name = '장채현';

-- DELETE 예시2 제약조건 비활성화
delete from department
where dept_id = 'D1';

alter table employee
disable constraint emp_deptcode_fk cascade; -- 활성화 enable constraint emp_deptcode_fk;



----------------------------------------------------------
create table DEPT_COPY as select * from DEPARTMENT;
-- 8_DDL 
-- 컬럼 추가
alter table dept_copy
add(cname varchar2(20));

alter table dept_copy
add(lname varchar(40)default'한국');
-- 제약조건 추가
alter table dept_copy
add constraint dcopy_did_pk primary key(dept_id);
add constraint dcopy_dtitle_uno UNIQUE(dept_title);
modify lname constraint dcopy_lname_nn NOT NULL;

select uc.constraint_name,
       uc.constraint_type,
        uc.table_name,
        ucc.culumn_name,
        uc.search_condition
        from user_constraints uc
        join user_cons_column ucc on(uc.constraint_name=ucc.constraint_name)
        where uc.table_name = 'dept_copy';

-- 컬럼 수정
alter table dept_copy
    modify dept_id char(3)
    modify dept_title varchar(30)
    modify location_id varchar(2)
    modify lname default '미국';
desc dept_copy;


-- 컬럼 삭제
alter table dept_copy
drop column dept_id;

select * from tb1;
create table TB1(
    pk number primary key,
    fk number references tb1,
    col1 number,
    check(pk > 0 and col1 > 0)
);
 alter table tb1
    drop column pk; -- 참조하고 있는 컬럼이 있다면 컬럼 삭제 불가능

 alter table tb1
    drop column PK cascade constraint; 

-- 제약조건 삭제
alter table dept_copy
    drop constraint dcopy_did_pk
    drop constraint dcopy_dtitle_unq
    modify lname null;
    
-- 컬럼 이름 변경
alter table dept_copy
rename column dept_title to dept_name;

select * from dept_test;

-- 테이블 이름 변경
alter table dept_copy
rename to dept_test;

-- DROP 싹다 삭제
drop table dept_test cascade constraint;

---------------------------------------------------
-- VIEW
-- 예시 1
create or replace view v_employee as 
select emp_id, emp_name, dept_title, national_name
    from employee
    left join department on (dept_id = dept_code)
    left join location on (location_id = local_code)
    left join national using(national_code);

select * from v_employee;

-- 예시2
--create or replace view v_emp_job as 
--select emp_id, emp_name, job_name,
--        decode(substr(emp_no, 8, 1), 1, '남', 2, '여')
--        extract(year from sysdate)- extract(year from hire_date)
--from employee
--join job using(job_code);

CREATE OR REPLACE VIEW v_emp_job(사번, 이름, 직급, 성별, 근무년수)AS
SELECT emp_id, emp_name, job_name,
       decode(substr(emp_no, 8, 1), 1, '남', 2, '여'),
       extract(year from sysdate) - extract(year from hire_date)
FROM employee
JOIN job USING (job_code);
select * from v_emp_job;

-- 예시 3
CREATE OR REPLACE VIEW v_job AS
SELECT j1.job_code as 사번, j1.job_name as 이름
    from job j1;
    
insert into v_job;
SELECT * From v_job; 

---------------------------------------------------------------------
-- 여기까지 20230713_KH
---------------------------------------------------------------------