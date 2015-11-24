package kr.or.object.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.vo.Board;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{

	private SqlSessionTemplate session;

	@Autowired
	public BoardDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}
	
	// 글 전체 목록 보기
	public List<Board> getContentList() {
		List<Board> boardList = session.selectList("boardMapper.boardAllSelect");
		return boardList;
	}

	// 총 글 갯수
	public int getMax() {
		int max = session.selectList("boardMapper.boardAllSelect").size();
		return max;
	}

	// 게시글 쓰기
	public void insertWrite(Board board, int max) {
		session.insert("boardMapper.boardInsert",board);
	}
	
	// 댓글 쓰기
	public void insertReply(Board board) {
		session.update("boardMapper.updateReply",board);
	}	


	// 글제목으로 글보기
	public Board getView(int idx) {
		return session.selectOne("boardMapper.boardContentSelect",idx);
	}

	
	// 조회수 증가
	public void updateHit(Board board) {
		session.update("boardMapper.boardHitUpdate",board);		
	}

	// 게시 글 삭제
	public void delete(int idx) {
		session.delete("boardMapper.boardDelete",idx);
		
	}
	// 게시 글 수정
	public void update(Board board, int max) {
		session.update("boardMapper.boardModify",board);
	}
}