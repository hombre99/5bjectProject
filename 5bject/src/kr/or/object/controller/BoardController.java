package kr.or.object.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class BoardController {
	
	@RequestMapping("/board.do")
	public String Board(HttpSession session){
		
		return "";
	}
	
	
}
