package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class CourseReqBean {
	
	public void courseReqBean(String stuname, CourseList course){
//	ArrayList<Integer> IDArr= new ArrayList<Integer>();
//	ArrayList<String> NameArr= new ArrayList<String>();
//	ArrayList<String> DescArr= new ArrayList<String>();
	/**
	 * Modification 
	 */
	ArrayList<Cou> courseList = new ArrayList<Cou>();
	
	ResultSet rs = null;
	DBConn conn =new DBConn();
	String query = new String();
	query = "SELECT c.course_id, c.course_name, c.course_desc FROM course c, reg_for r WHERE r.student_id='"+stuname+"' and c.course_id = r.course_id";
	rs = conn.doSelect(query);
	try {
		while(rs.next()){
//		IDArr.add(Integer.parseInt(rs.getString("course_id")));
//		NameArr.add(rs.getString("course_name"));
//		DescArr.add(rs.getString("course_desc"));
		/**
		 * Modi
		 */
		Cou c=new Cou();
		c.setCid(Integer.parseInt(rs.getString("course_id")));
		c.setCname(rs.getString("course_name"));
		c.setCdesc(rs.getString("course_desc"));
		courseList.add(c);
		
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	//close connection
	try {
		rs.close();
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	/**
	 * 
	 * Modi
	 */
//	course.setID(IDArr);
//	course.setName(NameArr);
//	course.setDesc(DescArr);
	course.setClist(courseList);
	}
}
