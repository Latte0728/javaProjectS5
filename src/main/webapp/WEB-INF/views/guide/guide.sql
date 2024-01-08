show tables;

create table guide (
	idx  int not null auto_increment primary key,
	bird_name    			varchar(30) not null,				/* 이름			*/	
	bird_SName  			varchar(30) not null,				/* 학명*/
	bird_class				varchar(30) not null,				/* 목/과*/
	bird_species 			varchar(30),								/* 주요 종	*/
	bird_advent  			varchar(100) not null,			/* 	도래 현황*/
	bird_observe			varchar(30) not null,				/* 관찰 시기*/
	bird_frequency		varchar(10) default '흔함',		/* 관찰 빈도*/
	bird_Breedtype		varchar(50) not null,				/* 번식지 유형*/
	bird_Habitattype	varchar(50) not null,				/* 서식지 유형*/
	bird_Mainbreed		varchar(10) not null,				/* 주요 번식지*/
	bird_Mainhabit		varchar(10) not null,				/* 주요 서식지*/
	bird_shape				text not null,							/* 외형*/
	bird_beak					varchar(50) not null,				/* 부리*/
	bird_tail					varchar(50) not null,	   		/* 꼬리*/
	bird_size					varchar(50) not null, 			/* 크기*/
	bird_system				varchar(30) not null, 			/* 생활 방식*/
	bird_hunt					varchar(50) not null, 			/* 사냥 방식*/
	bird_food					varchar(30) not null, 			/* 먹이*/
	bird_etc					text not null, 							/* 기타*/
	photo		  				varchar(250) default 'noimage.jpg',
	unique key (bird_name)
);

drop table guide;

desc guide;