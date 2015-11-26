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
		System.out.println("aaaaaaaaa");
		List<Board> noticeList = service.getContentNoticeList();
		for ( int i = 0; i < noticeList.size(); i++ ) {
			System.out.println(i+" Title : " + noticeList.get(i).getTitle());
		}
		
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
		System.out.println(board.getTitle()  +"        ----------        "+board.getContent()+"        ----------        "+board.getId());
		
		service.insertWrite(board);		
		
		if(id.equals("object")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}
	}
	
	@RequestMapping("/delete.do")
	public String Delete(HttpSession session,@RequestParam int idx , @RequestParam String boardId){		
		
		System.out.println(idx);
		System.out.println(boardId);		
		
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
		
		System.out.println(board);
		
		if(id.equals("object")){
			return "/board/notice.do";
		}else{
			return "/board/board.do";
		}		
	}
	
	@RequestMapping("/reply.do")
	public String Reply(HttpSession session,@RequestParam Board board){
		
		service.insertReply(board);
		
		return "/WEB-INF/script/board/reply_success.jsp";
	}
	
	@RequestMapping("/view.do")
	public String View(HttpSession session,@RequestParam int idx){
		
		Board contectBoard = service.getView(idx);
		
		session.setAttribute("contectBoard", contectBoard);	
		
		return "/WEB-INF/script/board/view.jsp";
	}	
	
	public void getMax(){
		service.getMax();
		System.out.println(service.getMax());
	}	
}
