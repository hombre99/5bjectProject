package kr.or.object.dao;

import java.util.List;

import kr.or.object.vo.GameScore;

public interface GameScoreDao {
	void insertMember(String id);
	
	void insertGameScore(GameScore gameScore);

	void updateGameScore(GameScore gameScore);
	
	List selectGameScore(String id);
}