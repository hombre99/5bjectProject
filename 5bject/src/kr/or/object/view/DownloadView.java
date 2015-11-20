package kr.or.object.view;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//고객문의 요청시 파일을 업로드고 해당파일을 저장하기 위해 class
//CHJ 20151118 
public class DownloadView extends AbstractView{
		public String getContentType(){
			return "application/octect-stream";
		}
		
		public void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) throws Exception{
			String fileName= (String)model.get("downFileName");
			System.out.println("파일이름");
			//file내용 한글로도 받을 수 있게 끔 설정해줌
			String downFileName= new String(fileName.getBytes("euc-kr"),"8859_1");
			//1.contentType값 설정
			System.out.println(downFileName+ "-1");
			response.setContentType(getContentType());
			response.setHeader("content-disposition", "attachment;filename="+downFileName);
			FileInputStream fi = new FileInputStream("c:\\java\\request\\"+downFileName);
			System.out.println(downFileName+ "-2");
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(fi, os);
			
		}
}
