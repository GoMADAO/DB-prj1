package cs4111.bean;

import java.util.ArrayList;

public class Course {
	private ArrayList<Integer> courseID;
	private ArrayList<String> courseName;
	private ArrayList<String> courseDesc;;
	
	public void setID(ArrayList<Integer> ID){
		this.courseID = ID;
	}
	public void setName(ArrayList<String> name){
		this.courseName = name;
	}
	public void setDesc(ArrayList<String> desc){
		this.courseDesc = desc;
	}
	public ArrayList<Integer> getID(){
		return this.courseID;
	}
	public ArrayList<String> getName(){
		return this.courseName;
	}
	public ArrayList<String> getDesc(){
		return this.courseDesc;
	}
}
