show tables;

create table exhibition (
	idx int not null auto_increment primary key,
	name varchar(50) not null,							/* 국명 */
	SName varchar(100) not null,						/* 학명 */
	CName varchar(100) not null,						/* 종분류 */
	EName varchar(100) not null,						/* 영명 */
	distribution varchar(50) not null,			/* 분포 */
	food varchar(50) not null,							/* 식성 */
	breedInfo varchar(50) not null,					/*생육 정보 */
	content text not null										/* 특징 */
);

desc exhibition;
drop table exhibition;