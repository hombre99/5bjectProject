package kr.or.object.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.object.service.BoardService;
import kr.or.object.vo.Board;
import kr.or.object.vo.Members;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;

	private Logger logger = Logger.getLogger(BoardController.class);

	@RequestMapping("/boardInfo.do")
	public String BoardInfo(HttpSession session, @RequestParam(defaultValue = "1") String pageNo, @RequestParam int boardInfo, ModelMap model) {
		int page = 1;
		String filePath = "";

		try {
			page = Integer.parseInt(pageNo);
		} catch ( NumberFormatException e ) {
		}

		Map attributes = service.getBoardPaging(page, boardInfo);
		model.addAllAttributes(attributes);

		if ( boardInfo == 1 )
			filePath = "/board/notice";
		else if ( boardInfo == 2 )
			filePath = "/board/board";
		else
			filePath = "/main";

		return "/WEB-INF/script" + filePath + ".jsp";
	}

	
	@RequestMapping(value="/write_success.do", method=RequestMethod.POST)
	@ResponseBody
	public String Write(@RequestParam String id, @RequestParam String title, @RequestParam String content,
					@RequestParam int notice, @RequestParam int ref) {
		Board board = new Board(id, title, content, notice, ref);
		
		if ( logger.isInfoEnabled() )
			logger.info("board : " + board);
		
		service.insertWrite(board);
		return "/5bject/board/boardInfo.do?boardInfo=" + notice;
	}

	@RequestMapping("/delete.do")
	@ResponseBody
	public String Delete(@RequestParam int idx, @RequestParam int notice){		
		service.delete(idx);		

		return "/5bject/board/boardInfo.do?boardInfo=" + notice;
	}

	
	@RequestMapping(value="/update_success.do", method=RequestMethod.POST)
	@ResponseBody
	public String update(@RequestParam int writeNo, @RequestParam String id, @RequestParam String title,
						@RequestParam String content, @RequestParam int notice, @RequestParam int ref) {
		Board board = new Board(id, title, content, notice, ref);
		board.setWriteNo(writeNo);

		if ( logger.isInfoEnabled() )
			logger.info("boardupdate : " + board);
		
		service.update(board);
		return "/5bject/board/boardInfo.do?boardInfo=" + notice;
	}
	
	@RequestMapping(value="/addReply.do", method=RequestMethod.POST)
	@ResponseBody
	public void addReply(@RequestParam String id, @RequestParam String title, @RequestParam String content,
        				@RequestParam int notice, @RequestParam int writeNo) {
		Board board = new Board(id, title, content, notice, writeNo);
		Board original = service.getView(board.getRef());
		int replyCount = original.getReply();
		replyCount++;
		original.setReply(replyCount);
			
		if ( logger.isInfoEnabled() ) {
			logger.info("board : " + board);
		}
		service.insertReply(board, original);
	}

	@RequestMapping("/view.do")
	public String View(HttpSession session,@RequestParam int writeNo){
		Board contectBoard = service.getView(writeNo);
		String loginId = "";
		int hit = contectBoard.getHit();
		hit++;
		contectBoard.setHit(hit);	
		service.updateHit(contectBoard);
		if(session.getAttribute("writer")!=null){
		session.removeAttribute("writer");
		}
		
		Members members = (Members) session.getAttribute("member");
		if(members!=null){
			loginId = members.getId();
			if(loginId.equals(contectBoard.getId())){
				session.setAttribute("writer", "writer");
			}
		}
		session.setAttribute("contectBoard", contectBoard);	

		List<Board> replyList = service.getReplyList(contectBoard.getWriteNo());
		session.setAttribute("replyList", replyList);

		if ( logger.isInfoEnabled() )
			logger.info("board.getWriteNo() : " + contectBoard.getWriteNo());

		return "/WEB-INF/script/board/view.jsp";
	}
}
