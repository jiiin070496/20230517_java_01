----------------------------------
--Chun Univ.
----------------------------------
alter session set "_ORACLE_SCRIPT"=true;
create user techuniv identified by univ;
grant connect, resource, dba to techuniv;
