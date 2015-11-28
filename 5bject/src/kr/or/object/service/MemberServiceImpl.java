package kr.or.object.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.object.dao.MemberDao;
import kr.or.object.util.PagingBean;
import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	private MemberDao dao;
	
	@Autowired
	private MemberServiceImpl(MemberDao dao) {
		this.dao = dao;
	}

	@Override
	public void insertRequest(Upload upload) {
		dao.insertRequest(upload);
	}
	
	//고객문의요청 리스트 조회 및 페이징 처리
	@Override
	public Map getRequestList(int pageNo){
		HashMap map = new HashMap();
		map.put("list", dao.getRequests(pageNo));
		PagingBean pagingBean = new PagingBean(dao.selectCountRequests(),pageNo);
		map.put("pagingBean", pagingBean);
		return map;
	}
	//고객아이디를 찾는 컨트롤러
	@Override
	public Members findMemberById(String id) {
		return dao.getMemberById(id);
	}
	//고객등록시 필요한 컨트롤러
	@Override
	public void insertMember(Members member) {
		dao.insertMember(member);
	}
	//고객 업데이트시 필요한 컨트롤러
	@Override
	public void updateMemberById(Members newMember) {
		dao.updateMemberById(newMember);
	}
	//고객 제거시 필요한 컨틀로러
	@Override
	public void removeMemberById(String id) {
		dao.removeMemberById(id);
	}
	
	//고객문의요청 리스트 삭제하기 위한 컨트롤러
	@Override
	public void removeRequestByDate(String date) {
		dao.removeRequestByDate(date);
	}
	
	//고객들의 정보 조회시 필요한 컨트롤러
	public List<Members> getMembers() {
		return dao.getMembers();
	}
	
	//고객 아이디 찾기
	@Override
	public List findMemberId(HashMap map) {
		return dao.findMemberId(map);
	}


	//잃어버린 비밀번호 찾기
	@Override
	public String findMemberPassword(HashMap map) {
		return dao.findMemberPassword(map);
	}
	
	// 임시비밀번호로 바꿔주기
	@Override
	public void updateMemberPassword(HashMap map) {
		dao.updateMemberPassword(map);
	}

	// 고객목록 관련 페이징 처리
	@Override
	public Map getMembersPaging(int pageNo) {
		HashMap map = new HashMap();
		map.put("list", dao.getMembersPaging(pageNo));
		PagingBean pagingBean = new PagingBean(dao.selectCountMembers(),pageNo);
		map.put("pagingBean", pagingBean);
		return map;
	}
	
	//고객정보 페이징 처리시 필요한 
	public int getCountMember(){
		return dao.selectCountMembers();
	}
}