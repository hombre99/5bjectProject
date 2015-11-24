package kr.or.object.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.GameWordDao;
import kr.or.object.vo.GameWord;

@Service("gameWordService")
public class GameWordServiceImpl implements GameWordService {
	@Autowired
	private GameWordDao dao;
	
	@Override
	public void addWord(GameWord gw) {
		dao.addWord(gw);
	}

	@Override
	public GameWord findWord(String word) {
		return dao.findWord(word);
	}

	@Override
	public List<GameWord> findAllWord() {
		return dao.findAllWord();
	}
}