package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public String getTotalTime(String cwid, String stuid){
		ResultSet rs =null;
		String sql = "select sum(t.spent_time) as totalTime from day_task t, is_sche s where s.student_id="
						+stuid+" and s.plan_id = t.plan_id and s.coursework_id = "+cwid;
		conn.getConn();
		rs = conn.doSelect(sql);
		String ttime = new String();
		try {
			if(rs.next()){
				ttime = rs.getString("totalTime");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ttime;
	}
	
	public String getModif(String stuid, String plid){
		ResultSet rs =null;
		String sql = "select sum(m.times_of_modif) as totalMod from mstone m, "
						+ "is_sche i where i.student_id ="+stuid+" and "
						+ "i.plan_id = m.plan_id and m.plan_id = "+plid;
		conn.getConn();
		rs = conn.doSelect(sql);
		String ttmod = new String();
		try {
			if(rs.next()){
				ttmod = rs.getString("totalMod");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ttmod;
	}
	
	public String getNumofReg(String courseid){
		ResultSet rs =null;
		String sql = "select count(*) as numofreg from reg_for where course_id ="+courseid;
		conn.getConn();
		rs = conn.doSelect(sql);
		String s = new String();
		try {
			if(rs.next()){
				s = rs.getString("numofreg");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	public String getNumofPlan(String courseid){
		ResultSet rs =null;
		String sql = "select count(*) as numofplan from is_sche s join is_assn a "
				+ "on s.coursework_id = a.coursework_id "
				+ "where course_id ="+courseid;
		conn.getConn();
		rs = conn.doSelect(sql);
		String s = new String();
		try {
			if(rs.next()){
				s = rs.getString("numofplan");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	public String getAvgProg(String courseid){
		ResultSet rs =null;
		String sql = "select case when avg(t.mw) is null then 0 else  avg(t.mw) end"
				+ " as avgprog from ( select plan_id, max(weight) as mw"
				+ " from day_task group by plan_id ) t join is_sche s"
				+ " on s.plan_id = t.plan_id join is_assn a on s.coursework_id = a.coursework_id"
				+ " where a.course_id"+ courseid;
		
		conn.getConn();
		rs = conn.doSelect(sql);
		String s = new String();
		try {
			if(rs.next()){
				s = rs.getString("avgprog");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	
	
}
