package kr.or.object.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}