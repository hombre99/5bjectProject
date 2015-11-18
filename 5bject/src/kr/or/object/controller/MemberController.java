package kr.or.object.controller;

import java.util.List;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import kr.or.object.service.MemberService;
import kr.or.object.validator.MemberValidator;
import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

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
		// 濡쒓렇�씤 泥댄겕 - 紐⑤뜽 �슂泥�
		// �꽦怨� : HttpSession�뿉 濡쒓렇�씤 �뿬遺� 泥댄겕�븷 Attribute瑜� binding
		// login = service.findMemberById(id);	// �쉶�썝�쓽 �젙蹂닿� �꽆�뼱�삩�떎.
		Members login = service.findMemberById(id);
		
		if ( login != null ) {
			if ( id.equals(login.getId()) && password.equals(login.getPassword()) ) {
				session.setAttribute("id", id);
				session.setAttribute("member", login);
			}
		} else {
			String error = "�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇瑜� �솗�씤�븯�꽭�슂.";
			
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
		session.invalidate(); // �꽭�뀡�쓣 �쟾遺� �궘�젣
		return "/WEB-INF/script/main.jsp";
	}
	
	// ADD. 20151116. KKH
	@RequestMapping("/leave.do")
	public String leave(HttpSession session, @RequestParam String id){
		service.removeMemberById(id);
		session.invalidate(); // �꽭�뀡�쓣 �쟾遺� �궘�젣
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
	//ADD. 20151117. CHJ -고객 문의 요청 Controller
	@RequestMapping("request_member.do")
	public String RequestUpload(@RequestParam String requestId, @RequestParam String requestInfo, @RequestParam MultipartFile upImage
			,HttpServletRequest request, ModelMap map) throws IOException{
		  long today =System.currentTimeMillis();
		  String date = new SimpleDateFormat("yyyyMMdd").format(today);	
		Upload upload= new Upload(requestId, requestInfo, date);
		
		if(upImage!=null&&!upImage.isEmpty()){
			String fileName = upImage.getOriginalFilename();		
			long fileSize = upImage.getSize();
			//console에서 그냥 보여주는 용도.
			System.out.println(fileName+"-"+fileSize);
			long timeMilis = System.currentTimeMillis();
			String direction = request.getServletContext().getRealPath("/upImage");
			File uploadImg = new File(direction,fileName);
			File file = new File("c:\\java\\down", timeMilis+" ");
			upImage.transferTo(uploadImg);			
		}else{
			service.insertRequest(upload);
		}
			return "/WEB-INF/script/login/mypage.jsp";
	}
	

}