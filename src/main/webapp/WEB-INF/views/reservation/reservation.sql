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
	readNum		int default 0													/* 조회수 */
);

desc  reservation;

drop table reservation;

select * from reservation order by idx desc;

select * from reservation where  order by idx desc;

create table reservationInfo(
	idx int not null auto_increment primary key,
	reservationIdx int  not null,  /* 이벤트 고유 번호*/
	mid varchar(30) not null, /* 신청자의 ID */ 
	wDate datetime default now(), /* 신청 일자 */
	recruit int not null, /* 참가 인원 */
	content text not null, /* 내용 */
	foreign key(mid) references signUser(mid),
	foreign key(reservationIdx) references reservation(idx)
);
desc reservationInfo;
drop table reservationInfo;

select i.*,r.title from reservationInfo i, reservation r where i.reservationIdx = r.idx and i.mid = 'qkrwjdgkgk12' order by idx desc;


select i.*,r.title,r.startDate,r.endDate,datediff(r.startDate, now()) as date_diff from reservationInfo i, reservation r where i.reservationIdx = r.idx and i.mid = 'qkrwjdgkgk12' order by idx desc; 
 
