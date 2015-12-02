package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.object.vo.GameWord;

public interface GameWordDao {
	void addWord(GameWord gw);
	
	void removeWord(GameWord gw);
	
	List<GameWord> findWord(String word, int pageNo);
	
	List<GameWord> findAllWord(int pageNo);

	List<GameWord> findPlayingWord(HashMap map);
	
	int totalWordCount();

	int totalWordCountByWord(String word);
}