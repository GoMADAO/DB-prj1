package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class CourseReqBean {
	
	public void courseReqBean(String stuname, Course course){
	ArrayList<Integer> IDArr= new ArrayList<Integer>();
	ArrayList<String> NameArr= new ArrayList<String>();
	ArrayList<String> DescArr= new ArrayList<String>();
	ResultSet rs = null;
	DBConn conn =new DBConn();
	String query = new String();
	query = "SELECT c.course_id, c.course_name, c.course_desc FROM course c, reg_for r WHERE r.student_id='"+stuname+"' and c.course_id = r.course_id";
	rs = conn.doSelect(query);
	try {
		while(rs.next()){
		IDArr.add(Integer.parseInt(rs.getString("course_id")));
		NameArr.add(rs.getString("course_name"));
		DescArr.add(rs.getString("course_desc"));
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
	course.setID(IDArr);
	course.setName(NameArr);
	course.setDesc(DescArr);
	}
}
