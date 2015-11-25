package kr.or.object.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.object.service.GameScoreService;
import kr.or.object.service.GameWordService;
import kr.or.object.vo.GameScore;
import kr.or.object.vo.GameWord;

@Controller
@RequestMapping("/game")
public class GameController {
	@Autowired
	private GameScoreService gsService;
	@Autowired
	private GameWordService gwService;
	
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
	
	@RequestMapping("/setGameScore.do")
	@ResponseBody
	public String gameScore(//@ModelAttribute GameScore gameScore,
			@RequestParam String id, @RequestParam int gameNum,
			@RequestParam int easy, @RequestParam int normal, @RequestParam int hard,
			@RequestParam int difficulty) {
		GameScore gameScore = new GameScore(id, gameNum, easy, normal, hard);
		if ( gameScore.getId().length() == 0 ) {
			// not exist id
			System.out.println("NOT EXIST ID");
			return null;
		} else {
			List<GameScore> list = gsService.selectGameScore(gameScore.getId());
			
			if ( list != null ) {
				for ( GameScore gs : list ) {
					if ( gs.getGameNum() == gameScore.getGameNum() ) {
						if ( difficulty == 2 ) {
							if ( gs.getEasy() >= gameScore.getEasy() ) {
								gameScore.setEasy(gs.getEasy());
							}
							gameScore.setNormal(gs.getNormal());
							gameScore.setHard(gs.getHard());
						} else if ( difficulty == 3 ) {
							gameScore.setEasy(gs.getEasy());
							if ( gs.getNormal() >= gameScore.getNormal() ) {
								gameScore.setNormal(gs.getNormal());
							}
							gameScore.setHard(gs.getHard());
						} else if ( difficulty == 4 ) {
							gameScore.setEasy(gs.getEasy());
							gameScore.setNormal(gs.getNormal());
							if ( gs.getHard() >= gameScore.getHard() ) {
								gameScore.setHard(gs.getHard());
							}
						}
	
						gsService.updateGameScore(gameScore);
					} else if ( gs.getGameNum() == -1 ) {
						gsService.updateGameScore(gameScore);
					}
				}
			} else {
				gsService.insertGameScore(gameScore);
			}
		}
		// return "/game/game.do?gameNum=" + gameScore.getGameNum() + "&difficulty=" + difficulty;
		return null;
	}
	
	@RequestMapping("/addWord.do")
	public String addWord(@RequestParam int gameNum, @RequestParam int difficulty, @RequestParam String word) {
		GameWord gw = new GameWord(gameNum, difficulty, word);
		gwService.addWord(gw);

		return "/WEB-INF/script/game/add_gameword.jsp";
	}

			
	@RequestMapping("/findWord.do")
	public String findWord(@RequestParam String word, ModelMap model) {
		HashMap map = new HashMap();
		
		map.put("gameWord", gwService.findWord(word));

		model.addAllAttributes(map);
			
		return "/WEB-INF/script/game/find_gameword.jsp";
	}
	
	@RequestMapping("/findAllWord.do")
	public String findAllWord(@RequestParam(defaultValue="1") String pageNo, ModelMap model) {
		int page = 1;
		try {
			page = Integer.parseInt(pageNo);
		} catch ( NumberFormatException e ) {
		}

		Map attributes = gwService.findAllWord(page);
		model.addAllAttributes(attributes);

		return "/WEB-INF/script/game/find_gameword.jsp";
	}
	
	@RequestMapping("/findPlayingWord.do")
	@ResponseBody
	public List<GameWord> findPlayingWord(@RequestParam int gameNum, @RequestParam int difficulty) {
		HashMap map = new HashMap();
		map.put("gameNum", gameNum);
		map.put("difficulty", difficulty);
		
		return gwService.findPlayingWord(map);
	}
}