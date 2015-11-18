package kr.or.object.controller;

import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.object.service.MemberService;
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
			}
		} else {
			String error = "아이디 또는 비밀번호를 정확하게 입력하여 주세요.";
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
	public String memberInfo(HttpSession session, @RequestParam String id){
		Members member = service.findMemberById(id);
		session.setAttribute("memberInfo", member);
		return "/WEB-INF/script/login/member_info.jsp";
	}
	
	@RequestMapping("/memberList.do")
	public String memberList(HttpSession session){
		
		List<Members> members = service.getMembers();
		
		// 20151118. 관리자 정보는 회원 ID에서 삭제
		for(int i =0; i<members.size(); i++){
			if((members.get(i).getId()).equals("objectclass")){
				members.remove(i);
			}
		}
		
		session.setAttribute("member", members);
		return "/WEB-INF/script/login/member_list.jsp";
	}
	
	@RequestMapping("/memberRemove.do")
	public String remove(HttpSession session, @RequestParam String id){
		service.removeMemberById(id);
		
		return "/member/memberList.do";
	}
	
	@RequestMapping("/update_member.do")
	public String memberUpdate(HttpSession session, @ModelAttribute Members member){
		service.updateMemberById(member);
		return "/WEB-INF/script/login/member_list.jsp";
	}
	//ADD. 20151118. CHJ -고객 문의 요청 Controller
	@RequestMapping("request_member.do")
	public String RequestUpload(@RequestParam String requestId, @RequestParam String requestInfo, @RequestParam MultipartFile upImage
			,HttpServletRequest request, ModelMap map) throws IOException{
		Date today = new Date();
		String date = new SimpleDateFormat("yyyyMMdd").format(today);
		Upload upload = new Upload(requestId, requestInfo, date);
		//return 값 일괄적으로 처리
		String url = " ";

		if(!requestInfo.isEmpty()){
			if (upImage!=null){
				//파일에 시간을 같이 넣어 회원들 요청을 매칭하여 관리
				String downFileName = date+"_"+upImage.getOriginalFilename();
				new ModelAndView("downloadView","downFileName",downFileName);
				System.out.println(downFileName);
				
				String direction = request.getServletContext().getRealPath("/upImage");
				File uploadImg = new File(direction, downFileName);
				upImage.transferTo(uploadImg);
			}
			service.insertRequest(upload);
			url= "/WEB-INF/script/login/mypage.jsp";
		}else{	
			String error ="문의사항을 정확하게 입력하여 주세요.";
			request.setAttribute("error", error);
			url = "/WEB-INF/script/login/request_member.jsp";
		}
		 return url;
	}
	

}