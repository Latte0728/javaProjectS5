show tables; 

create table reservation(
	idx 			int not null auto_increment primary key,
	title 		varchar(100) not null,								/* 교육 제목 #  */
	writeDate	datetime default now(),								/* 공지 올린 날짜 */											
	startDate datetime default now(),								/* 교육 시작 날짜 # */
	endDate 	datetime default now(),								/* 교육 종료 날짜 # */
	training 	varchar(20) not null,									/* 교육 대상 # */
	recruit	 	int not null,													/* 모집 정원 # */
	content		text not null,												/* 교육 내용 # */
	readNum		int default 0	/* 조회수*/
);

desc  reservation;

drop table reservation;

select * from reservation order by idx desc;

select * from reservation where  order by idx desc;

create table reservationInfo(
	idx int not null auto_increment primary key,
	mid varchar(30) not null, /* 신청자의 ID */ 
	wDate datetime default now(), /* 신청 일자 */
	recruit int not null, /* 참가 인원 */
	content text not null, /* 내용 */
	foreign key(mid) references signUser(mid)
);

desc reservationInfo;

drop table reservationInfo;
