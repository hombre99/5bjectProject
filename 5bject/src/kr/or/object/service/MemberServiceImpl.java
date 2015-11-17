package kr.or.object.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.object.dao.MemberDao;
import kr.or.object.vo.Members;
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	private MemberDao dao;
	
	@Autowired
	private MemberServiceImpl(MemberDao dao) {
		this.dao = dao;
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
}