package kr.or.object.controller;

import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.template.AttributeResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.object.service.MemberService;
import kr.or.object.util.PagingBean;
import kr.or.object.validator.MemberValidator;
import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/register_form_validate.do", method = RequestMethod.POST)
	public String registerValidate(@ModelAttribute Members member, Errors errors) {
		MemberValidator validate = new MemberValidator();
		validate.validate(member, errors);

		System.out.printf("Total Error Count [ %d ]\n", errors.getErrorCount());
		if (errors.hasErrors()) {
			return "/WEB-INF/script/login/register_form_validate.jsp";
		}

		System.out.printf("EmailAddress[ %s ] EmailId[ %s ]\n", member.getEmailAddress(), member.getEmailId());
		service.insertMember(member);
		// return "/WEB-INF/script/login/register_success.jsp";
		return "/member/register_success.do";
	}

	@RequestMapping("/login.do")
	public String login(HttpSession session, @RequestParam String id, @RequestParam String password) {
		Members login = service.findMemberById(id);

		if (login != null) {
			if (id.equals(login.getId()) && password.equals(login.getPassword())) {
				session.setAttribute("id", id);
				session.setAttribute("member", login);
			} else {
				// 20151124
				String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
				session.setAttribute("error", error);
			}
		} else {
			String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
			session.setAttribute("error", error);
		}
		return "/WEB-INF/script/main.jsp";
	}

	// ADD. 20151116. KKH - 20151124 CHJ validator ADD
	@RequestMapping("/update_form.do")
	public String update(HttpSession session, @ModelAttribute Members member, Errors errors) {
		MemberValidator validate = new MemberValidator();
		System.out.println(member);
		if (service.findMemberById(member.getId()).equals(member)) {
			String error = "회원정보를 수정해주셔야합니다.";
			session.setAttribute("error", error);
		}else{
			validate.validate(member, errors);
			if(errors.hasErrors()){
				return "/WEB-INF/script/login/update_result.jsp";
			}
			service.updateMemberById(member);
			session.setAttribute("member", member);
		}
		return "/WEB-INF/script/login/update_result.jsp";
	}


	// ADD. 20151116. KKH
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); //
		return "/WEB-INF/script/main.jsp";
	}

	// ADD. 20151116. KKH
	@RequestMapping("/leave.do")
	public String leave(HttpSession session, @RequestParam String id) {
		service.removeMemberById(id);
		session.invalidate(); //
		return "/WEB-INF/script/main.jsp";
	}

	@RequestMapping("/memberInfo.do")
	public String memberInfo(HttpSession session, @RequestParam String id) {
		Members member = service.findMemberById(id);
		session.setAttribute("memberInfo", member);
		return "/WEB-INF/script/login/member_info.jsp";
	}

	// 20151123. ADD KKH
	@RequestMapping("/memberList.do")
	public String list(@RequestParam(defaultValue = "1") String pageNo, ModelMap model) {
		int page = 1;
		try {
			page = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}

		Map attributes = service.getMembersPaging(page);
		model.addAllAttributes(attributes);
		return "/WEB-INF/script/login/member_list.jsp";
	}

	@RequestMapping("/memberRemove.do")
	public String remove(HttpSession session, @RequestParam String id) {
		service.removeMemberById(id);

		return "/member/memberList.do";
	}
	/*20151124 Error  CHJADD */
	@RequestMapping("/update_member.do")
	public String memberUpdate(HttpSession session, @ModelAttribute Members member, Errors errors) {
		MemberValidator validate = new MemberValidator();
		System.out.println(member);
		if (service.findMemberById(member.getId()).equals(member)) {
			String error = "회원정보를 수정해주셔야합니다.";
			System.out.println(error);
			session.setAttribute("error", error);
		}else{
			validate.validate(member, errors);
			if(errors.hasErrors()){
				return "/WEB-INF/script/login/member_list.jsp";
			}
			service.updateMemberById(member);
			session.setAttribute("member", member);
		}
		return "/WEB-INF/script/login/member_list.jsp";
	}

	// ADD. 2015118~20. CHJ -고객 문의 요청 Controller
	@RequestMapping("request_member.do")
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
				System.out.println(downFileName);
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

	// 20151120 chj select upload ADD
	@RequestMapping("request_list.do")
	public String requestList(@RequestParam(defaultValue = "1") String pageNo, ModelMap model) {

		int page = 1;
		try {
			page = Integer.parseInt(pageNo);
		} catch (NumberFormatException e) {
		}
		Map attributes = service.getRequestList(page);
		model.addAllAttributes(attributes);
		System.out.println(attributes);
		return "/WEB-INF/script/login/request_list.jsp";

	}

	// 20151120. ADD KKH - 잃어버린 ID찾기
	@RequestMapping(value = "/find_memberId.do", method = RequestMethod.POST)
	public String findMemberId(HttpServletRequest request, @RequestParam String emailId, @RequestParam String emailAddress,
			@RequestParam long phoneNumber) {
		// System.out.printf("eID[%s]eAdd[%s]pn[0%d]\n", emailId, emailAddress,
		// phoneNumber);
		HashMap map = new HashMap();
		map.put("emailId", emailId);
		map.put("emailAddress", emailAddress);
		map.put("phoneNumber", phoneNumber);
		List idList = service.findMemberId(map);
		
		if(idList.size()!=0){
			request.setAttribute("memId", idList);
		}
		return "/WEB-INF/script/login/find_id_result.jsp";
	}

	// 20151120. ADD KKH - 잃어버린 비밀번호 찾기
	@RequestMapping(value = "/find_MemberPassword.do", method = RequestMethod.POST)
	public String findMemberPassword(HttpServletRequest request, @RequestParam String id, @RequestParam String emailId,
			@RequestParam String emailAddress, @RequestParam long phoneNumber) {
		HashMap<String, Object> map = new HashMap();
		map.put("id", id);
		map.put("emailId", emailId);
		map.put("emailAddress", emailAddress);
		map.put("phoneNumber", phoneNumber);
		String password = service.findMemberPassword(map);
		request.setAttribute("password", password);

		if (password != null) {
			// 총 36개의 문자
			System.out.println(id); // test
			String[] str = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
					"s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
			String newPassword = "";
			for (int i = 0; i < 7; i++) {
				int j = (int) (Math.random() * 36);
				newPassword = newPassword + str[j];
			}
			System.out.println(newPassword); // test
			map.put("newPassword", newPassword);
			service.updateMemberPassword(map);
			request.setAttribute("newPassword", newPassword);
		}
		return "/WEB-INF/script/login/find_password_result.jsp";
	}
}