package kr.or.object.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import kr.or.object.vo.Members;

public class MemberValidator implements Validator {

   @Override
   public boolean supports(Class<?> clazz) {
      return clazz.isAssignableFrom(Members.class);
   }

   @Override
   public void validate(Object target, Errors errors){
      if ( !supports(target.getClass()) ) {
         errors.reject("notsupport", "적절하지 않은 객체입니다.");
      }


      Members member = (Members)target;   
      if (member.getId().trim().isEmpty()){
         errors.rejectValue("id", "required", new Object[]{"고객 아이디는"}, "아이디는 필수 입니다.");
      }else{
    	  if(member.getId().trim().length()<8){
    		  errors.rejectValue("id", "idLength", new Object[]{"고객아이디는"}, "8글자 이상되어야합니다.");
    	  }
      } 
      if (member.getPassword().trim().isEmpty() ) {
         errors.rejectValue("password", "required", new Object[]{"고객 password"}, "password를 입력해주세요.");
      }      
      //20151124 ADD
      if(member.getName().trim().isEmpty()||member.getName().trim().length()==1){
         errors.rejectValue("name","required", new Object[]{"name"}, "이름을 입력해주세요");
      }
      //20151125 CHJ 수정 Month와 Day
      if( member.getMonth().equals("선택하세요")) {
         errors.rejectValue("day", "birth", new Object[]{"달(Month)"},"정확하게 설정해주세요.");
      }      
      if (member.getDay()==0){
         errors.rejectValue("day", "birth",new Object[]{"월(Day)"}, "정확하게 설정해주세요.");
      }      
      // 20151116 ADD. CHJ   
      if ( member.getEmailAddress() == "선택하세요") {
         errors.rejectValue("emailAddress", "emailAddress", "이메일을 정확하게 선택하여 주세요");
      }   
      if ( member.getEmailId().trim().length()==0) {
         errors.rejectValue("emailId", "emailId", "이메일을 정확하게 입력하여 주세요");
      }         
      // 20151116 ADD. CHJ
      if (member.getGender()==null){
         errors.rejectValue("gender", "gender", "성별을 선택하여 주세요.");
      }

      // 20151116 ADD. CHJ
     /* if(member.getPhoneNumber()==0){
    	  errors.rejectValue("phoneNumber", "required", new Object[]{"핸드폰 번호"},"핸드폰번호를 입력해주세요");
      }else{
      if (member.getPhoneNumber()<1000000000||member.getPhoneNumber()>2000000000){
         errors.rejectValue("phoneNumber", "phone", "핸드폰 번호는 11글자입니다.");
      }
   } */
   }
}