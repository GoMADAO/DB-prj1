package cs4111.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CourseList {
	private ArrayList<Course> courseList;
	public CourseList(){
		super();
	}
	public void setClist(List<Course> l){
		this.courseList = (ArrayList<Course>) l;
	}
	public ArrayList<Course> getClist(){
		return this.courseList;
	}
	
//test	
//	public static void main(String[] args) {
//		Cou c1=new Cou();
//		c1.setCid(123);
//		Cou c2=new Cou();
//		c2.setCid(234);
//		List<Cou> l =new ArrayList<Cou>();
//		l.add(c1);
//		l.add(c2);
//		CourseList cl= new CourseList();
//		cl.setClist(l);
//		
//		ArrayList<Cou> a = new ArrayList<Cou>();
//		a = cl.getClist();
//		Iterator<Cou> it1 = a.iterator();
//		while(it1.hasNext()){
//		System.out.println(it1.next());
//		}
//		
//		for(int i = 0;i < a.size(); i ++){
//			System.out.println(a.get(i).getCid());
//		}
//	}
}
