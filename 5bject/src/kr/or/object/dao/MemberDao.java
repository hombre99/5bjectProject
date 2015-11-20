package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

public interface MemberDao {
	Members getMemberById(String id);
	
	int insertRequest(Upload upload);
	//getRequests해서 요청정보 전체공개 20151120 CHJ
	List<Upload> getRequests();
	
	int insertMember(Members member);

	int updateMemberById(Members member);

	int removeMemberById(String id);
	
	List<Members> getMembers();
	
	// 20151118. KKH ADD - 아이디 찾기
	String findMemberId(HashMap map);
	
	// 20151120. ADD KKH - 잃어버린 비밀번호 찾기
	String findMemberPassword(HashMap map);
	
	// 20151120. ADD KKH - 임시비밀번호로 바꿔주기
	int updateMemberPassword(HashMap map);
}
