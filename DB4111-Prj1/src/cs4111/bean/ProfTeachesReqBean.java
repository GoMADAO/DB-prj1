package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.model.ProfTeaches;
import cs4111.model.ProfTeachesList;
import cs4111.util.DBConn;

public class ProfTeachesReqBean {
	public DBConn conn;
	
	public ProfTeachesReqBean(){
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
	public void teaches(String crsid, ProfTeachesList prof){
		ArrayList<ProfTeaches> profList = new ArrayList<ProfTeaches>();
		ResultSet rs = null;
		conn.getConn();
		String query = new String();
		
		query ="SELECT s.staff_id, s.name, s.office_hour, s.office_location, p.professor_id, p.concentration, c.course_name "
				+ "FROM teaches t, staff s, prof p, course c WHERE t.course_id ="
				+crsid+" AND t.staff_id = s.staff_id AND t.staff_id = p.staff_id AND c.course_id ="+crsid;
		rs = conn.doSelect(query);
		try {
			while(rs.next()){
				ProfTeaches p=new ProfTeaches();
				p.setStaffID(Integer.parseInt(rs.getString("staff_id")));
				p.setName(rs.getString("name"));
				p.setProfID(Integer.parseInt(rs.getString("professor_id")));
				p.setCourseName(rs.getString("course_name"));
				p.setOfficeHour(rs.getString("office_hour"));
				p.setOfficeLoc(rs.getString("office_location"));
				p.setProfConc(rs.getString("concentration"));
				profList.add(p);
			}
			rs.close();
			try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		prof.setProfList(profList);
	}
}
