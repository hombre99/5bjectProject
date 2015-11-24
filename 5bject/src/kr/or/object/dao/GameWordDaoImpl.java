package kr.or.object.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public GameWord findWord(String word) {
		return session.selectOne("gamewordMapper.selectGameWord", word);
	}

	@Override
	public List<GameWord> findAllWord() {
		return session.selectList("gamewordMapper.selectAllGameWord");
	}
}