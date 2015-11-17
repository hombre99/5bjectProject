package kr.or.object.service;

import java.util.List;

import kr.or.object.vo.Members;

public interface MemberService {
	Members findMemberById(String id);

	void insertMember(Members member);

	void updateMemberById(Members member);

	void removeMemberById(String id);
	
	List<Members> getMembers();
}