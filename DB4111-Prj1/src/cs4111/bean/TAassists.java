package cs4111.bean;

import java.util.ArrayList;

public class TAassists {
	ArrayList<Integer> StaffID = new ArrayList<Integer>();
	ArrayList<Integer> CourseID = new ArrayList<Integer>();
	ArrayList<Integer> TAid = new ArrayList<Integer>();
	ArrayList<String> TAname = new ArrayList<String>();
	
	public void setStaffID(ArrayList<Integer> sID){
		this.StaffID = sID;
	}
	public void setCourseID(ArrayList<Integer> CourseID){
		this.StaffID = CourseID;
	}
	public void setTAid(ArrayList<Integer> tID){
		this.TAid = tID;
	}
	public void setName(ArrayList<String> name){
		this.TAname = name;
	}
	public ArrayList<Integer> getStaffID(){
		return this.StaffID;
	}
	public ArrayList<Integer> getCourseID(){
		return this.CourseID;
	}
	public ArrayList<Integer> getTAid(){
		return this.TAid;
	}
	public ArrayList<String> getName(){
		return this.TAname;
	}
}
