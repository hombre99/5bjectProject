package kr.or.object.dao;

import java.util.List;

import kr.or.object.vo.Board;

public interface BoardDao {
	List<Board> getContentBoardList(int notice);

	List<Board> getReplyList(int writeNo);   

	void insertWrite(Board board);
	
	Board getView(int idx);

	void updateHit(Board board);

	void delete(int idx);

	void update(Board board);

	void insertReply(Board board);

	void updateReply(Board board);
	//게시판 조회시 paging처리 관련
	int selectCountBoard(int notice);

	List<Board> getBoardsPaging(int pageNo, int notice);
}