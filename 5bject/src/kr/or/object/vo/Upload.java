package kr.or.object.vo;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Upload implements Serializable{
//	private String comment;
//	private List upfile;
	private String requestId;
	private String requestInfo;
	private String date;

	public Upload() {
		super();
	}

	public Upload(String requestId, String requestInfo, String date) {
		this.requestId = requestId;
		this.requestInfo = requestInfo;
		this.date = date;
	}

//	public String getComment() {
//		return comment;
//	}
//
//	public void setComment(String comment) {
//		this.comment = comment;
//	}
//
//	public List getUpfile() {
//		return upfile;
//	}
//
//	public void setUpfile(List upfile) {
//		this.upfile = upfile;
//	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getRequestInfo() {
		return requestInfo;
	}

	public void setRequestInfo(String requestInfo) {
		this.requestInfo = requestInfo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	


	
	
}
