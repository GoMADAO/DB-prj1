package cs4111.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs4111.util.DBConn;

public class ChapterReqBean {
	public DBConn conn;
	
	public ChapterReqBean(){
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
	public void getChap(String crsid, ChapterList chaplist){
		ArrayList<Chapter> chap = new ArrayList<Chapter>();
		ResultSet rs = null;
		conn.getConn();
		String query = new String();
		
		query = "SELECT ch.chapter_title, c.course_name "
				+ "FROM chapter ch, course c "
				+ "WHERE ch.course_id ="+crsid+" AND c.course_id = "+crsid;
		rs = conn.doSelect(query);
		try {
			while(rs.next()){
				Chapter ch = new Chapter();
				ch.setCourseName(rs.getString("course_name"));
				ch.setTitle(rs.getString("chapter_title"));
				chap.add(ch);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		chaplist.setChapList(chap);
	}
}
