TABLENAME : GAMEWORD
COLUMN2 : GAME_NUM
COLUMN3 : DIFFICULTY
COLUMN4 : WORD

DROP TABLE GAMEWORD

CREATE TABLE GAMEWORD (
	GAME_NUM NUMBER(3) DEFAULT -1,
	DIFFICULTY NUMBER(3) DEFAULT -1,
	WORD VARCHAR2(30) NOT NULL
)

--	MEMBER_ID VARCHAR2(50) NOT NULL,
--	GAME_NUM NUMBER(3) DEFAULT -1,
--	EASY NUMBER(5) DEFAULT -1,
--	NORMAL NUMBER(5) DEFAULT -1,
--	HARD NUMBER(5) DEFAULT -1,
--	CONSTRAINT MEMBER_SCORE_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID) ON DELETE CASCADE