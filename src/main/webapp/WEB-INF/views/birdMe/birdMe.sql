show tables;

create table birdMe (
	idx int not null auto_increment primary key,
	title    varchar(100) not null,														/* 제목 */
	observer varchar(30)  not null,													/* 관찰자 */
	wDate    datetime default now(),													/* 관찰일 */
	location varchar(100) not null,													/* 발견 장소 */
	readNum  int not null default 0,												/* 조회수  */
	content  text  not null																	/* 관찰 내용 */
);

drop table birdMe;

select * from birdMe;

desc birdgood;

SELECT *, (select count(*) from birdGood where part='birdMe' and mid='qkrwjdgkgk12' and partIdx=m.idx) as goodSw FROM birdMe m order by idx desc;
