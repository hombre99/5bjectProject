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
	
	//고객문의요청 페이징 처리 
	public List<Upload> getRequests(int pageNo) {
		HashMap map= new HashMap();
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		List<Upload> list= session.selectList("memberMapper.selectRequests",map);
		return list;
	}

	//고객문의요청 페이징 처리시 필요한 값처리
	@Override
	public int selectCountRequests() {
		return session.selectOne("memberMapper.selectCountRequests");
	}
	//고객문의 요청 받기
	@Override
	public int insertRequest(Upload upload) {
		return session.insert("memberMapper.insertRequest",upload);
	}
	// 고객받기
	@Override
	public int insertMember(Members member) {
		return session.insert("memberMapper.insertMember", member);
	}
	//고객정보 업데이트
	@Override
	public int updateMemberById(Members member) {
		return session.update("memberMapper.updateMemberById", member);
	}
	//아이디 값을 받아 고객정보 보기
	@Override
	public Members getMemberById(String id) {
		return session.selectOne("memberMapper.selectMemberById", id);
	}
	//고객정보 지우기.
	@Override
	public int removeMemberById(String id) {
		return session.delete("memberMapper.removeMemberById", id);
	}
	//아이디 전체값 조회.
	@Override
	public List<Members> getMembers() {
		return session.selectList("memberMapper.selectMembers");
	}
	

	@Override
	public List findMemberId(HashMap map) {
		return session.selectList("memberMapper.selectMemberId",map);
	}
	

	@Override
	public String findMemberPassword(HashMap map) {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selectMemberPassword",map);
	}
	

	@Override
	public int updateMemberPassword(HashMap map) {
		// TODO Auto-generated method stub
		return session.update("memberMapper.updateMemberPassword",map);
	}
	

	@Override
	public List<Members> getMembersPaging(int pageNo) {
		HashMap map = new HashMap();
		
		map.put("contentsPerPage", PagingBean.CONTENTS_PER_PAGE);
		map.put("pageNo", pageNo);
		
		List<Members> list = session.selectList("memberMapper.selectMemberPaging",map);
		
		return list;
	}

	@Override
	public int selectCountMembers() {
		return session.selectOne("memberMapper.selectCountMembers");
	}
}