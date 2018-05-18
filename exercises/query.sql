-- 1
select *
from show
where show.fid = (select fid
  from film
  where fname = '战狼2'
) and year='2017'
order by month desc;
go
-- 2
select *
from film
where not EXISTS(
  select *
from actin
where actin.fid = film.fid
)
order by ftype asc, grade desc
go
-- 3
select fid, fname, dname
from film
where not exists(
  select *
from show
where show.fid = film.fid and year <= 2017
)
go
-- 4 
select fid
from show
group by fid
having count(distinct tid) = (select count(distinct tid)
from theater)
go
-- 5
select fid, fname, dname, grade
from film
where grade not between 80 and 90
go
-- 6
select dname, max(grade) as max_grade, min(grade) as min_grade
from film
group by dname
go
-- 7
select dname, count(fid) as film_count
from film
group by dname
having count(fid) >= 2
go
8
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
select fid, en.year, en.month
from film, (
  select top 1
    year, month
  from show
  where show.fid=show.fid
  order by year asc, month asc
) as en
go
-- 12 
select fid, en.year, en.month, tid
from film, (
  select top 1
    year, month, tid
  from show
  where show.fid=show.fid
  order by year asc, month asc
) as en
go
-- 13
select fid, count(*) as film_count
from show
group by fid
go
-- 14
select dname
from film
where ftype like '%[警匪|枪战|动作]%'
go
-- 15 
select film.fid, fname, tname, year, month
from film, show, theater
where show.fid = film.fid and show.tid = theater.tid and fname like '%战狼%'
go
-- 16
select distinct s1.tid
from show as s1 join show as s2 on s1.fid = 1 and s2.fid = 2 and s1.tid = s2.tid and s1.year = s2.year and s1.month = s2.month
-- 17
select actid, aname
from actor
where not exists(
  select *
from actin, film
where actin.actid = actor.actid and film.fid = actin.fid and film.grade < 85
)
go
-- 18
select aname
from actin, film, actor
where actin.actid = actor.actid and film.fid = actin.fid and dname='吴宇森'
-- 19
select actor.actid, aname, fname
from (actor left join (actin join film on actin.fid = film.fid) on actor.actid=actin.actid)
go
-- 20
select film.fid, fname
from film, show
where film.fid = show.fid
group by film.fid
having avg(grade)=NULL