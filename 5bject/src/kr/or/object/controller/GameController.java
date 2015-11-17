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

		// 이동할 url
		String url = "";
		
		System.out.printf("difficulty[ %d ]\n", difficulty);
		if ( difficulty < 2 || difficulty > 4 ) {
			 url = "/main.jsp";
		} else {
			session.setAttribute("difficulty", difficulty);
			url = "/WEB-INF/script/main.jsp";
		}
		return url;
	}
}