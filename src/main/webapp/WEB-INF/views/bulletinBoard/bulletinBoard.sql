show tables;

-- 부모글 테이블
create table bulletinBoard(
	idx int not null auto_increment primary key,
	title   varchar(100)  not null,		/* 게시글 제목 */
	mid			varchar(50) not null,			/* 작성자(아이디)*/
	nickName varchar(30) not null,		/* 작성자(닉네임) */
	wDate datetime default now(),			/* 작성 일자 */
	content text not null,						/* 게시글 내용 */
	readNum int not null default 0,		/* 조회수 */
	good		int default 0							/* '좋아요' 클릭 횟수 누적 */  
);

insert into bulletinBoard values(default, '잘 보고 갑니다.', '라떼','카페라떼',default,'가족여행',default,default);

drop table bulletinBoard;
desc bulletinBoard;

-- 댓글 테이블
create table bulletinBoardReply(
	idx int not null auto_increment,
	bulletinBoardIdx	int not null,		/* 원본글(부모글)의 고유번호(외래키로 설정) */
 	re_step		int not null,						/* 레벨(re_step값)에 따른 들여쓰기(계층번호) : 부모 댓글의 re_step은 1이다, 대댓글의 경우는 부모 re_step +1로 처리. */
  re_order	int not null,						/* 댓글의 순서를 결정한다, 부모 댓글은 1번, 대댓글의 경우는 부모댓글보다 큰 대댓글에 대하여 're_order + 1'시키고, 자신은 부모댓글의 re_order보다 1개 더 증가시킨다. */
  mid				varchar(50) not null,		/* 댓글 올린이의 아이디 */
  nickName  varchar(30) not null,		/* 댓글 올린이의 닉네임 */
  wDate			datetime default now(),	/* 댓글 올린 날짜 */
  content   text  not null,					/* 댓글 내용 */
	primary key(idx),
	foreign key(bulletinBoardIdx) references bulletinBoard(idx)
	on update cascade			/* 부모필드를 수정하면 함께 영향을 받는다. */
  on delete restrict		/* 부모필를 함부로 삭제할수 없다. */
);

drop table bulletinBoardReply;
desc bulletinBoardReply;

-- 신고 테이블
create table 	bulletinBoardComplaint(
	idx int not null auto_increment,
	bulletinBoardIdx	int not null,
	mid varchar(30) not null, -- 신고자의 아이디
	wDate datetime default now(), -- 신고 일자
	content text not null, -- 신고 내용
	primary key(idx),
	foreign key(bulletinBoardIdx) references bulletinBoard(idx)
);

drop table bulletinBoardComplaint;
-- 전체 bulletinBoard 테이블의 내용을 최신순으로 출력
SELECT * FROM bulletinBoardComplaint ORDER BY idx desc;