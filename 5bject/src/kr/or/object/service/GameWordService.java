package kr.or.object.service;

import java.util.HashMap;
import java.util.List;

import kr.or.object.vo.GameWord;

public interface GameWordService {
	void addWord(GameWord gw);
	
	GameWord findWord(String word);
	
	List<GameWord> findAllWord();

	List<GameWord> findPlayingWord(HashMap map);
}