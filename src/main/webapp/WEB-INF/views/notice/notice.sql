-- 공지 사항 테이블
create table notice(
	idx 		int not null auto_increment primary key,
	title 	varchar(50) not null,  -- 공지 게시글 제목
	attch 	varchar(200) not null, -- 파일 첨부
	writer  varchar(30) not null,  -- 작성자
	content text not null,         -- 공지사항 작성 내용
	wDate 	datetime default now() -- 작성일
);

drop table notice;