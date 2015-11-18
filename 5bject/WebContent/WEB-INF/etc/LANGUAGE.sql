drop table language;

create table language(
language_name varchar2(25) primary key,
language_definition varchar2(4000) not null,
language_information varchar2(4000) not null,
language_detail varchar2(4000) 
)

------------------------------------------------

delete from LANGUAGE where language_name = 'java';

insert into language values('java','자바(Java) 썬 마이크로시스템즈의 제임스 고슬링(James Gosling)과 다른 연구원들이 개발한 객체 지향적 프로그래밍 언어이며, 
썬 마이크로시스템즈에서 무료로 제공하고 있습니다. 그렇다면 객체지향이란 무엇이고 자바의 구조는 어떻게 되어있을까요?',
'객체지향은 좀 더 나은 프로그램을 만들기 위한 프로그래밍 패러다임으로 로직을 상태(state)와 행위(behave)로 이루어진 객체로 만드는 것 입니다. 
즉 이 객체들을 마치 레고 블럭처럼 조립해서 하나의 프로그램을 만드는 것이 객체지향 프로그래밍이라고 할 수 있습니다. java의 구조로 JDK(Java Development Kit)는 사용자가 자바프로그램을
 작성하고 실행해 볼 수 있도록 하는 필요한 도구와 클래스 라이브러리로 구성되어 있습니다. 또한 JRE(Java Runtime Environment)로 자바를 실행할 수 있습니다.',
'위에서 말했듯이 자바의 이런 특징으로 사용이 되는 분야는 매우 많다는 것이 특징입니다. 처음에는 가전제품용 언어로 시작을했지만은 지금은 웹프로그래밍과 게임분야, 
모바일분야, 기업용, 업무용프로그램, 데이터베이스관리프로그램등  여기에 최근에는 안드로이드까지 추가가 되었습니다');