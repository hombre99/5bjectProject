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
	
	//20151120 service 추가 chj
	@Override
	public Map getRequestList(int pageNo){
		HashMap map = new HashMap();
		map.put("list", dao.getRequests(pageNo));
		PagingBean pagingBean = new PagingBean(dao.selectCountRequests(),pageNo);
		map.put("pagingBean", pagingBean);
		return map;
	}
	
	@Override
	public Members findMemberById(String id) {
		return dao.getMemberById(id);
	}

	@Override
	public void insertMember(Members member) {
		dao.insertMember(member);
	}

	@Override
	public void updateMemberById(Members newMember) {
		dao.updateMemberById(newMember);
	}

	@Override
	public void removeMemberById(String id) {
		dao.removeMemberById(id);
	}
	
	public List<Members> getMembers() {
		return dao.getMembers();
	}

	// 20151124. KKH ADD - 아이디 찾기
	@Override
	public List findMemberId(HashMap map) {
		return dao.findMemberId(map);
	}

	// 20151120. ADD KKH - 잃어버린 비밀번호 찾기
	@Override
	public String findMemberPassword(HashMap map) {
		return dao.findMemberPassword(map);
	}
	
	// 20151120 ADD KKH - 임시비밀번호로 바꿔주기
	@Override
	public void updateMemberPassword(HashMap map) {
		dao.updateMemberPassword(map);
	}

	//20151123 ADD KKH - 고객목록 관련 페이징 처리
	@Override
	public Map getMembersPaging(int pageNo) {
		HashMap map = new HashMap();
		map.put("list", dao.getMembersPaging(pageNo));
		PagingBean pagingBean = new PagingBean(dao.selectCountMembers(),pageNo);
		map.put("pagingBean", pagingBean);
		return map;
	}
	
	// 20151123 추가
	public int getCountMember(){
		return dao.selectCountMembers();
	}

	
	

}