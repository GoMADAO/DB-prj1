package cs4111.model;

public class Stat {
	private Integer courseid;
	private String cwid;
	private String coursename;
	private Integer stuNum;
	
	public void setCSid(Integer id){
		this.courseid=id;
	}
	public void setCWid(String id){
		this.cwid=id;
	}
	public void setCSname(String name){
		this.coursename=name;
	}
	public void setSTUnum(Integer num){
		this.stuNum=num;
	}
	public Integer getCSid(){
		return this.courseid;
	}
	public String getCWid(){
		return this.cwid;
	}
	public String getCSname(){
		return this.coursename;
	}
	public Integer getSTUnum(){
		return this.stuNum;
	}
}
