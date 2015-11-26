package kr.or.object.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	//공지사항 
	@RequestMapping("/notice.do")
	public String NoticeList(HttpSession session){
		
		List<Board> noticeList = service.getContentNoticeList();

		session.setAttribute("noticeList", noticeList);
		
		return "/WEB-INF/script/board/notice.jsp";
	}
	
	//자유게시판
	@RequestMapping("/board.do")
	public String Board(HttpSession session){
		
		List<Board> boardList = service.getContentBoardList();
		
		session.setAttribute("boardList", boardList);
		
		return "/WEB-INF/script/board/board.jsp";
	}
	
	
	@RequestMapping(value = "/write_success.do", method = RequestMethod.POST)
	public String Write(HttpSession session , @ModelAttribute Board board){		
		
		String id = board.getId();		
		
		if(id.equals("object")){
			board.setNotice(1);
		}else{
			board.setNotice(2);
		}		
		
		service.insertWrite(board);		
		
		if(id.equals("object")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}
	}
	
	@RequestMapping("/delete.do")
	public String Delete(HttpSession session,@RequestParam int idx , @RequestParam String boardId){		
		
		service.delete(idx);
		
		if(boardId.equals("object")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}			
	}
	
	@RequestMapping(value = "/update_success.do", method = RequestMethod.POST)
	public String Update(HttpSession session , @ModelAttribute Board board){
		
		String id = board.getId();
		
		if(id.equals("object")){
			board.setNotice(1);
		}else{
			board.setNotice(2);
		}
		
		service.update(board);		
		
		if(id.equals("object")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}		
	}
	
	@RequestMapping("/reply_success.do")
	public String Reply(HttpSession session,@RequestParam Board board, @RequestParam int writeNo){
		
		service.insertReply(board);
		
		String url = "/5bject/board/view.do?writeNo="+writeNo;
		return url;
	}
	
	@RequestMapping("/view.do")
	public String View(HttpSession session,@ModelAttribute Board board){
		
		int hit = board.getHit();
		
		hit++;
		board.setHit(hit);	
		service.updateHit(board);

		String sessionId = session.getId();
		String boardId = board.getId();
		
		if(sessionId.equals(boardId)){
			session.setAttribute("writer", "writer");
		}else{
			session.setAttribute("writer","nonWriter");
		}
		
		Board contectBoard = service.getView(board.getWriteNo());
/*		List<Board> replyList = service.getReplyList(board.getWriteNo());
		session.setAttribute("replyList", replyList);*/
		session.setAttribute("contectBoard", contectBoard);	
		return "/WEB-INF/script/board/view.jsp";
	}		

	public void getMax(){
		service.getMax();
	}	
}
