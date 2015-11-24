package kr.or.object.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	@RequestMapping("/write.do")
	public String Write(HttpSession session , @RequestParam Board board){
		
		String id = session.getId();
		
		if(id.equals("object")){
			board.setNotice(1);
		}else{
			board.setNotice(2);
		}
		
		service.insertWrite(board);
		
		return "/WEB-INF/script/board/write_success.jsp";
	}
	
	@RequestMapping("/delete.do")
	public String Delete(HttpSession session,@RequestParam Board board){
		
		String id = session.getId();
		Board boardId = service.getView(board.getWriteNo());
		if(id.equals(boardId.getId())){
			service.delete(board.getWriteNo());
		}else{
			session.setAttribute("error", "작성자가 아닙니다.");
		}		
		return "/WEB-INF/script/board/delete_success.jsp";
	}
	
	@RequestMapping("/update.do")
	public String Update(HttpSession session,@RequestParam Board board){
		
		String id = session.getId();
		Board boardId = service.getView(board.getWriteNo());
		
		if(id.equals(boardId.getId())){
			service.update(board);
		}else{
			session.setAttribute("error", "작성자가 아닙니다.");
		}		
		
		return "/WEB-INF/script/board/update_success.jsp";
	}
	
	@RequestMapping("/reply.do")
	public String Reply(HttpSession session,@RequestParam Board board){
		
		service.insertReply(board);
		
		return "/WEB-INF/script/board/reply_success.jsp";
	}
	
	@RequestMapping("/view.do")
	public String View(HttpSession session,@RequestParam Board board){
		
		Board contectBoard = service.getView(board.getWriteNo());
		
		session.setAttribute("contectBoard", contectBoard);
		
		return "/WEB-INF/script/board/view.jsp";
	}	
}
