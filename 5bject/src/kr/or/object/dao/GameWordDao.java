package kr.or.object.dao;

import java.util.List;

import kr.or.object.vo.GameWord;

public interface GameWordDao {
	void addWord(GameWord gw);
	
	GameWord findWord(String word);
	
	List<GameWord> findAllWord();
}