package kr.or.object.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

public interface MemberService {
	Members findMemberById(String id);
	//insertRequest추가 CHJ
	void insertRequest(Upload upload);
	//getRequest for customer requests 20151123 chj pagingean
	
	Map getRequestList(int pageNo);
	
	void insertMember(Members member);

	void updateMemberById(Members member);

	void removeMemberById(String id);
	
	List<Members> getMembers();

	// 20151118. ADD KKH - 잃어버린 아이디찾기
	String findMemberId(HashMap map);
	
	// 20151120. ADD KKH - 잃어버린 비밀번호 찾기
	String findMemberPassword(HashMap map);
	
	// 20151120 ADD KKH - 임시비밀번호로 바꿔주기
	void updateMemberPassword(HashMap map);

	
	// 20151123 ADD KKH - 고객목록 관련 페이징 처리
	Map getMembersPaging(int pageNo);

}