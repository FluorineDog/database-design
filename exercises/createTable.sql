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
