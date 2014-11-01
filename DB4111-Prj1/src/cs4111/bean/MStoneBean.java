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

}
