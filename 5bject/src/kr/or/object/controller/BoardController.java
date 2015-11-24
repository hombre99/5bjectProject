package kr.or.object.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.object.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board.do")
	public String Board(HttpSession session){
		
		
		return "/WEB-INF/script/board/list.jsp";
	}
	
	@RequestMapping("/write.do")
	public String Write(){
		
		return "/WEB-INF/script/board/write_success.jsp";
	}
	
	@RequestMapping("/delete.do")
	public String Delete(){
		
		return "/WEB-INF/script/board/delete_success.jsp";
	}
	
	@RequestMapping("/update.do")
	public String Update(){
		
		return "/WEB-INF/script/board/update_success.jsp";
	}
	
	@RequestMapping("/reply.do")
	public String Reply(){
		
		return "/WEB-INF/script/board/reply_success.jsp";
	}
	
	@RequestMapping("/view.do")
	public String View(){
		
		return "/WEB-INF/script/board/view.jsp";
	}
	
	
}
