drop table language;

create table language(
language_name varchar2(25) primary key,
language_definition varchar2(4000) not null,
language_information varchar2(4000) not null,
language_detail varchar2(4000) 
)

------------------------------------------------

delete from LANGUAGE where language_name = 'java';

insert into language values('java','자바는 썬 마이크로시스템즈에서 개발해 1996년 1월에 공식적으로 발표한 객체 지향 프로그래밍 언어이다.
그렇다면 객체지향이란?','객체-지향 프로그래밍은 오늘날 프로그램의 복잡성을 극복하고 있는 듯 합니다. 프로시저를 object라고 하는 유닛으로 그룹화 함으로써
 프로그램은 더 적은 블록을 요구하고 결과로 단순해 졌습니다','객체지향 언어의 대표주자인 자바는 미군들이 많이 사용하는 M240기관총입니다.  그 이유는 탄약
벤트(프로그램 코드 ) 문제가 발생하면 Null PointerException 예외 오류가 발생해서 폭발을 하고 기관총 사수는 사망을 합니다.');