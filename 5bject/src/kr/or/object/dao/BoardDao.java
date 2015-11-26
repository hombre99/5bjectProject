package kr.or.object.dao;

import java.sql.Date;
import java.util.List;

import kr.or.object.vo.Board;

public interface BoardDao {

   List<Board> getContentBoardList();
   
   List<Board> getContentNoticeList();
   
   List<Board> getReplyList(int writeNo);
   
   int getMax();
   
   void insertWrite(Board board);
   
   Board getView(int idx);
   
   void updateHit(Board board);
   
   void delete(int idx);
   
   void update(Board board);
   
   void insertReply(Board board);
   
}