package kr.or.object.service;

import java.util.List;

import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

public interface MemberService {
	Members findMemberById(String id);
	//insertRequest추가 CHJ
	void insertRequest(Upload upload);
	
	void insertMember(Members member);

	void updateMemberById(Members member);

	void removeMemberById(String id);
	
	List<Members> getMembers();
}