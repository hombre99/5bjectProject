package kr.or.object.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.object.service.MemberService;
import kr.or.object.validator.MemberValidator;
import kr.or.object.vo.Members;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value="/register_form_validate.do", method=RequestMethod.POST)
	public String registerValidate(@ModelAttribute Members member, Errors errors) {
		MemberValidator validate = new MemberValidator();

		validate.validate(member, errors);

		System.out.printf("Total Error Count [ %d ]\n", errors.getErrorCount());

		if ( errors.hasErrors() ) {
			return "/WEB-INF/script/login/register_form_validate.jsp";
		}

		System.out.printf("EmailAddress[ %s ] EmailId[ %s ]\n",
											member.getEmailAddress(), member.getEmailId());

		service.insertMember(member);

		// return "/WEB-INF/script/login/register_success.jsp";
		return "/member/register_success.do";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, @RequestParam String id, @RequestParam String password) {
		// 로그인 체크 - 모델 요청
		// 성공 : HttpSession에 로그인 여부 체크할 Attribute를 binding
		// login = service.findMemberById(id);	// 회원의 정보가 넘어온다.
		Members login = service.findMemberById(id);
		
		if ( login != null ) {
			if ( id.equals(login.getId()) && password.equals(login.getPassword()) ) {
				session.setAttribute("id", id);
				session.setAttribute("member", login);
			}
		} else {
			String error = "아이디 또는 비밀번호를 확인하세요.";
			
			session.setAttribute("error", error);
		}
		return "/WEB-INF/script/main.jsp";
	}
	
	// ADD. 20151116. KKH
	@RequestMapping("/update_form.do")
	public String update(HttpSession session, @ModelAttribute Members member) {
		service.updateMemberById(member);
		session.setAttribute("member", member);
		return "/WEB-INF/script/login/update_result.jsp";
	}
	
	// ADD. 20151116. KKH
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate(); // 세션을 전부 삭제
		return "/WEB-INF/script/main.jsp";
	}
	
	// ADD. 20151116. KKH
	@RequestMapping("/leave.do")
	public String leave(HttpSession session, @RequestParam String id){
		service.removeMemberById(id);
		session.invalidate(); // 세션을 전부 삭제
		return "/WEB-INF/script/main.jsp";
	}
	
	@RequestMapping("/memberInfo.do")
	public String memberInfo(HttpSession session, @RequestParam String id){
		Members member = service.findMemberById(id);
		session.setAttribute("memberInfo", member);
		return "/WEB-INF/script/login/member_info.jsp";
	}
	
	@RequestMapping("/memberList.do")
	public String memberList(HttpSession session){
		List<Members> members = service.getMembers();
		session.setAttribute("member", members);
		return "/WEB-INF/script/login/member_list.jsp";
	}
	
	@RequestMapping("/memberRemove.do")
	public String remove(HttpSession session, @RequestParam String id){
		service.removeMemberById(id);
		
		return "/member/memberList.do";
	}
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(HttpSession session, @ModelAttribute Members member){
		service.updateMemberById(member);
		return "/WEB-INF/script/login/member_update.jsp";
	}
}