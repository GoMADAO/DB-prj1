package cs4111.model;

import java.sql.Date;
import java.sql.Timestamp;


public class Courwork {
	private Integer workid;
	private Date reldate;
	private Timestamp duedate;
	private String name;
	private String link;
	private String coursename;
	
	public void setCoursename(String name){
		this.coursename = name;
	}
	public String getCoursename(){
		return this.coursename;
	}
	public void setWorkId(Integer id){
		this.workid = id;
	}
	public void setRelDate(Date date){
		//SimpleDateFormat f=new SimpleDateFormat("MM-DD-YY");
		this.reldate =date;
	}
	public void setDueDate(Timestamp tt){
		this.duedate = tt;
	}
	public void setName(String name){
		this.name = name;
	}
	public void setLink(String link){
		this.link = link;
	}
	public String getName(){
		return this.name;
	}
	public String getLink(){
		return this.link;
	}
	public Integer getWorkId(){
		return this.workid;
	}
	public Date getRelDate(){
		return this.reldate;
	}
	public Timestamp getDueDate(){
		return this.duedate;
	}
}
