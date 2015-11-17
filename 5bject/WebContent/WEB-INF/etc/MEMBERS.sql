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
	--references department on delete set null  : 삭제된 경우에 컬럼값에 null 설정.
	-- 참조하는 값이 삭제된 경우 자식테이블의 row도 같이 삭제.
	--references department
 )
 
 create table game1(
 		level_1 number(20) not null,
 		level_2 number(20) not null,
 		level_3 number(20) not null,
 	 	constraint member_fk foreign key(member_id) 
 	   references members on delete cascade
 ) 
 
  create table game2(
 		level_1 number(20) not null,
 		level_2 number(20) not null,
 		level_3 number(20) not null,
 	 	constraint member_fk foreign key(member_id) 
 	   references members on delete cascade
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
 insert into employee values(100,'차현지','hyunji3190@gmail.com','신입사원',3000000,'20100319',600)
 
 select  e.employee_id, e.employee_name, e.email, e.job_position,e.salary, e.hire_date,
 			d.department_id, d.department_name, d.department_location
 from  employee e,department d
 where e.department_id = 900 and e.department_id = d.department_id(+)


 