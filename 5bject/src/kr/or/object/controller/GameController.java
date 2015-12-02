package kr.or.object.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	private static Logger logger = Logger.getLogger(GameController.class);

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
			if ( logger.isInfoEnabled() )
				logger.info("NOT EXIST ID");

			return "alert('아이디가 존재하지 않습니다.');";
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
		return null;
	}
	
	@RequestMapping("/addWord.do")
	public String addWord(@RequestParam int gameNum, @RequestParam int difficulty, @RequestParam String word) {
		GameWord gw = new GameWord(gameNum, difficulty, word);
		gwService.addWord(gw);

		return "/WEB-INF/script/game/add_gameword.jsp";
	}

	@RequestMapping("/removeWord.do")
	@ResponseBody
	public String removeWord(@ModelAttribute GameWord gw) {
		if ( logger.isInfoEnabled() )
			logger.info("gameword : " + gw);

		gwService.removeWord(gw);

		return "/5bject/game/findAllWord.do";
	}
			
	@RequestMapping("/findWord.do")
	public String findWord(@RequestParam String word, @RequestParam String pageNo, ModelMap model) {
		int page = 1;
		
		try {
			page = Integer.parseInt(pageNo);
		} catch ( NumberFormatException e ) {
		}

		Map map = gwService.findWord(word, page);
		List list = (List)map.get("list");
		
		if ( logger.isInfoEnabled() )
			logger.info("list : " + list);
		
		if ( list.size() == 1 ) {
			map.put("gameWord", list.get(0));
		} else if ( list.size() > 1 ) {
			map.put("list", list);
			map.put("controllerName", "findWord");
		}
		
		model.addAllAttributes(map);
		System.out.println(map);
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
		attributes.put("controllerName", "findAllWord");
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