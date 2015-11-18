package kr.or.object.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/game")
public class GameController {
	@RequestMapping("/game.do")
	public String game(@RequestParam int gameNum, @RequestParam int difficulty, HttpSession session){
		
		if ( gameNum > 0 && gameNum < 4 ) {
			session.setAttribute("gameNum", gameNum);
		}

		if ( difficulty > 1 && difficulty < 5 ) {
			session.setAttribute("difficulty", difficulty);
		}

		return "/WEB-INF/script/main.jsp";
	}

	/*
	@RequestMapping("/game2.do")
	public String game2(@RequestParam int difficulty, HttpSession session){
		
		if ( difficulty > 2 || difficulty < 4 ) {
			session.setAttribute("difficulty", difficulty);
		}

		return "/WEB-INF/script/main.jsp";
	}

	@RequestMapping("/game3.do")
	public String game3(@RequestParam int difficulty, HttpSession session){
		
		if ( difficulty > 2 || difficulty < 4 ) {
			session.setAttribute("difficulty", difficulty);
		}

		return "/WEB-INF/script/main.jsp";
	}
	*/
}