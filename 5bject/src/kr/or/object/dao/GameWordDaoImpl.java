package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.util.PagingBean;
import kr.or.object.vo.GameWord;

@Repository("gameWordDao")
public class GameWordDaoImpl implements GameWordDao {
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public void addWord(GameWord gw) {
		session.insert("gamewordMapper.insertGameWord", gw);
	}

	@Override
	public List<GameWord> findWord(String word, int pageNo) {
		HashMap map = new HashMap();
		
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		map.put("word", word);
		return session.selectList("gamewordMapper.selectGameWordByWord", map);
	}

	@Override
	public List<GameWord> findAllWord(int pageNo) {
		HashMap map = new HashMap();
		
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		return session.selectList("gamewordMapper.selectAllGameWord", map);
	}
	
	@Override
	public List<GameWord> findPlayingWord(HashMap map) {
		return session.selectList("gamewordMapper.selectPlayingGameWord", map);
	}

	@Override
	public int totalWordCount() {
		return session.selectOne("gamewordMapper.selectWordCount");
	}
	
	@Override
	public int totalWordCountByWord(String word) {
		return session.selectOne("gamewordMapper.selectWordCountByWord", word);
	}
}