desc tb_department;

-- 컬럼명 변경
alter table tb_department rename column CAPRCITY TO CAPACITY;

-- DATA TYPE변경
alter table tb_department modify department_name varchar2(20);
alter table tb_class modify class_name varchar2(30);
alter table tb_class modify class_type varchar2(20);

-- DICTIONARY 검색
select * from user_cons_columns where constraint_name = 'FK_TB_DEPARTMENT_TO_TB_STUDENT_1';
select * from user_constraints where constraint_name = 'FK_TB_DEPARTMENT_TO_TB_STUDENT_1';
select * from user_constraints where constraint_name = 'PK_TB_DEPARTMENT';
select * from user_cons_columns where constraint_name = 'PK_TB_DEPARTMENT';
select* from tb_department;

-- ORA-00001: 무결성 제약 조건 (KH.PK_TB_PROFESSOR)에 위배됩니다
-- 00001 -> UNIQUE항목

-- ORA-02291: 무결성 제약 조건 (KH.FK_TB_DEPARTMENT_TO_TB_STUDENT_1)에 위배됩니다
-- TB_DEPARTMENT 테이블의 DEPARTMENT_NO 컬럼의 컬럼 값과 같아야함.















