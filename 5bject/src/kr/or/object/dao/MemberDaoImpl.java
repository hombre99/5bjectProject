package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.util.PagingBean;
import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
	private SqlSessionTemplate session;

	@Autowired
	public MemberDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}
	@Override
	//chj add 20151120
	public List<Upload> getRequests() {
		return session.selectList("memberMapper.selectRequests");
	}
	//chj add
	@Override
	public int insertRequest(Upload upload) {
		return session.insert("memberMapper.insertRequest",upload);
	}

	@Override
	public int insertMember(Members member) {
		return session.insert("memberMapper.insertMember", member);
	}

	@Override
	public int updateMemberById(Members member) {
		return session.update("memberMapper.updateMemberById", member);
	}

	@Override
	public Members getMemberById(String id) {
		return session.selectOne("memberMapper.selectMemberById", id);
	}

	@Override
	public int removeMemberById(String id) {
		return session.delete("memberMapper.removeMemberById", id);
	}

	@Override
	public List<Members> getMembers() {
		return session.selectList("memberMapper.selectMembers");
	}
	
	// 20151118. KKH ADD - 아이디 찾기
	@Override
	// 잃어버린 아이디 찾기
	public String findMemberId(HashMap map) {
		
		return session.selectOne("memberMapper.selectMemberId",map);
	}
	
	// 20151120. ADD KKH - 잃어버린 비밀번호 찾기
	@Override
	public String findMemberPassword(HashMap map) {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selectMemberPassword",map);
	}
	
	// 20151120. ADD KKH - 임시비밀번호로 바꿔주기
	@Override
	public int updateMemberPassword(HashMap map) {
		// TODO Auto-generated method stub
		return session.update("memberMapper.updateMemberPassword",map);
	}
	
	//20151123. ADD KKH - 고객목록 페이징 처리
	@Override
	public List<Members> getMembersPaging(int pageNo) {
		HashMap map = new HashMap();
		
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		
		List<Members> list = session.selectList("memberMapper.selectMemberPaging",map);
		
		return list;
	}
	
	// 20151123. KKH ADD - 아이디 조회시 paging 처리관련
	@Override
	public int selectCountMembers() {
		return session.selectOne("memberMapper.selectCountMembers");
	}
	
	
	
	
}