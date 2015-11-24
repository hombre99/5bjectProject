package kr.or.object.vo;

import java.util.Date;

public class Board{
   
   private int writeNo;
   private String id;
   private String title;
   private String content;
   private Date date;
   private int hit;
   private int ref;
   
   public Board(){}

   public Board(int writeNo, String id, String title, String content, Date date, int hit, int ref) {
      super();
      this.writeNo = writeNo;
      this.id = id;
      this.title = title;
      this.content = content;
      this.date = date;
      this.hit = hit;
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

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((content == null) ? 0 : content.hashCode());
      result = prime * result + ((date == null) ? 0 : date.hashCode());
      result = prime * result + hit;
      result = prime * result + ((id == null) ? 0 : id.hashCode());
      result = prime * result + ref;
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
      if (ref != other.ref)
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
            + date + ", hit=" + hit + ", ref=" + ref + "]";
   }
   
}