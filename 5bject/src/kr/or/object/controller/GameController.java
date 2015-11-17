package kr.or.object.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/game")
public class GameController {
	
	@RequestMapping("/testgame.do")
	public String game(@RequestParam int difficulty, HttpSession session){
		
		if ( difficulty > 2 || difficulty < 4 ) {
			session.setAttribute("difficulty", difficulty);
		}

		return "/WEB-INF/script/main.jsp";
	}
}