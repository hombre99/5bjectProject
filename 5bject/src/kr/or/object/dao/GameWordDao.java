package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.object.vo.GameWord;

public interface GameWordDao {
	void addWord(GameWord gw);
	
	List<GameWord> findWord(String word);
	
	List<GameWord> findAllWord(int pageNo);

	List<GameWord> findPlayingWord(HashMap map);
	
	int totalWordCount();
}