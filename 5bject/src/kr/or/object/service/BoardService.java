package kr.or.object.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import kr.or.object.vo.Board;

public interface BoardService {
	
	List<Board> getContentBoardList();
	
	List<Board> getContentNoticeList();
	
	List<Board> getReplyList(int writeNo);
   
   int getMax();
   
   void insertWrite(Board board);
   
   void insertReply(Board board);
   
   Board getView(int idx);
   
   void updateHit(Board board);
   
   void delete(int idx);
   
   void update(Board board);   
   
   //게시판 페이징 처리 관련
   Map getBoardPaging(int pageNo, int notice);
   
}