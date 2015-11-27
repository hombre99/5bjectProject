package kr.or.object.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.object.vo.Members;
import kr.or.object.vo.Upload;

public interface MemberDao {
	Members getMemberById(String id);
	
	int insertRequest(Upload upload);
	//getRequests해서 요청정보 전체공개 20151123 CHJ 
	List<Upload> getRequests(int pageNo);
	
	//고객문의 요청 페이지 처리에 필요
	int selectCountRequests();
	
	//고객의 회원가입시 필요
	int insertMember(Members member);
	
	//아이디값을 받아 회원정보를 업데이트 
	int updateMemberById(Members member);
	
	//아이디 값을 받아서 제거.
	int removeMemberById(String id);
	
	//전체 멤버 조회시 필요
	List<Members> getMembers();
	
	//아이디 찾기
	List findMemberId(HashMap map);
	
	// 잃어버린 비밀번호 찾기
	String findMemberPassword(HashMap map);
	
	//  임시비밀번호로 바꿔주기
	int updateMemberPassword(HashMap map);
	
	//  아이디 조회시 paging 처리관련
	int selectCountMembers();
	
	//  아이디 조회시 paging 처리관련
	List<Members> getMembersPaging(int pageNo);
}
