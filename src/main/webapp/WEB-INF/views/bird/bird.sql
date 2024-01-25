show tables;

create table bird(
	idx int not null auto_increment primary key,
	title varchar(100) not null,
	photo varchar(100)
);

drop table bird;

desc bird;