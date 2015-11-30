package kr.or.object.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.object.service.BoardService;
import kr.or.object.vo.Board;

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

	// 20151128. JSJ. AJAX ADD.
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
	public String Delete(HttpSession session,@RequestParam int idx , @RequestParam String boardId){		

		service.delete(idx);		

		if(boardId.equals("objectclass")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}			
	}

	@RequestMapping(value = "/update_success.do", method = RequestMethod.POST)
	public String Update(HttpSession session , @ModelAttribute Board board){
		int boardInfo = 2;

		if(board.getId().equals("objectclass")){
			board.setNotice(1);
			boardInfo = 1;
		}else{
			board.setNotice(2);
		}

		service.update(board);		

		return "/board/boardInfo.do?boardInfo=" + boardInfo;
	}

	@RequestMapping(value="/addReply.do", method=RequestMethod.POST)
	@ResponseBody
	public void addReply(@RequestParam String id, @RequestParam String title, @RequestParam String content,
        				@RequestParam int notice, @RequestParam int writeNo) {
		Board board = new Board(id, title, content, notice, writeNo);
		if ( logger.isInfoEnabled() ) {
			logger.info("board : " + board);
		}
		service.insertReply(board);
	}

	@RequestMapping("/reply_success.do")
	public String Reply(HttpSession session,@ModelAttribute Board board){

		board.setTitle("reply");
	
		service.insertReply(board);

		return "/board/view.do?writeNo="+board.getWriteNo()+"&sessionId="+board.getId();
	}

	@RequestMapping("/view.do")
	public String View(HttpSession session,@ModelAttribute Board board , String sessionId){

		int hit = board.getHit();

		hit++;
		board.setHit(hit);	
		service.updateHit(board);

		if(sessionId.equals(board.getId())){
			session.setAttribute("writer", "writer");
		}else{
			session.setAttribute("writer","nonWriter");
		}

		Board contectBoard = service.getView(board.getWriteNo());
		session.setAttribute("contectBoard", contectBoard);	

		List<Board> replyList = service.getReplyList(board.getWriteNo());
		session.setAttribute("replyList", replyList);

		if ( logger.isInfoEnabled() )
			logger.info("board.getWriteNo() : " + board.getWriteNo());

		return "/WEB-INF/script/board/view.jsp";
	}
}
