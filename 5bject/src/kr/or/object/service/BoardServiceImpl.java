package kr.or.object.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.BoardDao;

@Service("boardService")
public class BoardServiceImpl {

	private BoardDao dao;
	
	@Autowired
	private BoardServiceImpl(BoardDao dao){
		this.dao = dao;
	}
	
	
	
	
}
