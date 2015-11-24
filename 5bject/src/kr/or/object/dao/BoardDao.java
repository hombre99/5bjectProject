package kr.or.object.dao;

import java.sql.Date;
import java.util.ArrayList;

import kr.or.object.vo.Board;

public interface BoardDao {

	ArrayList<Board> getContentList();

	int count();
	
	int getMax();
	
	void insertWrite(Board board, int max);
	
	Board getView(int idx);
	
	void updateHit(int idx);
	
	void delete(int idx);
	
	void update(Board board, int max);
	
	void insertReply(Board board, int ref, Date date);
	
}