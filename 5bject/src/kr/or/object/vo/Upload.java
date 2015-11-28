package kr.or.object.vo;
import java.io.Serializable;


public class Upload implements Serializable{

	private String id;
	private String requestInfo;
	private String date;
	private Members members;
	
	private static final long serialVersionUID = 1L;
	public Upload() {
		super();
	}
	//SELECT할때 필요한 생성자.	
		public Upload(String id, String requestInfo, String date, Members members) {
			super();
			this.id = id;
			this.requestInfo = requestInfo;
			this.date = date;
			this.members = members;
		}
	public Upload(String id, String requestInfo, String date) {
		super();
		this.id = id;
		this.requestInfo = requestInfo;
		this.date = date;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
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
	
	public Members getMembers() {
		return members;
	}
	
	public void setMembers(Members members) {
		this.members = members;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((members == null) ? 0 : members.hashCode());
		result = prime * result + ((requestInfo == null) ? 0 : requestInfo.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Upload other = (Upload) obj;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (members == null) {
			if (other.members != null)
				return false;
		} else if (!members.equals(other.members))
			return false;
		if (requestInfo == null) {
			if (other.requestInfo != null)
				return false;
		} else if (!requestInfo.equals(other.requestInfo))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Upload [id=" + id + ", requestInfo=" + requestInfo + ", date=" + date + ", members=" + members + "]";
	}
	

}
