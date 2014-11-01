package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class CourseReqBean {
	public DBConn conn;
	
	public CourseReqBean(){
		conn = new DBConn();
	}
	public void closeDBconn(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void courseReqBean(String stuname, CourseList course){
	ArrayList<Course> courseList = new ArrayList<Course>();
	
	ResultSet rs = null;
	//DBConn conn =new DBConn();
	
	String query = new String();
	query = "SELECT c.course_id, c.course_name, c.course_desc FROM course c, reg_for r WHERE r.student_id='"+stuname+"' and c.course_id = r.course_id ORDER BY c.course_id";
	conn.getConn();
	rs = conn.doSelect(query);
	try {
		while(rs.next()){
		Course c=new Course();
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
		//conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	course.setClist(courseList);
	}
}
