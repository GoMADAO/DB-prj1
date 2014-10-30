package cs4111.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CourseList {
	private ArrayList<Cou> courseList;
	public CourseList(){
		super();
	}
	public void setClist(List<Cou> l){
		this.courseList = (ArrayList<Cou>) l;
	}
	public ArrayList<Cou> getClist(){
		return this.courseList;
	}
	
//	public static void main(String[] args){
//		Cou c1=new Cou();
//		c1.setCid(123);  
//		Cou c2=new Cou();
//		c2.setCid(234); 
//		List<Cou> l =new ArrayList<Cou>();  
//		
//		
//		
//	}
	
	public static void main(String[] args) {
		Cou c1=new Cou();
		c1.setCid(123);
		Cou c2=new Cou();
		c2.setCid(234);
		List<Cou> l =new ArrayList<Cou>();
		l.add(c1);
		l.add(c2);
		CourseList cl= new CourseList();
		cl.setClist(l);
		
		ArrayList<Cou> a = new ArrayList<Cou>();
		a = cl.getClist();
		Iterator it1 = a.iterator();
		while(it1.hasNext()){
		System.out.println(it1.next());
		}
		
		for(int i = 0;i < a.size(); i ++){
			System.out.println(a.get(i).getCid());
		}
	}
}
