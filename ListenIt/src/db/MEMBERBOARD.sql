CREATE TABLE MEMBERBOARD{
BOARD_NUM number not null,
BOARD_NAME VARCHAR2(20),
BOARD_SUBJECT VARCHAR2(50),
BOARD_CONTENT VARCHAR2(2000),
BOARD_FILE VARCHAR2(50),
BOARD_RE_REF INT,
BOARD_RE_LEV INT,
BOARD_RE_SEQ INT,
BOARD_READCOUNT INT,
BOARD_DATE DATE default sysdate,
PRIMARY KEY(BOARD_NUM)
);


create table MEMBERBOARD
(	
	BOARD_NUM			number			 primary key not null,
	BOARD_NAME			varchar2(20)	 ,
	BOARD_SUBJECT		varchar2(50)	 ,
	BOARD_CONTENT		varchar2(2000)	 ,
	BOARD_FILE  		varchar2(50)	 ,
	BOARD_RE_REF 		number			 ,
	BOARD_RE_LEV		number			 ,
	BOARD_RE_SEQ		number			 ,
	BOARD_READCOUNT		number			 ,
	BOARD_DATE			date		 	 default sysdate
);

insert into MEMBERBOARD values(1,1,1,1,1,1,1,1,1,default);

select * from MEMBERBOARD;