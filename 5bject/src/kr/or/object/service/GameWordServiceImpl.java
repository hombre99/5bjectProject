package kr.or.object.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.GameWordDao;
import kr.or.object.util.PagingBean;
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
	public  List<GameWord> findWord(String word) {
		return dao.findWord(word);
	}

	@Override
	public Map findAllWord(int pageNo) {
		HashMap map = new HashMap();
		map.put("list", dao.findAllWord(pageNo));
		PagingBean pagingBean = new PagingBean(dao.totalWordCount(), pageNo);
		map.put("pagingBean", pagingBean);
		return map;
	}
	
	@Override
	public List<GameWord> findPlayingWord(HashMap map) {
		return dao.findPlayingWord(map);
	}
}