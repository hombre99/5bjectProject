package kr.or.object.dao;

import java.util.List;

import kr.or.object.vo.Members;
// MemberDao ddd
public interface MemberDao {
	Members getMemberById(String id);

	int insertMember(Members member);

	int updateMemberById(Members member);

	int removeMemberById(String id);
	
	List<Members> getMembers();
}
