select student_name, student_ssn, entrance_date from tb_student;


select student_name, student_ssn, entrance_date 
        , extract(year from to_date(substr(student_ssn, 1, 2), 'rr'))birth
        , extract(year from entrance_date) entr
        , extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1, 2), 'rr'))+1 aaa
    from tb_studentl
    where extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1, 2), 'rr'))+1 > 20    
;

select student_name, student_ssn, entrance_date 
        , case 
            when (substr(student_ssn, 1, 2)) > 23 then substr(student_ssn, 1, 2)+1900
            else sybstr(student_ssn, 1, 2)+200
            end birth
        , extract(year from entrance_date) entr
        , extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1, 2), 'rr'))+1 aaa
    from tb_studentl
    where extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1, 2), 'rr'))+1 > 20    
;