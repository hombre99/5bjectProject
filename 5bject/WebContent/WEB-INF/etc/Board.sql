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

create table BOARD(   
   write_no number(6) primary key,
   
   member_id varchar2(50) ,
   foreign key (member_id),
   references members(member_id) on delete cascade,
   
   title varchar2(50) not null,
   content varchar2(5000) not null,
   write_date date not null,
   notice number(2) not null,
   ref number(6),
   hit number(6) default 0
)