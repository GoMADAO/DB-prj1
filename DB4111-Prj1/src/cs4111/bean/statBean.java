package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.model.Plan;
import cs4111.model.Stat;
import cs4111.util.DBConn;

public class statBean {
	public DBConn conn;
	public statBean(){
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
	
	public Stat getStat(String cwid){
		ResultSet rs =null;
		String sql ="SELECT count(r.student_id) as num,a.course_id,c.course_name, a.coursework_id "
				+ "FROM is_assn a, reg_for r, course c WHERE a.coursework_id="+cwid+
				" AND a.course_id=r.course_id AND c.course_id = a.course_id";
		conn.getConn();
		rs = conn.doSelect(sql);
		Stat stat = new Stat();
		try {
			if(rs.next()){
				stat.setSTUnum(Integer.parseInt(rs.getString("num")));
				stat.setCSid(Integer.parseInt(rs.getString("course_id")));
				stat.setCSname(rs.getString("course_name"));
				stat.setCWid(rs.getString("coursework_id"));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stat;
	}
}
