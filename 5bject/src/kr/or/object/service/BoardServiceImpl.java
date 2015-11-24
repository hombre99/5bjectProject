package kr.or.object.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.BoardDao;
import kr.or.object.vo.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
   
   @Autowired
   private BoardDao dao;

   public List<Board> getContentList() {
      List<Board> boardList = dao.getContentList();
      return boardList;
   }

   @Override
   public int getMax() {
      return dao.getMax();
   }

   @Override
   public void insertWrite(Board board) {
      dao.insertWrite(board);      
   }

   @Override
   public void insertReply(Board board) {
      dao.insertReply(board);      
   }

   @Override
   public Board getView(int idx) {
      return dao.getView(idx);
   }

   @Override
   public void updateHit(Board board) {
      dao.updateHit(board);
   }

   @Override
   public void delete(int idx) {
      dao.delete(idx);      
   }

   @Override
   public void update(Board board) {
      dao.update(board);      
   }

}