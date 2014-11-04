package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import cs4111.model.Plan;
import cs4111.util.DBConn;

public class PlanBean {
	public DBConn conn;
	
	public PlanBean(){
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
	public void insPlan(Plan pl, String courseid, String stuid){
		if(pl.getPlanid()!=null)
			return;
		String sql = "Insert into plan (start_date,end_date) values (to_date('"+pl.getStdate()+"','MM-DD-YY')"
				+", to_date('"+pl.getEddate()+"','MM-DD-YY'))";
		
		conn.getConn();
		System.out.println(sql);
		conn.doInsert(sql);
		String s = "{? = call getplanseq()}";
		String pid = conn.doFunction(s);
		sql = "insert into is_sche values ("+pid+","+courseid+",'"+stuid+"')";
		conn.doInsert(sql);
		
		
	}
	public Plan getPlan(String courseworkid, String studentid){
		ResultSet rs =null;
		String sql = new String("SELECT p.plan_id, p.start_date, p.end_date, "
				+ "p.turn_on FROM PLAN p JOIN is_sche i ON "
				+ "p.plan_id=i.plan_id WHERE i.coursework_id = "+courseworkid
				+ " and i.student_id = '" +studentid +"'");
		Plan pl = new Plan();
		conn.getConn();
		rs = conn.doSelect(sql);
		try {
			if(rs.next()){
				pl.setPlanid(Integer.parseInt(rs.getString("plan_id")));
				pl.setStdate(rs.getDate("start_date"));
				pl.setEddate(rs.getDate("end_date"));
				pl.setTurnon(Integer.parseInt(rs.getString("turn_on")));
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pl;
	}
	public static void main(String[] args){
		PlanBean p = new PlanBean();
		Plan pl = new Plan();
		p.insPlan(pl,"1","1");
	}
}
