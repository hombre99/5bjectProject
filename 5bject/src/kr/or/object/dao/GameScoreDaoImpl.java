package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.vo.GameScore;

@Repository("gameScoreDao")
public class GameScoreDaoImpl implements GameScoreDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertGameScore(GameScore gameScore) {
		session.insert("gamescoreMapper.insertGameScore", gameScore);
	}

	@Override
	public void updateGameScore(GameScore gameScore) {
		session.update("gamescoreMapper.updateGameScore", gameScore);
	}

	@Override
	public List selectGameScore(HashMap map) {
		return session.selectList("gamescoreMapper.selectGameScore", map);
	}
}