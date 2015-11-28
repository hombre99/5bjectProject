package kr.or.object.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

public interface MemberService {
	Members findMemberById(String id);
	//고객문의요청 등록시 필요
	void insertRequest(Upload upload);
	
	//고객문의요청 조회시 페이징처리
	Map getRequestList(int pageNo);
	
	//고객등록시 필요
	void insertMember(Members member);
	
	//고객정보 업데이트시 필요
	void updateMemberById(Members member);

	//고객을 제거시 필요
	void removeMemberById(String id);
	
	//고객문의목록 삭제시 필요 
	void removeRequestByDate(String date);
	
	//고객 정보 조회시 필요
	List<Members> getMembers();

	//잃어버린 아이디 찾기
	List findMemberId(HashMap map);
	
	//잃어버린 비밀번호 찾기
	String findMemberPassword(HashMap map);
	
	//임시비밀번호로 바꿔주기
	void updateMemberPassword(HashMap map);

	
	//고객목록 관련 페이징 처리
	Map getMembersPaging(int pageNo);

}