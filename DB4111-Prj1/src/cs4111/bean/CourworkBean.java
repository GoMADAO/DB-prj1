package cs4111.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;



import java.text.SimpleDateFormat;

import cs4111.model.Course;
import cs4111.model.CourseList;
import cs4111.model.Courwork;
import cs4111.model.CourworkList;
import cs4111.util.DBConn;

public class CourworkBean {
	public DBConn conn;
	
	public CourworkBean(){
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

	
	public Courwork getACourwork(String courseworkid){
		ResultSet rs= null;
		String sql = new String("Select * from is_assn where coursework_id = "+courseworkid);
		conn.getConn();
		rs= conn.doSelect(sql);
		Courwork cw =new Courwork();
		try {
			if(rs.next()){
				cw.setWorkId(Integer.parseInt(rs.getString("coursework_id")));
				cw.setRelDate(rs.getDate("release_date"));
				cw.setDueDate(rs.getTimestamp("due_date"));
				//cw.setDueDate(Timestamp.valueOf(rs.getString("due_date")));
				cw.setLink(rs.getString("link"));
				cw.setName(rs.getString("name"));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cw;
	}
	public void getCurWork(CourseList cl, CourworkList cwl){
		ArrayList<Course> courselist = new ArrayList<Course>(cl.getClist());
		
		ResultSet rs =null;
		java.sql.Date now=new java.sql.Date(System.currentTimeMillis());
		SimpleDateFormat df = new SimpleDateFormat("MM-dd-YY");//设置日期格式
		
		StringBuffer sql =new StringBuffer("SELECT * FROM is_assn WHERE course_id IN (");
		for(int i=0; i<courselist.size();i++){
			sql.append(courselist.get(i).getCid()+",");
		}
		sql.deleteCharAt(sql.length()-1);
		sql.append(") AND release_date < to_date('");   //
		sql.append(df.format(now) + "', 'mm-dd-yy') AND due_date > to_date('");
		sql.append(df.format(now) + "', 'mm-dd-yy') ORDER BY due_date DESC");
		//System.out.println(sql);
		conn.getConn();
		rs = conn.doSelect(sql.toString());
		//courworklist
		ArrayList<Courwork> courworklist = new ArrayList<Courwork>();
		try {
			while(rs.next()){
				Courwork cw =new Courwork();
				cw.setWorkId(Integer.parseInt(rs.getString("coursework_id")));
				cw.setRelDate(rs.getDate("release_date"));
				cw.setDueDate(rs.getTimestamp("due_date"));
				//cw.setDueDate(Timestamp.valueOf(rs.getString("due_date")));
				cw.setLink(rs.getString("link"));
				cw.setName(rs.getString("name"));
				courworklist.add(cw);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		cwl.setCourseworkList(courworklist);
	}
	public void reqCouwork(String courseid, CourworkList cwl){
		ArrayList<Courwork> courworklist = new ArrayList<Courwork>();
		
		ResultSet rs = null;
		//DBConn conn =new DBConn();
		
		//SimpleDateFormat f=new SimpleDateFormat("MM-DD-YY");
		String sql = new String("SELECT * FROM is_assn WHERE course_id ="+courseid
				+" ORDER BY due_date DESC");
		conn.getConn();
		rs= conn.doSelect(sql);
		try {
			while(rs.next()){
				Courwork cw= new Courwork();
				cw.setWorkId(Integer.parseInt(rs.getString("coursework_id")));
				cw.setRelDate(rs.getDate("release_date"));
				cw.setDueDate(rs.getTimestamp("due_date"));
				//cw.setDueDate(Timestamp.valueOf(rs.getString("due_date")));
				cw.setLink(rs.getString("link"));
				cw.setName(rs.getString("name"));
				courworklist.add(cw);
			}
			rs.close();
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cwl.setCourseworkList(courworklist);
		
		
	}
	
	public static void main(String args[]){
		String a = "4111";
		java.sql.Date now=new java.sql.Date(System.currentTimeMillis());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		System.out.println(df.format(now));
		
		CourworkBean cwb =new CourworkBean();
		CourworkList cwl =new CourworkList();
//		cwb.reqCouwork(a, cwl);
//		
//		ArrayList<Courwork> courworklist = new ArrayList<Courwork>();
//		courworklist =cwl.getCourworkList();
//		for(int i =0; i<courworklist.size();i++){
//			System.out.println(courworklist.get(i).getRelDate());
//			System.out.println(courworklist.get(i).getLink());
//		}
		CourseReqBean crb = new CourseReqBean();
		CourseList cl = new CourseList();
		crb.courseReqBean("mg3534", cl);
		cwb.getCurWork(cl, cwl);
		ArrayList<Courwork> courworklist = new ArrayList<Courwork>(); 
		courworklist =cwl.getCourworkList();                          
		for(int i =0; i<courworklist.size();i++){                     
			System.out.println(courworklist.get(i).getRelDate());     
			System.out.println(courworklist.get(i).getLink());        
		}                                                             
	}
	
}
