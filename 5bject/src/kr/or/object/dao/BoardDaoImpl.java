package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.util.PagingBean;
import kr.or.object.vo.Board;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	private SqlSessionTemplate session;

	@Autowired
	public BoardDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}

	// 글 전체 목록 보기
	public List<Board> getContentBoardList(int notice) {
		return session.selectList("boardMapper.selectBoard", notice);
	}

	//댓글 목록 불러오기
	@Override
	public List<Board> getReplyList(int writeNo) {
		return session.selectList("boardMapper.boardReplySelect", writeNo);
	}

	//페이징 처리 관련
	@Override
	public int selectCountBoard(int notice) {	   
		return session.selectOne("boardMapper.selectCount", notice);
	}

	@Override
	public List<Board> getBoardsPaging(int pageNo, int notice) {
		HashMap map = new HashMap();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		// 20151127. JSJ. ADD
		map.put("noticeFlag", notice);

		return session.selectList("boardMapper.selectPagingBoard", map);
	}

	// 게시글 쓰기
	public void insertWrite(Board board) {
		session.insert("boardMapper.boardInsert",board);
	}

	// 댓글 쓰기
	public void insertReply(Board board) {
		session.insert("boardMapper.boardInsertReply",board);
	}   
	
	public void updateReply(Board board){
		session.update("updateBoardReply", board);
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
	public void update(Board board) {
		session.update("boardMapper.boardModify",board);
	}
}