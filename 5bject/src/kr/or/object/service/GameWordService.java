package kr.or.object.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.object.vo.GameWord;

public interface GameWordService {
	void addWord(GameWord gw);
	
	List<GameWord> findWord(String word);
	
	Map findAllWord(int pageNo);

	List<GameWord> findPlayingWord(HashMap map);
}