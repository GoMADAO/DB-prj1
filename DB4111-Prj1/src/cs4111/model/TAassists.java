package cs4111.model;

public class TAassists {
	private Integer StaffID;
	private Integer CourseID;
	private String CourseName;
	private Integer TAid;
	private String TAname;
	private String OfficeHour;
	private String OfficeLoc;
	
	public void setStaffID(Integer sid){
		this.StaffID = sid;
	}
	public void setName(String name){
		this.TAname = name;
	}
	public void setCourseID(Integer cid){
		this.CourseID = cid;
	}
	public void setCourseName(String cname){
		this.CourseName = cname;
	}
	public void setTAid(Integer tid){
		this.TAid = tid;
	}
	public void setOfficeHour(String officeh){
		this.OfficeHour = officeh;
	}
	public void setOfficeLoc(String officel){
		this.OfficeLoc = officel;
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
	public String getCourseName(){
		return this.CourseName;
	}
	public Integer getTAid(){
		return this.TAid;
	}
	public String getOfficeHour(){
		return this.OfficeHour;
	}
	public String getOfficeLoc(){
		return this.OfficeLoc;
	}
}
