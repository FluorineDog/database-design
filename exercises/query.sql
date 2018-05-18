-- -- 1
-- select *
-- from show
-- where show.fid = (select fid
--   from film
--   where fname = '战狼2'
-- ) and year='2017'
-- order by month desc;
-- go
-- -- 2
-- select *
-- from film
-- where not EXISTS(
--   select *
-- from actin
-- where actin.fid = film.fid
-- )
-- order by ftype asc, grade desc
-- go
-- -- 3
-- select fid, fname, dname
-- from film
-- where not exists(
--   select *
-- from show
-- where show.fid = film.fid and year <= 2017
-- )
-- go
-- -- 4 
-- select fid
-- from show 
-- group by fid 
-- having count(distinct tid) = (select count(distinct tid) from theater)
-- go
-- -- 5
-- select fid, fname, dname, grade 
-- from film
-- where grade not between 80 and 90
-- go
-- -- 6
-- select dname, max(grade) as max_grade, min(grade) as min_grade
-- from film 
-- group by dname
-- go
-- -- 7
-- select dname, count(fid) as film_count
-- from film
-- group by dname 
-- having count(fid) >= 2
-- go
-- 8 
select dname, count(fid) as film_count, avg(grade) as aver_grade
from film
where grade >= 80
group by dname
having count(fid) >= 2
go
-- 9
-- 9
select dname, actor.actid, aname
from film, actin, actor
where dname in 
(select dname as film_count
  from film
  group by dname
  having count(fid) >= 2
) and actin.actid = actor.actid 
go
-- 10
select actid, avg(grade) as avg_grade
from actin
where isleading = 'Y'
group by actid
go
-- 11


-- select fid, year, month from show
-- group by fid
-- order by year asc, month asc
