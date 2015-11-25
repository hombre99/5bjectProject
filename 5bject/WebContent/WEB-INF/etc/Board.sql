   private int writeNo;
   private String id;
   private String title;
   private String content;
   private Date date;
   private int hit;
   private int ref;
   
   create sequence s_write_no
   start with 1
   increment by 1
   MINVALUE 0.
   drop sequence s_write_no

   
	create table BOARD(	
		write_no number(6) primary key,	
		member_id varchar2(50)
		CONSTRAINT member_id
		REFERENCES MEMBERS(MEMBER_ID)
		ON DELETE CASCADE, 
		title varchar2(50) not null,
		content varchar2(2000) not null,
		write_date date not null,
		notice number(2) not null,
		ref number(6) default 0, 
		hit number(6) default 0
	);

INSERT INTO board (write_no, member_id, title, content, write_date,notice,hit) 
VALUES (s_write_no.nextval, 'object', '안녕하세요', '오늘의 공지사항은 없습니다.', sysdate,1, 5)

INSERT INTO board (write_no, member_id, title, content, write_date,notice,ref,hit) 
VALUES (s_write_no.nextval, 'object', 'RE', '공지사항이 왜 없냐 ㅡㅡ', sysdate,1,1, 5)

UPDATE BOARD SET title='하이욤',content='공지 없어',write_date=sysdate where write_no = 1

UPDATE BOARD SET title='하이욤',content='공지 없어',write_date=sysdate where write_no = 1
SELECT write_no, member_id, title, content, write_date,notice,ref,hit FROM BOARD WHERE write_no=1
SELECT write_no,title,member_id,write_date,hit FROM BOARD
select * from BOARD
drop table BOARD