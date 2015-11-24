package kr.or.object.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String gameScore(//@ModelAttribute GameScore gameScore,
			@RequestParam String id, @RequestParam int gameNum,
			@RequestParam int easy, @RequestParam int normal, @RequestParam int hard,
			@RequestParam int difficulty, HttpSession session) {
		GameScore gameScore = new GameScore(id, gameNum, easy, normal, hard);
		if ( gameScore.getId().length() == 0 ) {
			// not exist id
			System.out.println("NOT EXIST ID");
			return null;
		} else {
			HashMap map = new HashMap();
			map.put("id", gameScore.getId());
			map.put("gameNum", gameScore.getGameNum());
			List<GameScore> list = gsService.selectGameScore(map);
			
			if ( list.size() == 1 ) {
				if ( difficulty == 2 ) {
					if ( list.get(0).getEasy() >= gameScore.getEasy() ) {
						gameScore.setEasy(list.get(0).getEasy());
					}
					gameScore.setNormal(list.get(0).getNormal());
					gameScore.setHard(list.get(0).getHard());
				} else if ( difficulty == 3 ) {
					gameScore.setEasy(list.get(0).getEasy());
					if ( list.get(0).getNormal() >= gameScore.getNormal() ) {
						gameScore.setNormal(list.get(0).getNormal());
					}
					gameScore.setHard(list.get(0).getHard());
				} else if ( difficulty == 4 ) {
					gameScore.setEasy(list.get(0).getEasy());
					gameScore.setNormal(list.get(0).getNormal());
					if ( list.get(0).getHard() >= gameScore.getHard() ) {
						gameScore.setHard(list.get(0).getHard());
					}
				}

				if ( list.get(0).getGameNum() == -1 || list.get(0).getGameNum() == gameScore.getGameNum() ) {
					gsService.updateGameScore(gameScore);
				} else {
					gsService.insertGameScore(gameScore);
				}
			// 여러 게임정보가 있음.
			} else {
				for ( GameScore gs : list ) {
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
	
					if ( gs.getGameNum() == -1 || gs.getGameNum() == gameScore.getGameNum() ) {
						gsService.updateGameScore(gameScore);
					} else {
						gsService.insertGameScore(gameScore);
					}
				}
			}
		}
		return "/game/game.do?gameNum=" + gameScore.getGameNum() + "&difficulty=" + difficulty;
	}
	
	@RequestMapping("/addWord.do")
	public String addWord(@RequestParam int gameNum, @RequestParam int difficulty, @RequestParam String word) {
		GameWord gw = new GameWord(gameNum, difficulty, word);
		gwService.addWord(gw);

		return "/WEB-INF/script/game/add_gameword.jsp";
	}

			
	@RequestMapping("/findWord.do")
	public String findWord(@RequestParam String word, HttpSession session) {
		GameWord gw = gwService.findWord(word);

		if ( gw != null ) {
			session.setAttribute("gameWord", gw);
		} else {
			session.setAttribute("errMsg", "조회결과가 없습니다.");
		}
			
		return "/WEB-INF/script/game/find_gameword.jsp";
	}
	
	@RequestMapping("/findAllWord.do")
	public String findAllWord(HttpSession session) {
		List<GameWord> wordList = gwService.findAllWord();
		if ( wordList != null ) {
			session.setAttribute("wordList", wordList);
		} else {
			session.setAttribute("errMsg", "조회결과가 없습니다.");
		}

		return "/WEB-INF/script/game/find_gameword.jsp";
	}
}