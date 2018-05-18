-- --1 
-- --2
-- drop view if EXISTS  young_actor;
-- go
-- create view young_actor
-- as
--   select *
--   from actor
--   where byear >= 1990 and byear < 2000;
-- go
-- --3
-- --4
-- drop table if EXISTS dup;
-- create table dup
-- (
--   id int
-- );
-- insert into dup
-- values
--   (1),
--   (1)
-- select *
-- from dup;
-- go
-- -- create view actor80 as 
-- --   select actid, aname, byear, movie_count, max_score 
-- --   from actor left join (
-- --     select actid, count(*) as movie_count, max(grade) as max_score from actin
-- --     where isleading = 'Y' 
-- --     group by actid
-- --   )
-- -- create view actor80
-- drop view if EXISTS actor80;
-- go
-- create view actor80
-- as
--   select actor.actid, aname, sex, byear, movie_count, max_score
--   from actor left join (select actid, count(fid) as movie_count, max(grade) as max_score
--     from actin
--     where isleading = 'Y'
--     group by actid) as tmp on actor.actid=tmp.actid
--   where byear >= 1980 and byear < 1990;
--   go
-- select *
-- from actor80
-- go
select *
from film where dname = '周星驰';
go
-- create TRIGGER zxc_commedy
-- on film
-- for insert 
-- as 
-- begin
--   update on inserted
--   set ftype
--   ='喜剧' where newTuple.dname = '周星驰'
-- -- if (newTuple.dname = '周星驰')
-- -- then newTuple.ftype = '喜剧'
-- end
-- when dname='周星驰'
-- begin 
-- end
create trigger zxc_commedy
on film
after
insert
as
update film set ftype = '喜剧' where dname = '周星驰' and exists(
  select * from inserted where inserted.fid = film.fid
);
go
insert into film(fid, fname, dname) values ('2333', 'cry', '周星驰');
select * from film where dname = '周星驰';
go

