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
  tname char(100),
  tarea char(100),
  addr char(100)
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
('67','苟桂霖','男','1996')
go
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

insert into show values
('1','1','50','2018','2'),
('1','2','40','2018','2'),
('1','3','30','2018','2'),
('1','4','50','2018','2'),
('1','5','70','2018','2'),
('1','6','80','2018','2'),
('1','7','80','2018','2'),
('1','8','70','2018','2'),
('1','9','60','2018','2'),
('1','10','80','2018','2'),
('1','11','60','2018','2'),
('1','12','70','2018','2'),
('1','13','30','2018','2'),
('1','14','30','2018','2'),
('1','15','50','2018','2'),
('1','16','60','2018','2'),
('1','17','80','2018','2'),
('1','18','80','2018','2'),
('1','19','30','2018','2'),
('1','20','50','2018','2'),
('1','21','70','2018','2'),
('1','22','50','2018','2'),
('1','23','60','2018','2'),
('1','24','50','2018','2'),
('1','25','60','2018','2'),
('1','26','40','2018','2'),
('1','27','50','2018','2'),
('1','28','40','2018','2'),
('1','29','40','2018','2'),
('1','30','70','2018','2'),
('1','31','60','2018','2'),
('1','32','60','2018','2'),
('1','33','30','2018','2'),
('1','34','70','2018','2'),
('1','35','60','2018','2'),
('1','36','30','2018','2'),
('1','37','50','2018','2'),
('1','38','80','2018','2'),
('1','39','40','2018','2'),
('1','40','50','2018','2'),
('1','41','30','2018','2'),
('1','42','70','2018','2'),
('1','43','80','2018','2'),
('1','44','50','2018','2'),
('1','45','70','2018','2'),
('1','46','50','2018','2'),
('1','47','50','2018','2'),
('1','48','60','2018','2'),
('1','49','80','2018','2'),
('1','50','60','2018','2'),
('1','51','30','2018','2'),
('1','52','40','2018','2'),
('1','53','40','2018','2'),
('1','54','30','2018','2'),
('2','1','80','2018','1'),
('2','2','60','2018','1'),
('2','3','50','2018','1'),
('2','4','50','2018','1'),
('2','5','70','2018','2'),
('2','6','70','2018','1'),
('2','7','40','2018','1'),
('2','8','30','2018','1'),
('2','9','60','2018','1'),
('2','10','30','2018','1'),
('2','11','40','2018','1'),
('2','12','70','2018','1'),
('2','13','50','2018','1'),
('2','14','70','2018','1'),
('2','15','60','2018','1'),
('2','16','70','2018','1'),
('2','17','30','2018','1'),
('2','18','80','2018','1'),
('2','19','50','2018','1'),
('2','20','70','2018','1'),
('2','21','60','2018','1'),
('2','22','30','2018','1'),
('2','23','40','2018','1'),
('2','24','70','2018','1'),
('2','25','70','2018','1'),
('2','26','80','2018','1'),
('2','27','50','2018','1'),
('2','28','80','2018','1'),
('2','29','80','2018','1'),
('2','30','60','2018','1'),
('2','31','80','2018','1'),
('2','32','30','2018','1'),
('2','33','60','2018','1'),
('2','34','70','2018','1'),
('2','35','40','2018','1'),
('2','36','40','2018','1'),
('2','37','50','2018','1'),
('2','38','30','2018','1'),
('2','39','40','2018','1'),
('2','40','60','2018','1'),
('2','41','30','2018','1'),
('2','42','30','2018','1'),
('2','43','80','2018','1'),
('2','44','40','2018','1'),
('2','45','50','2018','1'),
('2','46','60','2018','1'),
('2','47','70','2018','1'),
('2','48','70','2018','1'),
('2','49','40','2018','1'),
('2','50','70','2018','1'),
('2','51','60','2018','1'),
('2','52','60','2018','1'),
('2','53','30','2018','1'),
('2','54','50','2018','1'),
('3','1','40','2018','2'),
('3','2','60','2018','2'),
('3','3','70','2018','2'),
('3','4','60','2018','2'),
('3','5','60','2018','2'),
('3','6','60','2018','2'),
('3','7','60','2018','2'),
('3','8','30','2018','2'),
('3','9','40','2018','2'),
('3','10','40','2018','2'),
('3','11','40','2018','2'),
('3','12','50','2018','2'),
('3','13','50','2018','2'),
('3','14','50','2018','2'),
('3','15','50','2018','2'),
('3','16','80','2018','2'),
('3','17','40','2018','2'),
('3','18','70','2018','2'),
('3','19','70','2018','2'),
('3','20','60','2018','2'),
('3','21','30','2018','2'),
('3','22','30','2018','2'),
('3','23','80','2018','2'),
('3','24','40','2018','2'),
('3','25','40','2018','2'),
('3','26','40','2018','2'),
('3','27','40','2018','2'),
('3','28','70','2018','2'),
('3','29','40','2018','2'),
('3','30','60','2018','2'),
('3','31','80','2018','2'),
('3','32','50','2018','2'),
('3','33','70','2018','2'),
('3','34','50','2018','2'),
('3','35','30','2018','2'),
('3','36','40','2018','2'),
('3','37','60','2018','2'),
('3','38','60','2018','2'),
('3','39','40','2018','2'),
('3','40','50','2018','2'),
('3','41','50','2018','2'),
('3','42','80','2018','2'),
('3','43','40','2018','2'),
('3','44','30','2018','2'),
('3','45','60','2018','2'),
('3','46','40','2018','2'),
('3','47','30','2018','2'),
('3','48','70','2018','2'),
('3','49','50','2018','2'),
('3','50','30','2018','2'),
('3','51','70','2018','2'),
('3','52','60','2018','2'),
('3','53','60','2018','2'),
('3','54','50','2018','2'),
('4','1','70','2015','7'),
('4','2','40','2015','7'),
('4','3','50','2015','7'),
('4','4','70','2015','7'),
('4','5','50','2015','7'),
('4','6','70','2015','7'),
('4','7','70','2015','7'),
('4','8','60','2015','7'),
('4','9','50','2015','7'),
('4','10','50','2015','7'),
('4','11','60','2015','7'),
('4','12','50','2015','7'),
('4','13','80','2015','7'),
('4','14','40','2015','7'),
('4','15','60','2015','7'),
('4','16','70','2015','7'),
('4','17','60','2015','7'),
('4','18','60','2015','7'),
('4','19','40','2015','7'),
('4','20','40','2015','7'),
('4','21','70','2015','7'),
('4','22','70','2015','7'),
('4','23','50','2015','7'),
('4','24','40','2015','7'),
('4','25','70','2015','7'),
('4','26','60','2015','7'),
('4','27','70','2015','7'),
('4','28','40','2015','7'),
('4','29','50','2015','7'),
('4','30','80','2015','7'),
('4','31','40','2015','7'),
('4','32','50','2015','7'),
('4','33','70','2015','7'),
('4','34','50','2015','7'),
('4','35','30','2015','7'),
('4','36','30','2015','7'),
('4','37','40','2015','7'),
('4','38','30','2015','7'),
('4','39','50','2015','7'),
('4','40','30','2015','7'),
('4','41','70','2015','7'),
('4','42','80','2015','7'),
('4','43','40','2015','7'),
('4','44','60','2015','7'),
('4','45','70','2015','7'),
('4','46','80','2015','7'),
('4','47','80','2015','7'),
('4','48','80','2015','7'),
('4','49','70','2015','7'),
('4','50','40','2015','7'),
('4','51','30','2015','7'),
('4','52','50','2015','7'),
('4','53','80','2015','7'),
('4','54','70','2015','7'),
('5','1','60','2018','2'),
('5','2','70','2018','2'),
('5','3','50','2018','2'),
('5','4','40','2018','2'),
('5','5','70','2018','2'),
('5','6','70','2018','2'),
('5','7','70','2018','2'),
('5','8','70','2018','2'),
('5','9','60','2018','2'),
('5','10','70','2018','2'),
('5','11','60','2018','2'),
('5','12','50','2018','2'),
('5','13','60','2018','2'),
('5','14','70','2018','2'),
('5','15','70','2018','2'),
('5','16','60','2018','2'),
('5','17','50','2018','2'),
('5','18','60','2018','2'),
('5','19','80','2018','2'),
('5','20','80','2018','2'),
('5','21','60','2018','2'),
('5','22','80','2018','2'),
('5','23','60','2018','2'),
('5','24','50','2018','2'),
('5','25','50','2018','2'),
('5','26','70','2018','2'),
('5','27','50','2018','2'),
('5','28','30','2018','2'),
('5','29','40','2018','2'),
('5','30','70','2018','2'),
('5','31','70','2018','2'),
('5','32','70','2018','2'),
('5','33','50','2018','2'),
('5','34','50','2018','2'),
('5','35','70','2018','2'),
('5','36','40','2018','2'),
('5','37','30','2018','2'),
('5','38','30','2018','2'),
('5','39','70','2018','2'),
('5','40','60','2018','2'),
('5','41','70','2018','2'),
('5','42','80','2018','2'),
('5','43','80','2018','2'),
('5','44','60','2018','2'),
('5','45','70','2018','2'),
('5','46','60','2018','2'),
('5','47','60','2018','2'),
('5','48','70','2018','2'),
('5','49','80','2018','2'),
('5','50','80','2018','2'),
('5','51','60','2018','2'),
('5','52','60','2018','2'),
('5','53','50','2018','2'),
('5','54','50','2018','2'),
('6','1','50','2016','1'),
('6','2','40','2016','1'),
('6','3','40','2016','1'),
('6','4','60','2016','1'),
('6','5','80','2016','1'),
('6','6','40','2016','1'),
('6','7','40','2016','1'),
('6','8','70','2016','1'),
('6','9','70','2016','1'),
('6','10','40','2016','1'),
('6','11','80','2016','1'),
('6','12','40','2016','1'),
('6','13','40','2016','1'),
('6','14','70','2016','1'),
('6','15','50','2016','1'),
('6','16','60','2016','1'),
('6','17','30','2016','1'),
('6','18','30','2016','1'),
('6','19','70','2016','1'),
('6','20','30','2016','1'),
('6','21','70','2016','1'),
('6','22','40','2016','1'),
('6','23','40','2016','1'),
('6','24','60','2016','1'),
('6','25','40','2016','1'),
('6','26','40','2016','1'),
('6','27','80','2016','1'),
('6','28','50','2016','1'),
('6','29','50','2016','1'),
('6','30','50','2016','1'),
('6','31','30','2016','1'),
('6','32','80','2016','1'),
('6','33','40','2016','1'),
('6','34','50','2016','1'),
('6','35','70','2016','1'),
('6','36','50','2016','1'),
('6','37','80','2016','1'),
('6','38','80','2016','1'),
('6','39','30','2016','1'),
('6','40','60','2016','1'),
('6','41','60','2016','1'),
('6','42','60','2016','1'),
('6','43','40','2016','1'),
('6','44','70','2016','1'),
('6','45','70','2016','1'),
('6','46','50','2016','1'),
('6','47','40','2016','1'),
('6','48','40','2016','1'),
('6','49','30','2016','1'),
('6','50','40','2016','1'),
('6','51','60','2016','1'),
('6','52','50','2016','1'),
('6','53','30','2016','1'),
('6','54','40','2016','1'),
('7','1','60','2013','12'),
('7','2','40','2013','12'),
('7','3','40','2013','12'),
('7','4','70','2013','12'),
('7','5','60','2013','12'),
('7','6','70','2013','12'),
('7','7','50','2013','12'),
('7','8','70','2013','12'),
('7','9','70','2013','12'),
('7','10','50','2013','12'),
('7','11','70','2013','12'),
('7','12','40','2013','12'),
('7','13','70','2013','12'),
('7','14','40','2013','12'),
('7','15','40','2013','12'),
('7','16','80','2013','12'),
('7','17','40','2013','12'),
('7','18','60','2013','12'),
('7','19','60','2013','12'),
('7','20','80','2013','12'),
('7','21','80','2013','12'),
('7','22','70','2013','12'),
('7','23','80','2013','12'),
('7','24','60','2013','12'),
('7','25','80','2013','12'),
('7','26','50','2013','12'),
('7','27','50','2013','12'),
('7','28','70','2013','12'),
('7','29','60','2013','12'),
('7','30','40','2013','12'),
('7','31','50','2013','12'),
('7','32','50','2013','12'),
('7','33','30','2013','12'),
('7','34','70','2013','12'),
('7','35','70','2013','12'),
('7','36','80','2013','12'),
('7','37','70','2013','12'),
('7','38','50','2013','12'),
('7','39','40','2013','12'),
('7','40','40','2013','12'),
('7','41','70','2013','12'),
('7','42','60','2013','12'),
('7','43','70','2013','12'),
('7','44','80','2013','12'),
('7','45','50','2013','12'),
('7','46','50','2013','12'),
('7','47','40','2013','12'),
('7','48','70','2013','12'),
('7','49','70','2013','12'),
('7','50','30','2013','12'),
('7','51','60','2013','12'),
('7','52','50','2013','12'),
('7','53','60','2013','12'),
('7','54','40','2013','12'),
('8','1','70','2014','12'),
('8','2','60','2014','12'),
('8','3','70','2014','12'),
('8','4','50','2014','12'),
('8','5','70','2014','12'),
('8','6','30','2014','12'),
('8','7','40','2014','12'),
('8','8','60','2014','12'),
('8','9','30','2014','12'),
('8','10','70','2014','12'),
('8','11','60','2014','12'),
('8','12','60','2014','12'),
('8','13','70','2014','12'),
('8','14','80','2014','12'),
('8','15','70','2014','12'),
('8','16','60','2014','12'),
('8','17','30','2014','12'),
('8','18','80','2014','12'),
('8','19','70','2014','12'),
('8','20','60','2014','12'),
('8','21','30','2014','12'),
('8','22','70','2014','12'),
('8','23','80','2014','12'),
('8','24','40','2014','12'),
('8','25','70','2014','12'),
('8','26','70','2014','12'),
('8','27','30','2014','12'),
('8','28','70','2014','12'),
('8','29','50','2014','12'),
('8','30','50','2014','12'),
('8','31','40','2014','12'),
('8','32','40','2014','12'),
('8','33','50','2014','12'),
('8','34','40','2014','12'),
('8','35','60','2014','12'),
('8','36','40','2014','12'),
('8','37','50','2014','12'),
('8','38','80','2014','12'),
('8','39','60','2014','12'),
('8','40','40','2014','12'),
('8','41','30','2014','12'),
('8','42','80','2014','12'),
('8','43','60','2014','12'),
('8','44','50','2014','12'),
('8','45','70','2014','12'),
('8','46','50','2014','12'),
('8','47','40','2014','12'),
('8','48','40','2014','12'),
('8','49','70','2014','12'),
('8','50','50','2014','12'),
('8','51','50','2014','12'),
('8','52','50','2014','12'),
('8','53','30','2014','12'),
('8','54','70','2014','12'),
('9','1','80','2015','7'),
('9','2','70','2015','7'),
('9','3','50','2015','7');
go
insert into show values
('9','4','30','2015','7'),
('9','5','60','2015','7'),
('9','6','80','2015','7'),
('9','7','30','2015','7'),
('9','8','30','2015','7'),
('9','9','40','2015','7'),
('9','10','60','2015','7'),
('9','11','40','2015','7'),
('9','12','30','2015','7'),
('9','13','40','2015','7'),
('9','14','50','2015','7'),
('9','15','70','2015','7'),
('9','16','70','2015','7'),
('9','17','40','2015','7'),
('9','18','80','2015','7'),
('9','19','40','2015','7'),
('9','20','50','2015','7'),
('9','21','30','2015','7'),
('9','22','80','2015','7'),
('9','23','50','2015','7'),
('9','24','50','2015','7'),
('9','25','70','2015','7'),
('9','26','30','2015','7'),
('9','27','40','2015','7'),
('9','28','40','2015','7'),
('9','29','70','2015','7'),
('9','30','30','2015','7'),
('9','31','50','2015','7'),
('9','32','40','2015','7'),
('9','33','30','2015','7'),
('9','34','60','2015','7'),
('9','35','50','2015','7'),
('9','36','50','2015','7'),
('9','37','70','2015','7'),
('9','38','70','2015','7'),
('9','39','40','2015','7'),
('9','40','70','2015','7'),
('9','41','40','2015','7'),
('9','42','40','2015','7'),
('9','43','80','2015','7'),
('9','44','40','2015','7'),
('9','45','60','2015','7'),
('9','46','30','2015','7'),
('9','47','30','2015','7'),
('9','48','70','2015','7'),
('9','49','30','2015','7'),
('9','50','40','2015','7'),
('9','51','50','2015','7'),
('9','52','30','2015','7'),
('9','53','60','2015','7'),
('9','54','70','2015','7'),
('10','1','30','2015','4'),
('10','2','70','2015','4'),
('10','3','40','2015','4'),
('10','4','60','2015','4'),
('10','5','80','2015','4'),
('10','6','50','2015','4'),
('10','7','40','2015','4'),
('10','8','40','2015','4'),
('10','9','60','2015','4'),
('10','10','60','2015','4'),
('10','11','40','2015','4'),
('10','12','80','2015','4'),
('10','13','40','2015','4'),
('10','14','30','2015','4'),
('10','15','40','2015','4'),
('10','16','80','2015','4'),
('10','17','60','2015','4'),
('10','18','70','2015','4'),
('10','19','50','2015','4'),
('10','20','60','2015','4'),
('10','21','80','2015','4'),
('10','22','50','2015','4'),
('10','23','30','2015','4'),
('10','24','30','2015','4'),
('10','25','40','2015','4'),
('10','26','70','2015','4'),
('10','27','50','2015','4'),
('10','28','40','2015','4'),
('10','29','40','2015','4'),
('10','30','30','2015','4'),
('10','31','70','2015','4'),
('10','32','50','2015','4'),
('10','33','50','2015','4'),
('10','34','50','2015','4'),
('10','35','70','2015','4'),
('10','36','60','2015','4'),
('10','37','30','2015','4'),
('10','38','40','2015','4'),
('10','39','60','2015','4'),
('10','40','80','2015','4'),
('10','41','40','2015','4'),
('10','42','60','2015','4'),
('10','43','30','2015','4'),
('10','44','70','2015','4'),
('10','45','70','2015','4'),
('10','46','70','2015','4'),
('10','47','60','2015','4'),
('10','48','70','2015','4'),
('10','49','40','2015','4'),
('10','50','60','2015','4'),
('10','51','80','2015','4'),
('10','52','80','2015','4'),
('10','53','60','2015','4'),
('10','54','70','2015','4'),
('11','1','70','2017','7'),
('11','2','80','2017','7'),
('11','3','40','2017','7'),
('11','4','60','2017','7'),
('11','5','80','2017','7'),
('11','6','80','2017','7'),
('11','7','40','2017','7'),
('11','8','50','2017','7'),
('11','9','70','2017','7'),
('11','10','30','2017','7'),
('11','11','40','2017','7'),
('11','12','70','2017','7'),
('11','13','80','2017','7'),
('11','14','30','2017','7'),
('11','15','70','2017','7'),
('11','16','50','2017','7'),
('11','17','50','2017','7'),
('11','18','40','2017','7'),
('11','19','30','2017','7'),
('11','20','60','2017','7'),
('11','21','50','2017','7'),
('11','22','80','2017','7'),
('11','23','70','2017','7'),
('11','24','40','2017','7'),
('11','25','50','2017','7'),
('11','26','30','2017','7'),
('11','27','50','2017','7'),
('11','28','50','2017','7'),
('11','29','50','2017','7'),
('11','30','30','2017','7'),
('11','31','60','2017','7'),
('11','32','60','2017','7'),
('11','33','60','2017','7'),
('11','34','30','2017','7'),
('11','35','40','2017','7'),
('11','36','60','2017','7'),
('11','37','40','2017','7'),
('11','38','50','2017','7'),
('11','39','70','2017','7'),
('11','40','40','2017','7'),
('11','41','40','2017','7'),
('11','42','70','2017','7'),
('11','43','50','2017','7'),
('11','44','50','2017','7'),
('11','45','40','2017','7'),
('11','46','40','2017','7'),
('11','47','70','2017','7'),
('11','48','70','2017','7'),
('11','49','60','2017','7'),
('11','50','80','2017','7'),
('11','51','70','2017','7'),
('11','52','70','2017','7'),
('11','53','60','2017','7'),
('11','54','70','2017','7'),
('12','1','40','2006','6'),
('12','2','60','2006','6'),
('12','3','60','2006','6'),
('12','4','70','2006','6'),
('12','5','40','2006','6'),
('12','6','70','2006','6'),
('12','7','50','2006','6'),
('12','8','40','2006','6'),
('12','9','30','2006','6'),
('12','10','50','2006','6'),
('12','11','60','2006','6'),
('12','12','50','2006','6'),
('12','13','60','2006','6'),
('12','14','40','2006','6'),
('12','15','30','2006','6'),
('12','16','40','2006','6'),
('12','17','70','2006','6'),
('12','18','80','2006','6'),
('12','19','80','2006','6'),
('12','20','40','2006','6'),
('12','21','70','2006','6'),
('12','22','80','2006','6'),
('12','23','30','2006','6'),
('12','24','80','2006','6'),
('12','25','40','2006','6'),
('12','26','50','2006','6'),
('12','27','50','2006','6'),
('12','28','80','2006','6'),
('12','29','70','2006','6'),
('12','30','50','2006','6'),
('12','31','70','2006','6'),
('12','32','60','2006','6'),
('12','33','30','2006','6'),
('12','34','60','2006','6'),
('12','35','40','2006','6'),
('12','36','60','2006','6'),
('12','37','80','2006','6'),
('12','38','50','2006','6'),
('12','39','50','2006','6'),
('12','40','40','2006','6'),
('12','41','60','2006','6'),
('12','42','80','2006','6'),
('12','43','40','2006','6'),
('12','44','70','2006','6'),
('12','45','70','2006','6'),
('12','46','40','2006','6'),
('12','47','80','2006','6'),
('12','48','70','2006','6'),
('12','49','70','2006','6'),
('12','50','40','2006','6'),
('12','51','30','2006','6'),
('12','52','50','2006','6'),
('12','53','70','2006','6'),
('12','54','80','2006','6')
select * from actin;

