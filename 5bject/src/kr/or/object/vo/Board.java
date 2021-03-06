package kr.or.object.vo;

import java.io.Serializable;
import java.util.Date;

public class Board implements Serializable{
	private int writeNo;
	private String id;
	private String title;
	private String content;
	private Date date;
	private int notice;
	private int hit;
	private int reply;
	private int ref;

	public Board() {
	}

	public Board(String id, String title, String content, int notice, int ref) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.notice = notice;
		this.ref = ref;
	}

	public Board(int writeNo, String id, String title, String content, Date date, int notice, int hit, int reply,
			int ref) {
		super();
		this.writeNo = writeNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.notice = notice;
		this.hit = hit;
		this.reply = reply;
		this.ref = ref;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + hit;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + notice;
		result = prime * result + ref;
		result = prime * result + reply;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + writeNo;
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
		Board other = (Board) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (hit != other.hit)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (notice != other.notice)
			return false;
		if (ref != other.ref)
			return false;
		if (reply != other.reply)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (writeNo != other.writeNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Board [writeNo=" + writeNo + ", id=" + id + ", title=" + title + ", content=" + content + ", date="
				+ date + ", notice=" + notice + ", hit=" + hit + ", reply=" + reply + ", ref=" + ref + "]";
	}

	
}