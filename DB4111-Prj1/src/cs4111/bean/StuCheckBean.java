package cs4111.bean;
import java.sql.ResultSet;
import java.sql.SQLException;

import cs4111.util.DBConn;
import cs4111.bean.Student;

public class StuCheckBean {

	public boolean checkStu(Student stu){
		if(!stu.getName().equals("") || stu.getName()!=null){
			ResultSet rs = null;
			DBConn db =new DBConn();
			String sql = new String("SELECT password FROM STUDENT WHERE STUDENT_ID ='"+stu.getName()+"'");
			rs = db.doSelect(sql);
			try {
				if(rs.next()){
					if(stu.getPwd().equals(rs.getString("password")))
						return true;
				}
				rs.close();
				db.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}
	public void stuName(Student stu){
		ResultSet rs = null;
		DBConn db =new DBConn();
		String sql = new String("SELECT name FROM STUDENT WHERE STUDENT_ID ='"+stu.getName()+"'");
		rs = db.doSelect(sql);
		try {
			if(rs.next()){
				stu.setStuName(rs.getString("name"));
				rs.close();
				db.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
