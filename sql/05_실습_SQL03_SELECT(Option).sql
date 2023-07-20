
-- 1. 학생이름과 주소지를 표시하시오.
-- 단, 출력헤더는 "학생이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록한다.

select student_name as"학생 이름", student_address as "주소지"
    from tb_student
    order by 1
;

-- 2. 휴학 중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
select student_name, student_ssn
    from tb_student
    where absence_yn = 'Y'
order by 2 desc;

-- 3. 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 이름과 학번,
-- 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 헤더엔 학생이름, 학번, 거주지주소
select student_name as"학생이름", student_no as "학번", student_address as "거주지주소"
    from tb_student
    where student_no not like 'A%' AND
        (student_address like '강원도%' or student_address like '경기도%')
--     혹은 substr(STUDENT_ADDRESS, 1, 3) in ('강원도', '경기도') and
order by 1;


-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오
select professor_name, professor_ssn
    from tb_professor tp 
        join tb_department td using(department_no)
    where department_no = '005'
order by 2;

-- 5. 2004년 2학기에 C318800 과목을 수강한 학생들의 학점을 조회하려고 한다.
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오
SELECT student_no, point
    from tb_grade
        where class_no = 'C3118100' and term_no = '200402'
            order by 2 desc, 1 asc;

-- 6. 학생번호, 학생이름, 학과이름을 학생이름으로 오름차순 정렬하여 출력하는 sql 문을 작성하시오
select student_no, student_name, department_name
    from tb_student ts 
        join tb_department td using (department_no) 
            order by student_name;

-- 7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL문장을 작성하시오.
SELECT class_name, department_name
    from tb_class tc 
        join tb_department td using (department_no)
;
    
-- 8. 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL문을 작성하시오.
SELECT class_name, professor_name
    from tb_class 
        join tb_professor using (department_no);

-- 9. 8번 결과 중 인문사회 계열에 속한 과목의 교수 이름을 찾으려고 한다.
-- 이에 해당하는 과목이름과 교수 이름을 출력하는 SQL문을 작성하시오.
SELECT class_name, professor_name
    from tb_class tc
        join tb_department td using (department_no)
        join tb_professor tp using (department_no)
            where category = '인문사회'
;
-- 10. 음악학과 학생들의 평점을 구하려고한다. 음악학과 학생들의 학번, 학생이름, 전체 평점을
-- 출력하는 SQL문장을 작성하시오 단, 평점은 소수점 1자리까지만 반올림하여 표시한다.
SELECT student_no as"학번", student_name as"학생 이름", round(avg(point),1) as"전체 평점"
    from tb_student ts
        join tb_grade tg using (student_no)
        join tb_department using (department_no)
            where department_name = '음악학과'
                group by student_no, student_name
;
--ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
--00937. 00000 -  "not a single-group group function"
--                group by student_no, student_name -- 작성




-- 11. 학번이 A313047인 학생이 학교에 나오고 있지않다. 지도 교수에게 내용을 전달하기 위한 
-- 학과이름, 학생 이름과 지도 교수 이름이 필요하다. 이때 사용할 SQL 문을 작성하시오
select department_name as "학과 이름", student_name as "학생이름", professor_name as "지도교수이름"
    from tb_student ts
        join tb_department td using (department_no)
        join tb_professor tp ON ts.coach_professor_no = tp.professor_no
            where student_no = 'A313047';

-- 12. 2007년도에 인간관계론 과목을 수강한 학생을 찾아 학생이름과 수강학기를 표시하는 SQL 문장을 작성.
SELECT student_name, term_no
    from tb_grade 
        join tb_class using (class_no)
        join tb_student using (student_no)
        where class_name = '인간관계론' and substr(term_no, 1, 4) = '2007'
        order by 2;

-- 13. 예체능 계열 과목 중 담당 교수를 한 명도 배정받지 못한 과목을 찾아 그 과목 이름과 학과이름을 출력하는 SQL 문장을 작성하시오.

-- 14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자한다.학생이름과 지도교수 이름을 찾고 만일 지도교수가 없는 학생인 경우
--"지도교수 미지정"으로 표시하도록하는 SQL문을 작성하시오. 학생이름, 지도교수, 

