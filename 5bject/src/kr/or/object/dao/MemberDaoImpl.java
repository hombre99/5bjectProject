package kr.or.object.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.vo.Members;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
	private SqlSessionTemplate session;

	@Autowired
	public MemberDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}

	@Override
	// �쉶�썝 �젙蹂� �궫�엯
	public int insertMember(Members member) {
		return session.insert("memberMapper.insertMember", member);
	}

	@Override
	// �븘�씠�뵒濡� �쉶�썝 �젙蹂� �닔�젙
	public int updateMemberById(Members member) {
		return session.update("memberMapper.updateMemberById", member);
	}

	@Override
	// �븘�씠�뵒濡� �쉶�썝�젙蹂� 議고쉶
	public Members getMemberById(String id) {
		return session.selectOne("memberMapper.selectMemberById", id);
	}

	@Override
	// �븘�씠�뵒濡� �쉶�썝�젙蹂� �궘�젣
	public int removeMemberById(String id) {
		return session.delete("memberMapper.removeMemberById", id);
	}

	@Override
	// �쟾泥� �쉶�썝�젙蹂� 議고쉶
	public List<Members> getMembers() {
		return session.selectList("memberMapper.selectMembers");
	}
}