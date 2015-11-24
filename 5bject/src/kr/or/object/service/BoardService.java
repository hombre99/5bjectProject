package kr.or.object.service;

import java.sql.Date;
import java.util.List;

import kr.or.object.vo.Board;

public interface BoardService {
   
   int getMax();
   
   void insertWrite(Board board);
   
   void insertReply(Board board);
   
   Board getView(int idx);
   
   void updateHit(Board board);
   
   void delete(int idx);
   
   void update(Board board);   
   
}