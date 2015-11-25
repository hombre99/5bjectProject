테이블 명 : 회원명
속성: 
아이디 	member_id varchar2(50) primary key,
비밀번호	member_password varchar2(50) not null,
이름	    member_name varchar2(50) not null,
나이1  	member_month varchar(15) not null,
나이2  	member_day number(3) not null,
나이3 	    member_year number(3) not null,
성별	    member_gender varchar(12) not null,
이메일1  	member_email_id varchar(25) not null,
이메일2  	member_email_address varchar(25) not null,
핸드폰 	member_phone number(11) 

FK컬럼은 참조 테이블의 PK컬럼의 값을 참조한다. 
drop table members;

create table members(
	member_id varchar2(50) primary key,
	member_password varchar2(50) not null,
	member_name varchar2(50) not null,
	member_month varchar2(25) not null,
	member_day number(3) not null,
	member_year number(4) not null,
	member_gender varchar(12) not null,
  	member_email_id varchar(25) not null,
  	member_email_address varchar(25) not null,
  	member_phone number(11) 
  	);
	--references department on delete set null  : 삭제된 경우에 컬럼값에 null 설정.
	-- 참조하는 값이 삭제된 경우 자식테이블의 row도 같이 삭제.
	--references department
	 )
  	insert into members values('aaaaa1','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa2','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa3','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa4','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa5','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa6','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa7','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa8','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('aaaaa9','123456','kunhoe','March', 11, 2000, 'male', 'aaaaaa','gmail.com',09999999999);
  	insert into members values('cccccc41','123456','kunhoe','March', 11, 2000, 'male', 'ranibow','gmail.com',01111111112);
  	insert into members values('object','class','kunhoe','March', 11, 2000, 'male', 'ranibow00','gmail.com',01111111111);
  	insert into members values('objectclass','123456','kunhoe','March', 11, 2000, 'male', 'ranibow00','gmail.com',01111111111);

	
 )
  	insert into members values('cccccccc','123456','kunhoe','March', 11, 2000, 'male', 'ranibow00','gmail.com',11111111111)

 --------------------------------------------------------------------------------------------
  --고객 요청을 받기위한 table
 drop table request_member; 
 
 
   create table request_member(
  	 	request_id varchar2(50) not null,
 		request_information varchar2(4000) not null,
 		request_date varchar2(50) not null,
 	 	constraint member_fk foreign key (request_id) 
 	  	references members(member_id) on delete cascade
 ) 
 
 		select r.request_id, r.request_information, r.request_date, 
				m.member_id, m.member_password, m.member_name, m.member_month,
				m.member_day, m.member_year, m.member_gender, m.member_email_id, m.member_email_address, m.member_phone
				from request_member r, members m;
  --------------------------------------------------------------------------------------------
 create table game1(
 		level_1 number(20) not null,
 		level_2 number(20) not null,
 		level_3 number(20) not null,
 	 	constraint member_fk foreign key(member_id) references members (member_id)
 ) 
 
  create table game3(
 		level_1 number(20) not null,
 		level_2 number(20) not null,
 		level_3 number(20) not null,
 	 	constraint member_fk foreign key(member_id) 
 	   references members on delete cascade
 ) 
 		
 select * from member;
 
 
 ----------------------------------

 
 select  e.employee_id, e.employee_name, e.email, e.job_position,e.salary, e.hire_date,
 			d.department_id, d.department_name, d.department_location
 from  employee e,department d
 where e.department_id = 900 and e.department_id = d.department_id(+)


 