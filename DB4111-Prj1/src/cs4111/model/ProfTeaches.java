package cs4111.model;

public class ProfTeaches {
	private Integer StaffID;
	private Integer CourseID;
	private String CourseName;
	private Integer ProfID;
	private String ProfName;
	private String ProfConc;
	private String OfficeHour;
	private String OfficeLoc;
	
	public void setStaffID(Integer sid){
		this.StaffID = sid;
	}
	public void setName(String name){
		this.ProfName = name;
	}
	public void setCourseID(Integer cid){
		this.CourseID = cid;
	}
	public void setCourseName(String cname){
		this.CourseName = cname;
	}
	public void setProfID(Integer tid){
		this.ProfID = tid;
	}
	public void setProfConc(String conc){
		this.ProfConc = conc;
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
		return this.ProfName;
	}
	public Integer getCourseID(){
		return this.CourseID;
	}
	public String getCourseName(){
		return this.CourseName;
	}
	public Integer getProfID(){
		return this.ProfID;
	}
	public String getProfConc(){
		return this.ProfConc;
	}
	public String getOfficeHour(){
		return this.OfficeHour;
	}
	public String getOfficeLoc(){
		return this.OfficeLoc;
	}

}