-- 15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그학생의 학번, 이름, 평점을 출력하는 SQL문을 작성하시오
select * from 
(
SELECT student_no, round(avg(point),1) avgPoint
    FROM (select * from tb_student where absence_yn <> 'Y')S
        JOIN TB_DEPARTMENT D USING (DEPARTMENT_NO)
        JOIN TB_GRADE G using (student_no)
    group by student_no
) tb1
where tb1.avgPoint >= 4.0
;
-- 혹은 
SELECT student_no, round(avg(point),1) avgPoint
    FROM (select * from tb_student where absence_yn <> 'Y')S
        JOIN TB_DEPARTMENT D USING (DEPARTMENT_NO)
        JOIN TB_GRADE G using (student_no)
    group by student_no
    having round(avg(point),1) >= 4.0
;

SELECT student_name, d.department_name, round(avg(point),1) avgPoint
    FROM (select * from tb_student where absence_yn <> 'Y')S
        JOIN TB_DEPARTMENT D USING (DEPARTMENT_NO)
        JOIN TB_GRADE G using (student_no)
        -- student_no, student_name, d.department_name는 join절과 같은 값으로 묶여지므로 select에서 사용하도록 group by에 포함.
    group by student_no, student_name, d.department_name -- 같은 학과 동명이인 - student_no를 포함
    having avg(point) >= 4 -- round하지 않아야함. select로 화면에 나타낼때 round하여 나타냄.
;
SELECT student_name
-- group by 사용시 group by에 사용한 컬럼명만 select에 사용할 수 있음. + 그리고 그룹함수 사용가능
-- 스칼라 subquery라도 불가능함.
        , (select department_name from tb_department t where t.department_no = s.department_no) department_name
        , round(avg(point),1) avgPoint
    FROM (select * from tb_student where absence_yn <> 'Y')S
        JOIN TB_GRADE G using (student_no)
        -- student_no, student_name, d.department_name는 join절과 같은 값으로 묶여지므로 select에서 사용하도록 group by에 포함.
    group by student_no, student_name -- d.department_name -- 같은 학과 동명이인 - student_no를 포함
    having avg(point) >= 4 -- round하지 않아야함. select로 화면에 나타낼때 round하여 나타냄.
;

-- 16. 환경조경학과 전공과목들의 과목 별 평점을 파악할 수 있는 SQL문을 작성하시오.
select class_no, class_name, AVG(POINT)
    FROM tb_class c
        left join tb_grade g using (class_no)
        left join tb_department d using (department_no)
            where d.department_name = '환경조경학과'
        group by class_no, class_name
    order by 1 
;        
-- 17. 춘 기술대학교에 다니고있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는 SQL문을 작성하시오.
select student_name, student_address
    from tb_student s
        join tb_department d using(department_no)
        
;

-- 18. 국어국문학과에서 총 병점이 가장 높은 학생의 이름과 학번을 표시하는 SQL문을 작성하시오
select rownum rn, tb1.* from 
(
select student_no, student_name, avg(point) avgPoint
    from (
        -- 국어국문학과 학생 추출
        select * from tb_student where department_no = 
                                        (select department_no from tb_department where department_name = '국어국문학과')
        )s
            join tb_grade g using (student_no)
        group by student_no , student_name
        order by avgpoint desc
) tb1
where rownum = 1 
;
select student_name
    from (
        -- 국어국문학과 학생 추출
        select * from tb_student where department_no = 
                                        (select department_no from tb_department where department_name = '국어국문학과')
        )s
            join tb_grade g using (student_no)
        group by student_no , student_name
        having avg(point) = (select max(avg(point)) tb_grade g group by g.student_no)       
;

select max(avg(point)) 
    from tb_grade g 
        where student_no in (select student_no from tb_student where department_no = 
                            (select department_no from tb_department where department_name = '국어국문학과') 
        group by g.student_no;

select student_no from tb_student where department_no = 
                            (select department_no from tb_department where department_name = '국어국문학과') 
;

-- 19. 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL문을 찾아내시오
-- 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록하고, 평점은 소수점 한 자리까지만 반올림하여 표시되도록 한다.

desc TB_STUDENT;
desc TB_DEPARTMENT;
desc TB_GRADE;
desc TB_CLASS;
desc TB_PROFESSOR;

select * from TB_department;
select * from TB_student;
select * from TB_grade;
select * from TB_CLASS;
select * from TB_professor;












