
-- 1. 영어영문학과(학과코드 002)학생들의 학번과 이름, 입학년도를 입학년도가 빠른 순으로 표시하는 SQL문장을 작성하시오
select student_no as "학번", student_name as "이름", entrance_date as "입학년도"
    from tb_student
        join tb_department using (department_no)
        where department_no = '002'
    order by 3;
    
-- 2. 춘 기술대학교의 교수 중 이름이 세글자가 아닌 교수가 한 명 있다고 한다.
-- 그 교수의 이름과 주민번호를 화면에 출력하는 SQL문장을 작성해보자.
select professor_name, professor_ssn
    from tb_professor
    where professor_name not like '___'
;

-- 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오
-- 단, 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오.
select professor_name as "교수 이름", 
    extract(year from sysdate) - (substr(professor_ssn,1, 2)+1900) as "나이"
    from tb_professor
    where substr(professor_ssn, 8, 1) = 1
    order by professor_ssn desc
;

-- 4. 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오.
-- 출력 헤더는 "이름"이 찍히도록 한다.(성이 2자인 교수는 없다.)
select substr(professor_name, 2) as "이름"
    from tb_professor
;

-- 5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가?
select student_no, student_name
    from tb_student
    where (100+substr(entrance_date, 1, 2)) - substr(student_ssn, 1, 2) > 19;
-- where (case when student_no like 'A%' then 100+substr(entrance_date,1,2)-(substr(student_ssn,1,2))
--        else substr(entrance_date,1,2)-(substr(student_ssn,1,2)) end) > 19;

-- 6. 2020년 크리스마스는 무슨 요일인가?
select to_char(to_date(20201225, 'yyyymmdd'), 'dy') as "2020년 크리스마스"
    from dual;

-- 8. 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다.
-- 2000년도 이전 학번을 받은 학생들의 학번과 이름을 보여주는 sql문장을 작성하시오.
select student_no, student_name
    from tb_student
    where student_no like '9%';

-- 9. 학번이 A517178인 한아름 학생의 학점 종 평점을 구하는 SQL문을 작성하시오
-- 단, 이때 출력화면의 헤더는 "평점" 이라고 찍히게하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.
select round(avg(point), 1) as "평점"
    from tb_student
        join tb_grade using (student_no)
    where student_no = 'A517178';

-- 10. 학과별 학생 수를 구하여 "학과번호","학생수(명)"의 형태로 헤더를 만들어 결과값이 출력되도록 하시오.
select department_no as "학과번호", count(*) as "학생수(명)"
    from tb_student 
    group by department_no
    order by department_no;

-- 11. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는지 알아내는 sql 문을 작성하시오.
select count(*)
    from tb_student
    where coach_professor_no is null;

-- 12. 학번이 A112113인 김고운 학생의 년도 별 평점을 구하는 sql문을 작성하시오.
-- 단, 이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이리하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.
select substr(term_no,1, 4) as "년도", round(avg(point),1) as "년도 별 평점"
    from tb_grade
    where student_no = 'A112113'
    GROUP BY substr(term_no,1, 4)
;

-- 13. 학과별 휴항생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을 작성하시오
SELECT DEPARTMENT_NO as"학과코드명", COUNT(*)as"휴학생 수"
    FROM tb_student
        where absence_yn = 'Y'
        group by department_no
    order by 1
;


-- 14. 춘 대학교에 다니는 동명이인 학생들의 이름을 찾고자 한다. 어떤 SQL문장을 사용하면 가능하겠는가?
SELECT student_name as "동일이름", count(*) as"동명인 수"
    from tb_student
    group by student_name
        having count(*)>=2
    order by 1;





select * from tb_class;
select * from tb_department;
select * from tb_professor;
select * from tb_class_professor;
select * from tb_student;
select * from tb_grade;