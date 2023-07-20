--춘 4 - DDL
--15. 춘 기술대학교는 매년 수강신청 기간만 되면 특정 인기 과목들에 수강신청이 몰려 문제가 되고있다.
--    최근 3년을 기준으로 수강인원이 가장 많았던 3과목을 찾는 구문을 작성하시오.

--최근3년
select term curr_term from (select distinct substr(term_no,1,4)term from tb_grade order by 1 desc) where rownum <= 3
;

-- CLASS_NO 별 수강인원
select count(*) cnt, class_no
    from tb_grade
    group by class_no
    order by 1 desc
;

-- 수강인원 top3 => n-top(ROWNUM)
select * from
(
select count(*) cnt, class_no from tb_grade group by class_no order by 1 desc
)tb1
where rownum <= 3
;

--수강인원 구하기 전 최근 3년이라는 조건으로 걸러낸 후 수강인원을 구해야함.
select class_no as"과목번호", (select class_name from tb_class where class_no = tb2.class_no) as"과목이름", cnt as"누적수강생수(명)"from
(
select rownum rn, tb1.* from
(
select count(*) cnt, class_no
    from tb_grade
    where substr(term_no,1,4) in (select term curr_term from (select distinct substr(term_no,1,4)term from tb_grade order by 1 desc) where rownum <= 5)
    group by class_no
    order by 1 desc
)tb1
)tb2
where rn <=3
;







