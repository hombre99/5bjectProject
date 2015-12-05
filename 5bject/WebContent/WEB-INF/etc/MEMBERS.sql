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
핸드폰 	member_phone varchar(11) not null

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
  	member_phone varchar(11) not null 
  	);
	--references department on delete set null  : 삭제된 경우에 컬럼값에 null 설정.
	-- 참조하는 값이 삭제된 경우 자식테이블의 row도 같이 삭제.
	--references department
	 )
  	insert into members values('member01','member01','회원','March', 11, 2000, 'male', 'member01','gmail.com','01033910602');
    insert into members values('member02','member02','회원','March', 11, 2001, 'male', 'member02','gmail.com','01033910601');
    insert into members values('member03','member03','회원','March', 11, 2000, 'male', 'member03','gmail.com','01033910622');
    insert into members values('member04','member04','회원','March', 10, 2000, 'male', 'member04','gmail.com','01033910602');
    insert into members values('member05','member05','회원','March', 12, 2000, 'male', 'member05','naver.com','01012345678');
    insert into members values('member06','member06','회원','March', 10, 2000, 'male', 'member06','gmail.com','01033510612');
    insert into members values('member07','member07','회원','March', 11, 2000, 'male', 'member07','gmail.com','01033910602');
    insert into members values('member08','member08','회원','March', 11, 1999, 'male', 'member08','gmail.com','01073910602');
    insert into members values('member09','member09','회원','March', 11, 1998, 'male', 'member09','gmail.com','01036910602');
    insert into members values('member10','member10','회원','March', 11, 1997, 'male', 'member10','gmail.com','01063910602');
    insert into members values('member11','member11','회원','March', 11, 2000, 'male', 'member11','gmail.com','01022234344');
    insert into members values('member12','member12','회원','March', 11, 2001, 'male', 'member12','gmail.com','01033913355');
    insert into members values('member13','member13','회원','March', 11, 2000, 'male', 'member13','gmail.com','01033945622');
    insert into members values('member14','member14','회원','March', 10, 2000, 'male', 'member14','gmail.com','01099910602');
    insert into members values('member15','member15','회원','March', 12, 2000, 'male', 'member15','naver.com','01014945678');
    insert into members values('member16','member16','회원','March', 10, 2000, 'male', 'member16','gmail.com','01087510612');
    insert into members values('member17','member17','회원','March', 11, 2000, 'male', 'member17','gmail.com','01033955602');
    insert into members values('member18','member18','회원','March', 11, 1999, 'male', 'member18','gmail.com','01073934602');
    insert into members values('member19','member19','회원','March', 11, 1998, 'male', 'member19','gmail.com','01036936602');
    insert into members values('member20','member20','회원','March', 11, 1997, 'male', 'member20','gmail.com','01063924602');
    insert into members values('member21','member21','회원','March', 11, 1997, 'male', 'member21','gmail.com','01063978602');
    insert into members values('member22','member22','회원','March', 11, 1997, 'male', 'member22','gmail.com','01063956602');
    insert into members values('member23','member23','회원','March', 11, 1997, 'male', 'member23','gmail.com','01063985602');
    insert into members values('member24','member24','회원','March', 11, 1997, 'male', 'member24','gmail.com','01063934602');
    insert into members values('member25','member25','회원','March', 11, 1997, 'male', 'member25','gmail.com','01063922602');
  	insert into members values('objectclass','123456','kunhoe','March', 11, 2000, 'male', 'ranibow00','gmail.com','01033910602');

	
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


 