package kr.or.object.dao;

import java.util.List;

import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

public interface MemberDao {
	Members getMemberById(String id);
	//insertRequest 추가
	int insertRequest(Upload upload);
	//getRequests해서 요청정보 전체공개 20151120 CHJ
	List<Upload> getRequests();
	
	int insertMember(Members member);

	int updateMemberById(Members member);

	int removeMemberById(String id);
	
	List<Members> getMembers();
}
