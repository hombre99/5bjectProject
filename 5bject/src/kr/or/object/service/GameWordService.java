package kr.or.object.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.object.vo.GameWord;

public interface GameWordService {
	void addWord(GameWord gw);
	
	void removeWord(GameWord gw);
	
	Map findWord(String word, int pageNo);
	
	Map findAllWord(int pageNo);

	List<GameWord> findPlayingWord(HashMap map);
}