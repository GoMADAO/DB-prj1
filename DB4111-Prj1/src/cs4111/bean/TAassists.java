package cs4111.bean;

public class TAassists {
	private Integer StaffID;
	private Integer CourseID;
	private Integer TAid;
	private String TAname;
	
	public void setStaffID(Integer sid){
		this.StaffID = sid;
	}
	public void setName(String name){
		this.TAname = name;
	}
	public void setCourseID(Integer cid){
		this.CourseID = cid;
	}
	public void setTAid(Integer tid){
		this.TAid = tid;
	}
	public Integer getStaffID(){
		return this.StaffID;
	}
	public String getName(){
		return this.TAname;
	}
	public Integer getCourseID(){
		return this.CourseID;
	}
	public Integer TAid(){
		return this.TAid;
	}
}
