--1 
----see createTable.sql
--2
drop table if EXISTS young_actor;
create table young_actor
(
  actid int primary key,
  aname char(30),
  sex char(2),
  byear int,
  CONSTRAINT RG_YA_SEX check (sex in ('男', '女'))
);
go
insert into young_actor
select *
from actor
where byear >= 1990 and byear < 2000
;
select *
from young_actor;
go
--3
---- use cmd instead of SQL lang. ignored
--4
drop table if EXISTS dup;
create table dup
(
  id int
);
insert into dup
values
  (1),
  (1)
select *
from dup;
go
----- observation: have duplicated tuples in table.
delete from dup where id=1;
select *
from dup;
go
----- obsevation: two tuples are both deleted
-- 5
drop view if EXISTS actor80;
go
create view actor80
as
  select actor.actid, aname, sex, byear, movie_count, max_score
  from actor left join (select actid, count(fid) as movie_count, max(grade) as max_score
    from actin
    where isleading = 'Y'
    group by actid) as tmp on actor.actid=tmp.actid
  where byear >= 1980 and byear < 1990;
  go
select *
from actor80
go
select *
from film
where dname = '周星驰';
go
-- 6
drop trigger if exists zxc_commedy;
go
create trigger zxc_commedy
on film
after
insert
as
update film set ftype = '喜剧' where dname = '周星驰' and exists(
  select *
  from inserted
  where inserted.fid = film.fid
);
go
insert into film
  (fid, fname, dname)
values
  ('2333', 'cry', '周星驰');
select *
from film
where dname = '周星驰';
go

