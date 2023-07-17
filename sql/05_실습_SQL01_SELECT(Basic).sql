

-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 
-- 단, 출력 헤더는 "학과명", "계열"으로 표시하도록 한다
select department_name, category
    from tb_department;
    
-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.
select department_name||'의 정원은'||count(*)||'명 입니다.' as "과별 정원"
    from tb_department td
        left join tb_student using (department_no)
    group by department_name;

-- 3. "국어국문학과"에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이 들어왔다.
-- 누구인가? (국문학과의 '학과코드'는 학과 테이블을 조회)
select student_name
    from tb_student ts, tb_department td
    where ts.department_no = td.department_no
    and td.department_name = '국어국문학과'
    and ts.absence_yn = 'Y'
    and substr(student_ssn, 8, 1) = '2'
    order by ts.student_name
;

-- 4. 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시하고자 한다.
-- 그 대상들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 sql 구문을 작성하시오
select student_name
    from tb_student
    where student_no in('A513079','A513090','A513091','A513110','A513119')
ORDER BY student_name desc
;

-- 5. 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오
select department_name, category
    from tb_department
    where capacity between 20 and 30
;

-- 6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고있다.
-- 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오
 SELECT professor_name
    from tb_professor
    where department_no is null;

-- 7. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다.
-- 어떠한 SQL 문장을 사용하면 될 것인지 작성하시오.
select student_name
    from tb_student
        where department_no is null;

-- 8. 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데,
-- 선수과목이 존재하는 과목들은 어떤 과목인지 과목번호를 조회해보시오.
select class_no
    from tb_class
    where preattending_class_no is not null;

select category
    from tb_department
    group by category
    order by category;
    
select student_no, student_name, student_ssn
    from tb_student
    where student_no like 'A2%'
        and student_address like '전주%'
        and absence_yn = 'N'
    order by student_name
    ;

select * from tb_class;
select * from tb_department;
select * from tb_professor;
select * from tb_class_professor;
select * from tb_student;
select * from tb_grade;





















