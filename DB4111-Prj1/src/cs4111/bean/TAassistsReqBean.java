package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class TAassistsReqBean {
	public void assists(String crsid, TAassistsList ta){
		ArrayList<TAassists> taList = new ArrayList<TAassists>();
		ResultSet rs = null;
		DBConn conn =new DBConn();
		String query = new String();
		
		query = "SELECT a.staff_id, t.ta_id, s.name, s.office_hour, s.office_location, c.course_name "
				+ "FROM ta t, assists a, staff s, course c "
				+ "WHERE  c.course_id ="+crsid+" and a.course_id ="+crsid+" and a.staff_id = t.staff_id and a.staff_id = s.staff_id ORDER BY a.staff_id";
		rs = conn.doSelect(query);
		try {
			while(rs.next()){
				TAassists t=new TAassists();
				t.setStaffID(Integer.parseInt(rs.getString("staff_id")));
				t.setName(rs.getString("name"));
				t.setTAid(Integer.parseInt(rs.getString("ta_id")));
				t.setCourseName(rs.getString("course_name"));
				t.setOfficeHour(rs.getString("office_hour"));
				t.setOfficeLoc(rs.getString("office_location"));
				taList.add(t);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ta.setTAlist(taList);
	}
}
