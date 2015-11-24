package kr.or.object.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.GameScoreDao;
import kr.or.object.vo.GameScore;

@Service("gameScoreService")
public class GameScoreServiceImpl implements GameScoreService {
	@Autowired
	private GameScoreDao dao;

	@Override
	public void insertGameScore(GameScore gameScore) {
		dao.insertGameScore(gameScore);
	}

	@Override
	public void updateGameScore(GameScore gameScore) {
		dao.updateGameScore(gameScore);
	}

	@Override
	public List<GameScore> selectGameScore(HashMap map) {
		return dao.selectGameScore(map);
	}
}