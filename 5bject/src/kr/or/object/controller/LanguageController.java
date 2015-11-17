package kr.or.object.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.object.service.LanguageService;
import kr.or.object.vo.Language;

@Controller
@RequestMapping("/language")
public class LanguageController {

	@Autowired
	private LanguageService service;

	@RequestMapping("/select_language.do")
	public String selectLanguage(HttpSession session, @RequestParam String name) {
		Language language = service.findLanguageByName(name);
		if (language==null) {
			session.setAttribute("name", null);
			return "/WEB-INF/script/language/computer_language.jsp";
		} else {
			session.setAttribute("name", name);
			session.setAttribute("language", language);
			return "/WEB-INF/script/language/computer_language.jsp";
		}

	}
}
