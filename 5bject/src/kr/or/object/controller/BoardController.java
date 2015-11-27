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

import kr.or.object.service.BoardService;
import kr.or.object.vo.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	private Logger logger = Logger.getLogger(BoardController.class);
	
	//공지사항 
	@RequestMapping("/notice.do")
	public String NoticeList(HttpSession session,  @RequestParam(defaultValue = "1") String pageNo, ModelMap model){	
		int page = 1;
		try {
			page = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}
		Map attributes = service.getBoardPaging(page, 1);
		//List<Board> noticeList = service.getContentNoticeList();

		//session.setAttribute("noticeList", noticeList);
		model.addAllAttributes(attributes);
		return "/WEB-INF/script/board/notice.jsp";
	}
	
	//자유게시판
	/*
	 * @RequestMapping("/board.do")
	public String Board(HttpSession session){
		
		List<Board> boardList = service.getContentBoardList();
		
		session.setAttribute("boardList", boardList);
		
		return "/WEB-INF/script/board/board.jsp";
	}
	*/
	@RequestMapping("/board.do")
	public String Board(HttpSession session, @RequestParam(defaultValue = "1") String pageNo, ModelMap model) {
		int page = 1;
		try {
			page = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}
		Map attributes = service.getBoardPaging(page, 2);
		//List<Board> boardList = (List<Board>) attributes.get("boardList");

		//session.setAttribute("boardList", boardList);
		model.addAllAttributes(attributes);
		return "/WEB-INF/script/board/board.jsp";
	}
	
	@RequestMapping(value = "/write_success.do", method = RequestMethod.POST)
	public String Write(HttpSession session , @ModelAttribute Board board){		
		
		String id = board.getId();		
		
		if(id.equals("objectclass")){
			board.setNotice(1);
		}else{
			board.setNotice(2);
		}			
		
		service.insertWrite(board);		
		
		if(id.equals("objectclass")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}
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
		
		String id = board.getId();
		
		if(id.equals("objectclass")){
			board.setNotice(1);
		}else{
			board.setNotice(2);
		}
		
		service.update(board);		
		
		if(id.equals("objectclass")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}		
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
