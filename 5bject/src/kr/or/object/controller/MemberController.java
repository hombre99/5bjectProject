package kr.or.object.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.object.service.GameScoreService;
import kr.or.object.service.MemberService;
import kr.or.object.validator.MemberValidator;
import kr.or.object.vo.GameScore;
import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private GameScoreService gameService;
	
	private static Logger logger = Logger.getLogger(MemberController.class);
	
	//회원가입시-게임시  필요한 컨트롤러 
	@RequestMapping(value = "/register_form_validate.do", method = RequestMethod.POST)
	@Transactional(rollbackFor={Exception.class})
	
	public String registerValidate(HttpServletRequest request, @ModelAttribute Members member, Errors errors) {
		MemberValidator validate = new MemberValidator();
		validate.validate(member, errors);

		if (errors.hasErrors()) {
			request.setAttribute("members", member);
			return "/WEB-INF/script/login/register_form_validate.jsp";
		}

		if (logger.isInfoEnabled() )
			logger.info("EmailId[ " + member.getEmailId() + " ] EmailAddress[ " + member.getEmailAddress() + " ]");

		service.insertMember(member);		
		gameService.insertMember(member.getId());

		return "/member/register_success.do";
	}

	//아이디 중복검사 - Ajax랑 연동.
	@RequestMapping("/idDuplicatedCheck.do")
	@ResponseBody
	public String idDuplicatedCheck(@RequestParam String id){
		Members member = service.findMemberById(id);
		return String.valueOf(member!=null);
	}

	//로그인시 필요한 컨트롤러
	/* 20151127. NOT_USE. JSJ
	@RequestMapping("/login.do")
	public String login(HttpSession session, @RequestParam String id, @RequestParam String password) {
		Members login = service.findMemberById(id);

		if (login != null) {
			if (id.equals(login.getId()) && password.equals(login.getPassword())) {
				session.setAttribute("id", id);
				session.setAttribute("member", login);
			}else{
				//20151124
				String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
				session.setAttribute("error", error);
			}
		} else {
			String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
			session.setAttribute("error", error);
		}
		return "/WEB-INF/script/main.jsp";
	}
	*/
	
	/* 20151127. ADD. 로그인 로직 AJAX로 수정 */
	@RequestMapping("/login.do")
	@ResponseBody
	public String login(HttpSession session, @RequestParam String id, @RequestParam String password) {
		Members login = service.findMemberById(id);
		List<GameScore> score =  gameService.selectGameScore(id);
		if ( login != null ) {
			if ( id.equals(login.getId()) && password.equals(login.getPassword()) ) {
				session.setAttribute("id", id);
				session.setAttribute("member", login);
				session.setAttribute("score", score);
			} else {
				String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
				session.setAttribute("error", error);
			}
		} else {
			String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
			session.setAttribute("error", error);
		}

		return "/5bject/main.do";
	}

	//고객이 자신의 정보 업데이트시 필요한 컨드롤러
	@RequestMapping(value="/update_form.do", method = RequestMethod.POST)
	public String update(HttpSession session, @ModelAttribute Members member, Errors errors) {	
		MemberValidator validate = new MemberValidator();
		validate.validate(member, errors);
		if(errors.hasErrors()){
			return "/WEB-INF/script/login/update_form.jsp";
			}
		
		service.updateMemberById(member);
		session.setAttribute("member", member);	
		return "/WEB-INF/script/login/update_result.jsp";
			
	}
	
	//관리자가 회원들의 정보 업데이트시 필요한 컨트롤러
	@RequestMapping(value="/update_member.do", method = RequestMethod.POST)
	public String memberUpdate(HttpSession session, @ModelAttribute Members member) {
			service.updateMemberById(member);
			session.setAttribute("memberInfo", member);		
			return "/WEB-INF/script/login/member_info2.jsp";
	}

	// 로그아웃시 필요한 컨트롤러
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "/WEB-INF/script/main.jsp";
	}

	// 로그아웃시 필요한 컨트롤러
	@RequestMapping("/leave.do")
	public String leave(HttpSession session, @RequestParam String id) {
		service.removeMemberById(id);
		session.invalidate();
		return "/WEB-INF/script/main.jsp";
	}
	
	//관리자가 회원의 이름을 클릭시 고객정보가 보이도록 하는 컨트롤러
	@RequestMapping("/memberInfo.do")
	public String memberInfo(HttpSession session, @RequestParam String id) {
		Members member = service.findMemberById(id);
		session.setAttribute("memberInfo", member);
		return "/WEB-INF/script/login/member_info.jsp";
	}

	//관리자가 회원정보 조회시 필요한 컨트롤러 
	@RequestMapping("/memberList.do")
	public String list(@RequestParam(defaultValue = "1") String pageNo, ModelMap model) {
		int page = 1;
		try {
			page = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}
		Map attributes = service.getMembersPaging(page);
		List<Members> list2 = (List<Members>) attributes.get("list");

		for(int i=0; i<list2.size(); i++){
			if ( list2.get(i).getId().equals("objectclass")){
				list2.remove(i);
			}
		}
		model.addAllAttributes(attributes);
		return "/WEB-INF/script/login/member_list.jsp";
	}

	@RequestMapping("/memberRemove.do")
	@Transactional(rollbackFor={Exception.class})
	public String remove(HttpSession session, @RequestParam String id) {
		service.removeMemberById(id);
		gameService.removeGameScore(id);
		return "/member/memberList.do";
	}
	
	//관리자가 고객문의요청을 삭제하는 컨트롤러
	@RequestMapping("/request_remove.do")
	@Transactional(rollbackFor={Exception.class})
	public String remove(@RequestParam String date){
		service.removeRequestByDate(date);		
		return "/member/request_list.do";
	}
	
	//관리자가 고객정보를 업데이트
	@RequestMapping("/update_member.do")
	public String memberUpdate(HttpSession session, @ModelAttribute Members member, Errors errors) {
        service.updateMemberById(member);
        session.setAttribute("memberInfo", member);      
        return "/WEB-INF/script/login/member_info2.jsp";
	}

	//고객이 관리자에게 문의 요청하는 컨트롤러
	@RequestMapping("/request_member.do")
	public String RequestUpload(@RequestParam String requestId, @RequestParam String requestInfo,
			@RequestParam MultipartFile upImage, HttpServletRequest request) throws IOException {
		// 한글처리
		request.setCharacterEncoding("euc-kr");

		Date today = new Date();
		String date = new SimpleDateFormat("yyyyMMdd HHmmss").format(today);
		Upload upload = new Upload(requestId, requestInfo, date);
		// return 값 일괄적으로 처리
		String url = " ";

		if (!requestInfo.isEmpty()) {
			if (upImage != null) {
				// 파일에 시간을 같이 넣어 회원들 요청을 매칭하여 관리
				String downFileName = date + "_" + upImage.getOriginalFilename();

				if ( logger.isInfoEnabled() )
					logger.info("downFileName : " + downFileName);

				// c:\\java\\request에 회원들이 요청하는 파일이 도착하는 경로 설정
				File destFile = new File("c:\\Java\\request", downFileName);
				upImage.transferTo(destFile);
			}
			service.insertRequest(upload);
			url = "/WEB-INF/script/login/mypage.jsp";
		} else {
			String error = "문의사항을 정확하게 입력하여 주세요.";
			request.setAttribute("error", error);
			url = "/WEB-INF/script/login/request_member.jsp";
		}
		return url;
	}

	//  관리자가 고객문의요청 리스트를 조회하는 컨트롤러 
	@RequestMapping("/request_list.do")
	public String requestList(@RequestParam(defaultValue = "1") String pageNo, ModelMap model) {
		int page = 1;		
			try {
				page = Integer.parseInt(pageNo);
			}catch (NumberFormatException e) {
			}
			 
			Map attributes = service.getRequestList(page);
			List<Upload> list = (List<Upload>)attributes.get("list");
			model.addAllAttributes(attributes);
		
		if ( logger.isInfoEnabled() )
			logger.info("attributes : " + attributes);

		return "/WEB-INF/script/login/request_list.jsp";

	}

	// 잃어버린 아이디를 찾는 컨트롤러
	@RequestMapping(value = "/find_memberId.do", method = RequestMethod.POST)
	public String findMemberId(HttpServletRequest request ,@RequestParam String emailId, @RequestParam String emailAddress, @RequestParam String phoneNumber){
		if ( logger.isInfoEnabled() )
			logger.info("eID[" + emailId + "]eAdd[" + emailAddress + "]pn[" + phoneNumber + "]");
		
		HashMap map = new HashMap();
		map.put("emailId", emailId);
		map.put("emailAddress", emailAddress);
		map.put("phoneNumber",phoneNumber);
		List idList = service.findMemberId(map);
		if(idList.size()!=0){
			request.setAttribute("memId", idList);
		}
		return "/WEB-INF/script/login/find_id_result.jsp";  
	}

	// 잃어버린 비밀번호 찾는 컨트롤러 
	@RequestMapping(value = "/find_MemberPassword.do", method = RequestMethod.POST)
	public String findMemberPassword(HttpServletRequest request, @RequestParam String id, @RequestParam String emailId,
			@RequestParam String emailAddress, @RequestParam String phoneNumber){
		HashMap map = new HashMap();

		map.put("id", id);
		map.put("emailId", emailId);
		map.put("emailAddress", emailAddress);
		map.put("phoneNumber", phoneNumber);
		String password = service.findMemberPassword(map);

		request.setAttribute("password", password);
		
		if (password != null) {
			// 총 36개의 문자
			if ( logger.isInfoEnabled() )
				logger.info("ID : " + id);

			String[] str = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
					"s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
			String newPassword = "";

			for (int i = 0; i < 7; i++) {
				int j = (int) (Math.random() * 36);
				newPassword = newPassword + str[j];
			}

			if ( logger.isInfoEnabled() )
				logger.info("newPassword : " + newPassword);

			map.put("newPassword", newPassword);
			service.updateMemberPassword(map);
			request.setAttribute("newPassword", newPassword);
		}
		return "/WEB-INF/script/login/find_password_result.jsp";
	}
}