package kr.or.object.dao;

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
	public void insertMember(String id) {
		session.insert("gamescoreMapper.insertMember", id);
	};

	@Override
	public void insertGameScore(GameScore gameScore) {
		session.insert("gamescoreMapper.insertGameScore", gameScore);
	}

	@Override
	public void updateGameScore(GameScore gameScore) {
		session.update("gamescoreMapper.updateGameScore", gameScore);
	}
	
	@Override
	public void removeGameScore(String id) {
		session.delete("gamescoreMapper.deleteGameScore", id);
	}

	@Override
	public List selectGameScore(String id) {
		return session.selectList("gamescoreMapper.selectGameScoreById", id);
	}
}