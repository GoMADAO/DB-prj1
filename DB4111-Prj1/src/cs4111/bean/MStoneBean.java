package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.model.MStone;
import cs4111.model.MStoneList;
import cs4111.util.DBConn;

public class MStoneBean {
	public DBConn conn;
	
	public MStoneBean(){
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
	public MStoneList getMStoneList(String planid){
		ResultSet rs = null;
		String sql = new String("SELECT * FROM mstone WHERE plan_id ="+planid);
		MStoneList msl = new MStoneList();
		ArrayList<MStone> msarr = new ArrayList<MStone>();
		conn.getConn();
		rs= conn.doSelect(sql);
		try {
			while(rs.next()){
				MStone ms = new MStone();
				ms.setMstoneid(Integer.parseInt(rs.getString("milestone_id")));
				ms.setStatus(rs.getString("status"));
				ms.setDesc(rs.getString("milestone_desc"));
				ms.setTimesmodif(Integer.parseInt(rs.getString("times_of_modif")));
				ms.setWeight(Integer.parseInt(rs.getString("weight")));
				ms.setDeadline(rs.getDate("deadline"));
				msarr.add(ms);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		msl.setMStoneList(msarr);
		return msl;
	}
	
	public MStoneList newMstone(String planid, String deadline, String weight, String desc){
		String[] ddl = deadline.split("\\,");
		String dayMon = ddl[0]; String spcYear = ddl[1];
		String year = spcYear.split("\\ ")[1];
		String[] dm = dayMon.split("\\ ");
		String day = dm[0]; String mon = dm[1];
		if (day.length()==1){
			day = "0"+day;
		}
		weight = weight.split("\\%")[0];
//		String sql = new String("INSERT INTO mstone(plan_id,times_of_modif,milestone_desc,weight,status,deadline) "
//				+ "VALUES("+planid+",0,'"+desc+"',"+weight+",62,to_date('"+day+"-"+mon+"-"+year+"','DD-MONTH-YYYY');");
		String sql = new String("INSERT INTO mstone(plan_id,times_of_modif,milestone_desc,weight,status,deadline) "
				+ "VALUES(3,0,'test',20,62,to_date('02-November-2014','DD-MONTH-YYYY'))");
		conn.getConn();
		conn.doInsert(sql);
		ResultSet rs = null;
		System.out.print(sql);
		sql = "SELECT * FROM mstone WHERE milestone_id = (select mstoneSeq.currval from dual)";
		MStoneList msl = new MStoneList();
		ArrayList<MStone> msarr = new ArrayList<MStone>();
		rs= conn.doSelect(sql);
		try {
			while(rs.next()){
				MStone ms = new MStone();
				ms.setMstoneid(Integer.parseInt(rs.getString("milestone_id")));
				ms.setStatus(rs.getString("status"));
				ms.setDesc(rs.getString("milestone_desc"));
				ms.setTimesmodif(Integer.parseInt(rs.getString("times_of_modif")));
				ms.setWeight(Integer.parseInt(rs.getString("weight")));
				ms.setDeadline(rs.getDate("deadline"));
				msarr.add(ms);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		msl.setMStoneList(msarr);
		return msl;
	}
}
