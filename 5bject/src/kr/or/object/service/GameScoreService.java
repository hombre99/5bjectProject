package kr.or.object.service;

import java.util.List;

import kr.or.object.vo.GameScore;

public interface GameScoreService {
	void insertMember(String id);

	void insertGameScore(GameScore gameScore);
	
	void updateGameScore(GameScore gameScore);
	
	void removeGameScore(String id);
	
	List<GameScore> selectGameScore(String id);
}