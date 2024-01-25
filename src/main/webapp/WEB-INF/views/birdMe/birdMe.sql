show tables;

create table birdMe (
	idx int not null auto_increment primary key,
	title    varchar(100) not null,														/* 제목 */
	observer varchar(30)  not null,													/* 관찰자 */
	wDate    datetime default now(),													/* 관찰일 */
	location varchar(100) not null,													/* 발견 장소 */
	readNum  int not null default 0,												/* 조회수  */
	content  text  not null																				/* 관찰 내용 */
);

drop table birdMe;

select * from birdMe;
