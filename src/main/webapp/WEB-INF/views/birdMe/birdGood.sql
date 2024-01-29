
create table birdgood (
	idx int not null auto_increment primary key,
	part varchar(20) not null,				/* 분류 */
	partIdx int not null,             /* 분류의 고유번호 */
	mid varchar(20) not null,
	foreign key(mid) references signUser(mid)
);

SELECT * FROM birdgood WHERE part = 'birdMe' and partIdx = 1 and mid = 'qkrwjdgkgk12';

SELECT count(*) FROM birdgood WHERE part = 'birdMe' and partIdx = 1 and mid = 'qkrwjdgkgk12';

drop table birdgood;