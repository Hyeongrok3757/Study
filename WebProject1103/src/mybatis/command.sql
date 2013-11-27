
- 자유게시판 테이블

CREATE TABLE tblFreeBoard(
	fb_num NUMBER primary key not null,
  fb_subject	VARCHAR2(40),
  fb_writer VARCHAR2(40),
  fb_content varchar2(3000),
  fb_pwd varchar2(40),
  fb_date VARCHAR2(40),
  fb_readcount NUMBER
)

create sequence fb_num_seq;

COMMIT

INSERT INTO tblFreeBoard VALUES(3,'�׽�Ʈ��~~~~','1212', '�۳���' ,'�����','2013/10/19',1)

delete from tblFreeboard where b_subject='�׽�Ʈ'


drop sequence fb_num_seq;

drop table tblFreeboard;

select * from tblFreeBoard;

-------------------------------------------------------------------------------------------------------------------------------------
 
- 회원테이블 
 
CREATE TABLE tblmember(
  m_name varchar2(40) not null,
  m_id	VARCHAR2(40) primary key not null,
  m_pwd VARCHAR2(40) not null,
  m_email varchar2(40) not null,
  m_emailAllow varchar2(40) not null,
  m_birthDate VARCHAR2(40),
  m_lunarSolar VARCHAR2(40),
  m_sex varchar2(10),
  m_phone varchar2(40),
  m_cphone varchar2(40),
  m_smsAllow varchar2(40),
  m_addr varchar2(100),
  m_grade NUMBER
)

commit

drop table tblmember

select * from tblmember;

update tblmember set m_grade=1 where m_id='khr3757'

insert into tblmember values('ddd','sss','1212','sss@naver.com','1','1212년12월12일','1','1','02-22-22','010-22-33','1','dfdf dfdf')


select * from (select rownum rnum,fb_num,fb_subject,fb_writer,fb_date,fb_readcount from tblFreeBoard order by fb_num desc) where rnum between 2 and 7  



------------------------------------------------------------------------------------------------------------------------------------------

- 공지사항 테이블

CREATE TABLE tblNoticeBoard(
	nb_num NUMBER primary key not null,
  nb_subject	VARCHAR2(40),
  nb_writer VARCHAR2(40),
  nb_content varchar2(3000),
  nb_pwd varchar2(40),
  nb_date VARCHAR2(40),
  nb_readcount NUMBER
)
create sequence nb_num_seq;

commit


-----------------------------------------------------------------------------------------------------------------------------

- 파일 자료실 테이블

CREATE TABLE tblFileBoard(
	file_num NUMBER primary key not null,
	file_name varchar2(100) not null,
	file_pwd varchar2(40) not null,
	file_size varchar2(40),
	file_uploader varchar2(40),
	file_date varchar2(40),
	file_fileimagesrc varchar2(100),
	file_count NUMBER
)

create sequence file_num_seq;

commit

select * from tblFileBoard



------------------------------------------------------------------------

- 우편번호 & 주소 테이블

create table zipcode(
zipcode varchar2(8),
sido varchar2(15),
gugun varchar2(30),
dong varchar2(75),
bunji varchar2(40));

start zipcode.sql

commit;

select * from zipcode

drop table zipcode








