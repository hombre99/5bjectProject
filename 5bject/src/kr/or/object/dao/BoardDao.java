package kr.or.object.dao;

import java.sql.Date;
import java.util.List;

import kr.or.object.vo.Board;

public interface BoardDao {

	List<Board> getContentList();

	
	int getMax();
	
	void insertWrite(Board board, int max);
	
	Board getView(int idx);
	
	void updateHit(Board board);
	
	void delete(int idx);
	
	void update(Board board, int max);
	
	void insertReply(Board board);
	
}