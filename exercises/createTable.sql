drop table if exists show;
drop table if exists theater;
drop table if exists actin;
drop table if exists actor;
drop table if exists film;

create table film
(
  fid int primary key,
  fname char(30),
  ftype char(30),
  dname char(30),
  length int,
  is3d char(1),
  grade int,
  dat char(30),
  CONSTRAINT RG_film_grade check (grade >= 0 and grade <= 100)
);
create table actor
(
  actid int primary key,
  aname char(30),
  sex char(2),
  byear int,
  CONSTRAINT RG_SEX check (sex in ('男', '女'))
);

create table actin
(
  actid int REFERENCES actor(actid),
  fid int REFERENCES film(fid),
  isleading char(1),
  grade int,
  constraint PK_actid_fid primary key (actid, fid),
  -- CONSTRAINT FK_fid FOREIGN KEY(fid) REFERENCES film(fid),
  -- CONSTRAINT FK_actid FOREIGN KEY(actid) REFERENCES actor(actid),
  CONSTRAINT RG_actin_grade check (grade >= 0 and grade <= 100),
  CONSTRAINT RG_isleading check (isleading in ('Y', 'N'))
);

create table theater
(
  tid int primary key,
  tname char(20),
  tarea char(20),
  addr char(30)
);
create table show
(
  fid int,
  tid int,
  price int,
  year int,
  month int,
  constraint PK_fid_tid primary key (fid, tid)
);
go
insert into film(fid, fname, ftype, dname, length, is3d, grade, dat)
values
('1','红海行动','动作/剧情','林超贤','138','Y','92','18/02/16'),
('2','无问西东','剧情/爱情/战争','李芳芳','138','N','71','18/01/12'),
('3','捉妖记2','喜剧/奇幻/动作','许诚毅','110','N','59','18/02/16'),
('4','捉妖记','喜剧/奇幻/动作','许诚毅','118','Y','72','15/07/16'),
('5','唐人街探案2','喜剧/动作/悬疑','陈思诚','120','N','71','18/02/16'),
('6','美人鱼','喜剧/奇幻/爱情','周星驰','93','Y','74','16/01/08'),
('7','风暴','动作/犯罪/剧情','袁锦麟','109','N','66','13/12/12'),
('8','太平轮（上）','爱情/剧情/战争','吴宇森','128','N','58','14/12/02'),
('9','太平轮·彼岸','情/历史/战争','吴宇森','126','N','62','15/07/30'),
('10','战狼','动作/战争','吴京','90','N','82','15/04/02'),
('11','战狼2','动作/战争','吴京','123','Y','92','17/07/27'),
('12','疯狂的石头','犯罪/喜剧',NULL,'98','N',NULL,'06/06/30'),
('13','追捕','动作/剧情','吴宇森','106','N','65','17/11/24'),
('14','幸福马上来','喜剧','冯巩','100','N',NULL,'18/06/08');
select * from film;
go
insert into actor  values
('1','张译','男','1978'),
('2','黄景瑜','男','1992'),
('3','海清','女','1978'),
('4','杜江','男','1985'),
('5','章子怡','女','1979'),
('6','张震','男','1976'),
('7','黄晓明','男','1977'),
('8','王力宏','男','1976'),
('9','梁朝伟','男','1962'),
('10','白百何','女','1984'),
('11','井柏然','男','1989'),
('12','曾志伟','男','1953'),
('13','柳岩','女','1980'),
('14','吴君如','女','1965'),
('15','刘德华','男','1961'),
('16','姚晨','女','1979'),
('17','宋慧乔','女','1982'),
('18','章子怡','女','1979'),
('19','金城武','男','1973'),
('20','吴京','男','1974'),
('21','卢靖姗','女','1985'),
('22','余男','女','1978'),
('999','吴肇敏','男','1998')
go
select * from actin;
insert into actin values
('1','1','Y','81'),
('2','1','Y','72'),
('3','1','Y','84'),
('4','1','Y','64'),
('5','2','Y','67'),
('6','2','Y','84'),
('7','2','Y','49'),
('8','2','Y','88'),
('9','3','Y','92'),
('10','3','Y','73'),
('10','4','Y','73'),
('11','3','Y','67'),
('11','4','Y','67'),
('12','3','N','80'),
('12','4','N','80'),
('13','3','N','62'),
('14','3','N','83'),
('14','4','N','83'),
('15','7','Y','91'),
('16','7','Y','78'),
('17','8','Y','90'),
('17','9','Y','90'),
('18','8','Y','85'),
('18','9','Y','85'),
('19','8','Y','92'),
('19','9','Y','92'),
('20','10','Y','78'),
('20','11','Y','70'),
('21','11','Y','85'),
('22','10','Y','75')
go

select * from actin;