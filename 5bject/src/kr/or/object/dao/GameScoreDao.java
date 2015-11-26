package kr.or.object.dao;

import java.util.List;

import kr.or.object.vo.GameScore;

public interface GameScoreDao {
	void insertMember(String id);
	
	void insertGameScore(GameScore gameScore);

	void updateGameScore(GameScore gameScore);
	
	void removeGameScore(String id);
	
	List selectGameScore(String id);
}