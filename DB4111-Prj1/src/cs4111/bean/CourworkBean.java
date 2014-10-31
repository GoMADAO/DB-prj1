package cs4111.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class CourworkBean {
	public void getCurWork(CourseList cl, CourworkList cwl){
		ArrayList<Course> courselist = new ArrayList<Course>(cl.getClist());
		
		ResultSet rs =null;
		
	}
	public void reqCouwork(String courseid, CourworkList cwl){
		ArrayList<Courwork> courworklist = new ArrayList<Courwork>();
		
		ResultSet rs = null;
		DBConn conn =new DBConn();
		SimpleDateFormat f=new SimpleDateFormat("MM-DD-YY");
		String sql = new String("SELECT * FROM is_assn WHERE course_id ="+courseid);
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
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cwl.setCourseworkList(courworklist);
		
		
	}
	
//	public static void main(String args[]){
//		String a = "4111";
//		CourworkBean cwb =new CourworkBean();
//		CourworkList cwl =new CourworkList();
//		cwb.reqCouwork(a, cwl);
//		
//		ArrayList<Courwork> courworklist = new ArrayList<Courwork>();
//		courworklist =cwl.getCourworkList();
//		for(int i =0; i<courworklist.size();i++){
//			System.out.println(courworklist.get(i).getRelDate());
//			System.out.println(courworklist.get(i).getLink());
//		}
//		
//	}
	
}
