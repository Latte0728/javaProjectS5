show tables;

create table qrCode (
  idx    int not null auto_increment primary key,
  guideIdx int not null,						/* 도감의 고유 번호 */
  guideUrl varchar(50) not null,				/* QR코드를 통해 이동할 주소 */
  qrCodeName varchar(100) not null,		/* qr코드 이미지 파일명 */
  foreign key (guideIdx) references guide(idx)
);

desc qrCode;
drop table qrCode;

select * from qrCode;
select * from qrCode where qrCodeName = '20231229140122_노량_죽음의바다_2023-12-29_14시30분_1_0admin';

select *,(select qrCodeName from qrCode where guideIdx = q.idx) as qrCodeName from guide q order by idx desc limit 0,10;
