package cs4111.bean;

import java.util.ArrayList;

public class CourworkList {
	private ArrayList<Courwork> CourseworkList;
	
	public ArrayList<Courwork> getCourworkList(){
		return this.CourseworkList;
	}
	public void setCourseworkList(ArrayList<Courwork> arr){
		this.CourseworkList = arr;
	}
}
