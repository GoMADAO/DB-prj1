package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.model.Courwork;
import cs4111.model.CourworkList;
import cs4111.model.Plan;
import cs4111.model.PlanList;
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
	
	public void getCurPlan(PlanList plist, CourworkList cwl, String stuid){
		ArrayList<Courwork> courworklist = cwl.getCourworkList();
		ResultSet rs =null;
		StringBuffer sql = new StringBuffer("SELECT * FROM is_sche sch, plan p WHERE p.plan_id = sch.plan_id AND sch.student_id ='"+stuid+"' AND sch.coursework_id IN (");
		for(int i=0; i<courworklist.size();i++){
			sql.append(courworklist.get(i).getWorkId()+",");
		}
		sql.deleteCharAt(sql.length()-1);
		sql.append(") ORDER BY sch.plan_id");
		System.out.println(sql);
		conn.getConn();
		rs = conn.doSelect(sql.toString());
		ArrayList<Plan> planlist = new ArrayList<Plan>();
		try {
			while(rs.next()){
				Plan pl =new Plan();
				pl.setPlanid(Integer.parseInt(rs.getString("plan_id")));
				pl.setStdate(rs.getDate("start_date"));
				pl.setEddate(rs.getDate("end_date"));
				pl.setCWid(Integer.parseInt(rs.getString("coursework_id")));
				if(rs.getString("turn_on")!=null){
				pl.setTurnon(Integer.parseInt(rs.getString("turn_on")));
				}
				planlist.add(pl);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		plist.setPlanList(planlist);
	}
	
	public static void main(String[] args){
		PlanBean p = new PlanBean();
		Plan pl = new Plan();
		p.insPlan(pl,"1","1");
	}
}