insert into theater values
('1','金逸国际影城南湖店','洪山区','武昌区丁字桥南路518号南国南湖城市广场3楼'),
('2','洪山天河影城','洪山区','湖北省洪山区珞瑜路6号'),
('3','光谷正华银兴影城','洪山区','洪山区民族大道158号光谷时间广场3楼'),
('4','华谊兄弟光谷天地影院','洪山区','洪山区关山大道光谷天地F1区三楼'),
('5','巨幕影城光谷广场资本大厦店','洪山区','洪山区光谷广场光谷资本大厦四楼'),
('6','CGV星聚汇影院光谷店','洪山区','东湖新技术开发区光谷步行街4期德国风情街8号楼3F'),
('7','华夏国际影城鲁广店','洪山区','东湖高新技术开发区珞喻路 726 号'),
('8','CGV国际影城','洪山区','湖北青山区和平大道809号奥山世纪广场3楼'),
('9','天河欢乐汇影城','洪山区','书城路18号欢乐汇大楼5层'),
('10','银兴菲林佰港城店','洪山区','北港村文治街武昌府维佳佰港城广场四楼'),
('11','幸福蓝海国际影城雄楚店','洪山区','雄楚大道888号金地中心城雄楚一号4楼'),
('12','耀莱成龙国际影城','洪山区','珞喻路889号融众国际大厦6-7层'),
('13','万达影城春树里店','武昌区','武昌区中北路166号岳家嘴东湖春树里购物中心四层'),
('14','洪山礼堂','武昌区','武昌区洪山路81号'),
('15','洪山礼堂银兴电影城','武昌区','水果湖洪山路81号洪山礼堂'),
('16','金逸国际影城店','武昌区','湖北省武昌徐东大街18号销品茂5楼'),
('17','湖北剧院银兴影城','武昌区','武昌区阅马场湖北剧院一楼、四楼'),
('18','江汉环球电影城','武昌区','武昌区司门口解放路464号原江汉剧场户部巷对面'),
('19','亚贸兴汇影城','武昌区','武昌区武珞路628号亚贸广场购物中心6楼'),
('20','横店影视电影城武昌店','武昌区','张之洞路南国首义汇广场南三楼'),
('21','金逸国际影城中南店','武昌区','武昌区武昌武珞路442号'),
('22','银兴菲林影城福克茂店','武昌区','湖北武昌区友谊大道团结村路福客茂五楼'),
('23','银兴菲林国际影城群星城店','武昌区','徐东大街120号群星城五楼'),
('24','星美国际影城漫时区店','武昌区','友谊大道福星惠誉漫时区3栋3楼星美国际影城'),
('25','卢米埃凯德181影城','武昌区','武昌区中北路23号凯德广场1818中心七楼'),
('26','华夏国际影城后湖百步亭店','江岸区','江岸区后湖大道268号新生活摩尔城3楼'),
('27','中影国际影城东购店','江岸区','江岸区二七路汉口东部购物公园C2栋4楼'),
('28','CGV星星国际影城','江岸区','江岸区芦沟桥路28号 天地11号楼'),
('29','奥斯卡上东汇影城','江岸区','湖北武昌区江岸区黄浦路68号，上东汇广场6楼，161医院旁'),
('30','城市广场摩尔国际电影城','江岸区','后湖大道111号汉口城市广场A座3楼'),
('31','银兴乐天电影城','江汉区','江汉区万松园路100号西园步行街三楼'),
('32','武商摩尔国际电影城','江汉区','江汉区解放大道690号7、8楼'),
('33','万达影城菱角湖店','江汉区','江汉区新华西路唐家墩5号，菱角湖万达广场娱乐楼四层'),
('34','万达国际电影城','江汉区','江汉区交通路1号万达商业广场C座二层'),
('35','环艺电影城','江汉区','中山大道608号新民众乐园4楼'),
('36','金逸国际影城杨汊湖店','江汉区','江汉区姑嫂树路12号，南国北都城市广场3F'),
('37','泛海国际影城','江汉区','云彩路198号泛海城市购物中心五层'),
('38','银兴乐天影城江夏店','江夏区','江夏大道128号附1号中央大街2号楼4层'),
('39','大地数字影院宜家','江夏区','江夏区兴新街宜佳广场四楼'),
('40','大地影院江夏店','江夏区','江夏区兴新街136号宜佳广场四楼东侧'),
('41','高德国际影城','江夏区','文华路37号中百广场6楼'),
('42','金逸国际影城武胜路店','硚口区','兰州市安宁区安宁西路3号康桥国际购物中心5层'),
('43','橙天嘉禾南国西汇影城','硚口区','解放大道387号汉口宗关水厂南国西汇城市广场二期5楼'),
('44','金逸IMAX荟聚店','硚口区','长宜路1号荟聚购物中心4层金逸影城'),
('45','武商众圆摩尔国际电影城','青山区','和平大道959号武商众圆广场4—5楼'),
('46','金逸国际影城王家湾店','汉阳区','汉阳区王家湾龙阳大道特6号摩尔城C区5楼'),
('47','汉阳天河国际影城','汉阳区','汉阳大道687号，汉商21购物娱乐中心三楼'),
('48','大地影院-汉阳新世界','汉阳区','汉阳区鹦鹉大道27号新世界百货5楼'),
('49','百老汇影院','汉阳区','龙阳大道58号汉阳人信汇商业中心A座4层'),
('50','金逸国际影城吴家山北冰洋店','东西湖区','吴家山四明路北冰洋城市广场4楼'),
('51','CGV星聚汇影城金银潭店','东西湖区','将军路街道办事处金银潭大道1号永旺梦乐城三层'),
('52','横店电影城汇和店','东西湖区','东西湖区花园中路轨道交通2号线常青花园地铁站汇和城购物中心五楼'),
('53','大地数字影院湘隆时代广场','蔡甸区','沌口经济技术开发区宁康路湘隆时代广场B1栋5楼'),
('54','华谊兄弟黄陂影城','黄陂区','黄陂区黄陂大道387号黄陂广场C座');
go