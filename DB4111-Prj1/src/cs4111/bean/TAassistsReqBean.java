package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class TAassistsReqBean {
	public void assists(String crsid, TAassists ta){
		ArrayList<Integer> staffIDArr= new ArrayList<Integer>();
		ArrayList<Integer> taIDArr= new ArrayList<Integer>();
		ArrayList<String> taNameArr= new ArrayList<String>();
		ResultSet rs = null;
		DBConn conn =new DBConn();
		String query = new String();
		
		query = "SELECT a.staff_id, t.ta_id, s.name FROM ta t, assists a, staff s WHERE a.course_id ="+crsid+" and a.staff_id = t.staff_id and a.staff_id = s.staff_id";
		rs = conn.doSelect(query);
		try {
			while(rs.next()){
				staffIDArr.add(Integer.parseInt(rs.getString("staff_id")));
				taIDArr.add(Integer.parseInt(rs.getString("ta_id")));
				taNameArr.add(rs.getString("name"));
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ta.setStaffID(staffIDArr);
		ta.setTAid(taIDArr);
		ta.setName(taNameArr);
	}
}
