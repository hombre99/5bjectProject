package kr.or.object.service;

import java.util.List;

import kr.or.object.vo.GameScore;

public interface GameScoreService {
	void insertGameScore(GameScore gameScore);
	
	void updateGameScore(GameScore gameScore);
	
	List<GameScore> selectGameScore(String id);
}