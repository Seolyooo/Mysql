/*
	  날짜: 2025/08/08
      이름 : 설유진
      내용 : 3장 제약조건 실습
*/


-- 실습 3-1
create table user2(
	uid		varchar(10) primary key, 
    name	varchar(10), 
    birth	char(10),
    addr	varchar(50)
);
-- 실습 3-2
insert into user2 values ('a101','김유신','1999-09-19','김해');

-- 실습 3-3
create table user3(
	uid varchar(10) primary key,
    name varchar(10),
    birth char(10),
    hp char(13) unique, -- 중복된 값을 허용하지 않음
    addr varchar(50)
);
-- 실습 3-4
insert into user3 values ('a101','김유신','1999-09-19','010-1234-1001','김해');
insert into user3 values ('a102','김춘추','1999-09-20','010-1234-1002','김해');
insert into user3 values ('a103','장보고','1999-09-20',null,'완도');
insert into user3 values ('a104','강감찬','1999-09-21',null,'서울');
-- 실습 3-5
create table parent(
	pid varchar(10) primary key,
    name varchar(10),
    birth char(10),
    addr varchar(100)
);
create table child(
	cid varchar(10) primary key,
    name varchar(10),
    hp char(13) unique,
    parent varchar(10),
    foreign key(parent) references parent(pid) -- 존재하지 않는 parent의 pid 값 입력을 차단
);
-- 실습 3-6
insert into parent values('p101','홍길동','1999-09-09','부산');
insert into child values ('c101','홍아들','010-1234-2001','p101');
insert into child values ('c102','김아들','010-1234-2002','p110');


-- 실습 3-7
create table user4(
	uid varchar(10) primary key,
    name varchar(10) not null,			-- 반드시 입력 허용
    gender char(1), -- 모든 컬럼의 default 는 null
    age int default 1,
    hp char(13) unique,    -- unique default 는 null
    addr varchar(20)
);

-- 실습 3-8
insert into user4 values ('a101','김유신','m',23,'010-1234-0001','김해');
insert into user4 values ('a102','신사임당','f',23,null,'김해');

-- 실습 3-9
create table user5(
	seq int primary key auto_increment,
name varchar(10) not null,
gender char(1) check (gender in ('m','f')),
age int default 1 check (age >0 and age<100),
addr varchar(20)
);

-- 실습 3-10
insert into user5(name,gender,age,addr) values('김유신','m',25,'김해');
insert into user5(name,gender,age,addr) values('신사임당','f',25,'김해');
delete from user5 where seq=2;

insert into user5(name,gender,age,addr) values('허난설현','f',25,'김해');
