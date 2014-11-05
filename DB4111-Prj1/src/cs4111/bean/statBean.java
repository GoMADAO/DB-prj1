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
	
	
}
