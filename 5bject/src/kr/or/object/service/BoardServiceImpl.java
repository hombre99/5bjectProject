package kr.or.object.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.BoardDao;
import kr.or.object.util.PagingBean;
import kr.or.object.vo.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;

	public List<Board> getContentBoardList(int notice) {
		return dao.getContentBoardList(notice);
	}

	@Override
	public List<Board> getReplyList(int writeNo) {
		return dao.getReplyList(writeNo);
	}

	@Override
	public void insertWrite(Board board) {
		dao.insertWrite(board);      
	}

	@Override
	public void insertReply(Board board, Board original) {
		dao.insertReply(board);		
		dao.updateReply(original);
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

	@Override
	public Map getBoardPaging(int pageNo, int notice) {
		HashMap map = new HashMap();
		map.put("boardList", dao.getBoardsPaging(pageNo, notice));
		PagingBean pagingBean = new PagingBean(dao.selectCountBoard(notice),pageNo);
		map.put("pagingBean", pagingBean);
		return map;
	}

	public int getCountBoard(int notice){
		return dao.selectCountBoard(notice);
	}
}